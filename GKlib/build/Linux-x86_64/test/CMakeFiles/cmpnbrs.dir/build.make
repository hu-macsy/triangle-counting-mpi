# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

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
CMAKE_COMMAND = /panfs/roc/msisoft/cmake/3.10.2/bin/cmake

# The command to remove a file.
RM = /panfs/roc/msisoft/cmake/3.10.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib/build/Linux-x86_64

# Include any dependencies generated for this target.
include test/CMakeFiles/cmpnbrs.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/cmpnbrs.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/cmpnbrs.dir/flags.make

test/CMakeFiles/cmpnbrs.dir/cmpnbrs.c.o: test/CMakeFiles/cmpnbrs.dir/flags.make
test/CMakeFiles/cmpnbrs.dir/cmpnbrs.c.o: ../../test/cmpnbrs.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib/build/Linux-x86_64/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object test/CMakeFiles/cmpnbrs.dir/cmpnbrs.c.o"
	cd /home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib/build/Linux-x86_64/test && /panfs/roc/msisoft/gcc/8.2.0/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cmpnbrs.dir/cmpnbrs.c.o   -c /home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib/test/cmpnbrs.c

test/CMakeFiles/cmpnbrs.dir/cmpnbrs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cmpnbrs.dir/cmpnbrs.c.i"
	cd /home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib/build/Linux-x86_64/test && /panfs/roc/msisoft/gcc/8.2.0/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib/test/cmpnbrs.c > CMakeFiles/cmpnbrs.dir/cmpnbrs.c.i

test/CMakeFiles/cmpnbrs.dir/cmpnbrs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cmpnbrs.dir/cmpnbrs.c.s"
	cd /home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib/build/Linux-x86_64/test && /panfs/roc/msisoft/gcc/8.2.0/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib/test/cmpnbrs.c -o CMakeFiles/cmpnbrs.dir/cmpnbrs.c.s

test/CMakeFiles/cmpnbrs.dir/cmpnbrs.c.o.requires:

.PHONY : test/CMakeFiles/cmpnbrs.dir/cmpnbrs.c.o.requires

test/CMakeFiles/cmpnbrs.dir/cmpnbrs.c.o.provides: test/CMakeFiles/cmpnbrs.dir/cmpnbrs.c.o.requires
	$(MAKE) -f test/CMakeFiles/cmpnbrs.dir/build.make test/CMakeFiles/cmpnbrs.dir/cmpnbrs.c.o.provides.build
.PHONY : test/CMakeFiles/cmpnbrs.dir/cmpnbrs.c.o.provides

test/CMakeFiles/cmpnbrs.dir/cmpnbrs.c.o.provides.build: test/CMakeFiles/cmpnbrs.dir/cmpnbrs.c.o


# Object files for target cmpnbrs
cmpnbrs_OBJECTS = \
"CMakeFiles/cmpnbrs.dir/cmpnbrs.c.o"

# External object files for target cmpnbrs
cmpnbrs_EXTERNAL_OBJECTS =

test/cmpnbrs: test/CMakeFiles/cmpnbrs.dir/cmpnbrs.c.o
test/cmpnbrs: test/CMakeFiles/cmpnbrs.dir/build.make
test/cmpnbrs: libGKlib.a
test/cmpnbrs: test/CMakeFiles/cmpnbrs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib/build/Linux-x86_64/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable cmpnbrs"
	cd /home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib/build/Linux-x86_64/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cmpnbrs.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/cmpnbrs.dir/build: test/cmpnbrs

.PHONY : test/CMakeFiles/cmpnbrs.dir/build

test/CMakeFiles/cmpnbrs.dir/requires: test/CMakeFiles/cmpnbrs.dir/cmpnbrs.c.o.requires

.PHONY : test/CMakeFiles/cmpnbrs.dir/requires

test/CMakeFiles/cmpnbrs.dir/clean:
	cd /home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib/build/Linux-x86_64/test && $(CMAKE_COMMAND) -P CMakeFiles/cmpnbrs.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/cmpnbrs.dir/clean

test/CMakeFiles/cmpnbrs.dir/depend:
	cd /home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib/build/Linux-x86_64 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib /home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib/test /home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib/build/Linux-x86_64 /home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib/build/Linux-x86_64/test /home/karypisg/tomxx030/distr_tc_cp/graphchallenge/distr_triangle_biggraphs/distr_triangle_2d/GKlib/build/Linux-x86_64/test/CMakeFiles/cmpnbrs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/cmpnbrs.dir/depend

