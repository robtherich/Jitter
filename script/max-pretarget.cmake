# Copyright 2018 The Max-API Authors. All rights reserved.
# Use of this source code is governed by the MIT License found in the License.md file.

string(REGEX REPLACE "(.*)/" "" THIS_FOLDER_NAME "${CMAKE_CURRENT_SOURCE_DIR}")

project(${THIS_FOLDER_NAME})

if (NOT DEFINED C74_MAX_API_DIR)
	set(C74_MAX_API_DIR ${CMAKE_CURRENT_LIST_DIR}/..)
endif ()
set(C74_INCLUDES "${C74_MAX_API_DIR}/include")
set(C74_SCRIPTS "${C74_MAX_API_DIR}/script")

set(C74_CXX_STANDARD 0)

if (APPLE)
	if (CMAKE_OSX_ARCHITECTURES STREQUAL "")
		set(CMAKE_OSX_ARCHITECTURES x86_64)
	endif()
endif ()

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../Syphon/externals")

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG "${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE "${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")

file (STRINGS "${C74_MAX_API_DIR}/script/max-linker-flags.txt" C74_SYM_MAX_LINKER_FLAGS)
file (STRINGS "${C74_MAX_API_DIR}/script/msp-linker-flags.txt" C74_SYM_MSP_LINKER_FLAGS)

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${C74_SYM_MAX_LINKER_FLAGS} ${C74_SYM_MSP_LINKER_FLAGS}")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${C74_SYM_MAX_LINKER_FLAGS} ${C74_SYM_MSP_LINKER_FLAGS}")
set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${C74_SYM_MAX_LINKER_FLAGS} ${C74_SYM_MSP_LINKER_FLAGS}")
