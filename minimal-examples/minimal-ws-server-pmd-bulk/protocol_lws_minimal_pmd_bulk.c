/*
 * ws protocol handler plugin for "lws-minimal-pmd-bulk"
 *
 * Copyright (C) 2010-2018 Andy Green <andy@warmcat.com>
 *
 * This file is made available under the Creative Commons CC0 1.0
 * Universal Public Domain Dedication.
 *
 * The protocol shows how to send and receive bulk messages over a ws connection
 * that optionally may have the permessage-deflate extension negotiated on it.
 */

#if !defined (LWS_PLUGIN_STATIC)
#define LWS_DLL
#define LWS_INTERNAL
#include <libwebsockets.h>
#endif

#include <string.h>

/*
 * We will produce a large ws message either from this text repeated many times,
 * or from 0x40 + a 6-bit pseudorandom number
 */

static const char * const redundant_string =
	"No one would have believed in the last years of the nineteenth "
	"century that this world was being watched keenly and closely by "
	"intelligences greater than man's and yet as mortal as his own; that as "
	"men busied themselves about their various concerns they were "
	"scrutinised and studied, perhaps almost as narrowly as a man with a "
	"microscope might scrutinise the transient creatures that swarm and "
	"multiply in a drop of water.  With infinite complacency men went to "
	"and fro over this globe about their little affairs, serene in their "
	"assurance of their empire over matter. It is possible that the "
	"infusoria under the microscope do the same.  No one gave a thought to "
	"the older worlds of space as sources of human danger, or thought of "
	"them only to dismiss the idea of life upon them as impossible or "
	"improbable.  It is curious to recall some of the mental habits of "
	"those departed days.  At most terrestrial men fancied there might be "
	"other men upon Mars, perhaps inferior to themselves and ready to "
	"welcome a missionary enterprise. Yet across the gulf of space, minds "
	"that are to our minds as ours are to those of the beasts that perish, "
	"intellects vast and cool and unsympathetic, regarded this earth with "
	"envious eyes, and slowly and surely drew their plans against us.  And "
	"early in the twentieth century came the great disillusionment. "
;

/* this reflects the length of the string above */
#define REPEAT_STRING_LEN 1337
/* this is the total size of the ws message we will send */
#define MESSAGE_SIZE (100 * REPEAT_STRING_LEN)
/* this is how much we will send each time the connection is writable */
#define MESSAGE_CHUNK_SIZE (1 * 1024)

/* one of these is created for each client connecting to us */

struct per_session_data__minimal_pmd_bulk {
	int position; /* byte position we got up to sending the message */
	uint64_t rng;
};

static int
callback_minimal_pmd_bulk(struct lws *wsi, enum lws_callback_reasons reason,
			  void *user, void *in, size_t len)
{
	struct per_session_data__minimal_pmd_bulk *pss =
			(struct per_session_data__minimal_pmd_bulk *)user;
	uint8_t buf[LWS_PRE + MESSAGE_CHUNK_SIZE], *p;
	int n, m, msg_flag;

	switch (reason) {
	case LWS_CALLBACK_ESTABLISHED:
		pss->position = 0;
		pss->rng = 4;
		lws_callback_on_writable(wsi);
		break;

	case LWS_CALLBACK_SERVER_WRITEABLE:
		if (pss->position == MESSAGE_SIZE)
			break;

		if (!pss->position)
			msg_flag = LWS_WRITE_TEXT;
		else
			msg_flag = LWS_WRITE_CONTINUATION;

		/* fill up one chunk's worth of message content */

		p = &buf[LWS_PRE];
		n = MESSAGE_CHUNK_SIZE;
		if (n > MESSAGE_SIZE - pss->position)
			n = MESSAGE_SIZE - pss->position;
		/*
		 * select between producing compressible repeated text,
		 * or uncompressible PRNG output
		 */
#if 0
		while (n) {
			m = pss->position % REPEAT_STRING_LEN;
			s = REPEAT_STRING_LEN - m;
			if (s > n)
				s = n;
			memcpy(p, &redundant_string[m], s);
			pss->position += s;
			p += s;
			n -= s;
		}
#else
		pss->position += n;
		while (n--) {
			pss->rng ^= pss->rng << 21;
			pss->rng ^= pss->rng >> 35;
			pss->rng ^= pss->rng << 4;
			*p++ = 0x40 + ((pss->rng >> (n & 15)) & 0x3f);
		}
#endif
		if (pss->position != MESSAGE_SIZE) /* if not the end, no FIN */
			msg_flag |= LWS_WRITE_NO_FIN;

		n = lws_ptr_diff(p, &buf[LWS_PRE]);
		m = lws_write(wsi, &buf[LWS_PRE], n, msg_flag);
		if (m < n) {
			lwsl_err("ERROR %d writing ws\n", n);
			return -1;
		}
		if (pss->position != MESSAGE_SIZE) /* if more to do... */
			lws_callback_on_writable(wsi);
		break;

	default:
		break;
	}

	return 0;
}

#define LWS_PLUGIN_PROTOCOL_MINIMAL_PMD_BULK \
	{ \
		"lws-minimal-pmd-bulk", \
		callback_minimal_pmd_bulk, \
		sizeof(struct per_session_data__minimal_pmd_bulk), \
		4096, \
		0, NULL, 0 \
	}

#if !defined (LWS_PLUGIN_STATIC)

/* boilerplate needed if we are built as a dynamic plugin */

static const struct lws_protocols protocols[] = {
	LWS_PLUGIN_PROTOCOL_MINIMAL_PMD_BULK
};

LWS_EXTERN LWS_VISIBLE int
init_protocol_minimal_pmd_bulk(struct lws_context *context,
			       struct lws_plugin_capability *c)
{
	if (c->api_magic != LWS_PLUGIN_API_MAGIC) {
		lwsl_err("Plugin API %d, library API %d", LWS_PLUGIN_API_MAGIC,
			 c->api_magic);
		return 1;
	}

	c->protocols = protocols;
	c->count_protocols = ARRAY_SIZE(protocols);
	c->extensions = NULL;
	c->count_extensions = 0;

	return 0;
}

LWS_EXTERN LWS_VISIBLE int
destroy_protocol_minimal_pmd_bulk(struct lws_context *context)
{
	return 0;
}
#endif
