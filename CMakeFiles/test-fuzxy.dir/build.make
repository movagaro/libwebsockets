# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/predator/Documents/Project/temp/libwebsockets

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/predator/Documents/Project/temp/libwebsockets

# Include any dependencies generated for this target.
include CMakeFiles/test-fuzxy.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/test-fuzxy.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test-fuzxy.dir/flags.make

CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.o: CMakeFiles/test-fuzxy.dir/flags.make
CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.o: test-apps/fuzxy.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/predator/Documents/Project/temp/libwebsockets/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.o   -c /home/predator/Documents/Project/temp/libwebsockets/test-apps/fuzxy.c

CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/predator/Documents/Project/temp/libwebsockets/test-apps/fuzxy.c > CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.i

CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/predator/Documents/Project/temp/libwebsockets/test-apps/fuzxy.c -o CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.s

CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.o.requires:

.PHONY : CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.o.requires

CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.o.provides: CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.o.requires
	$(MAKE) -f CMakeFiles/test-fuzxy.dir/build.make CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.o.provides.build
.PHONY : CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.o.provides

CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.o.provides.build: CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.o


# Object files for target test-fuzxy
test__fuzxy_OBJECTS = \
"CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.o"

# External object files for target test-fuzxy
test__fuzxy_EXTERNAL_OBJECTS =

bin/libwebsockets-test-fuzxy: CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.o
bin/libwebsockets-test-fuzxy: CMakeFiles/test-fuzxy.dir/build.make
bin/libwebsockets-test-fuzxy: lib/libwebsockets.a
bin/libwebsockets-test-fuzxy: /usr/lib/x86_64-linux-gnu/libssl.so
bin/libwebsockets-test-fuzxy: /usr/lib/x86_64-linux-gnu/libcrypto.so
bin/libwebsockets-test-fuzxy: CMakeFiles/test-fuzxy.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/predator/Documents/Project/temp/libwebsockets/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable bin/libwebsockets-test-fuzxy"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-fuzxy.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test-fuzxy.dir/build: bin/libwebsockets-test-fuzxy

.PHONY : CMakeFiles/test-fuzxy.dir/build

CMakeFiles/test-fuzxy.dir/requires: CMakeFiles/test-fuzxy.dir/test-apps/fuzxy.c.o.requires

.PHONY : CMakeFiles/test-fuzxy.dir/requires

CMakeFiles/test-fuzxy.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test-fuzxy.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test-fuzxy.dir/clean

CMakeFiles/test-fuzxy.dir/depend:
	cd /home/predator/Documents/Project/temp/libwebsockets && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/predator/Documents/Project/temp/libwebsockets /home/predator/Documents/Project/temp/libwebsockets /home/predator/Documents/Project/temp/libwebsockets /home/predator/Documents/Project/temp/libwebsockets /home/predator/Documents/Project/temp/libwebsockets/CMakeFiles/test-fuzxy.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test-fuzxy.dir/depend

