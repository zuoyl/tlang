# See doc/CMake.html for instructions about how to build tlang
project(tlang)
cmake_minimum_required(VERSION 2.8)

# Add path for custom modoules
set(CMAKE_MODULE_PATH
    ${CMAKE_MODULE_APTH}
    "${CMAKE_CURRENT_SOURCE_DIR}/../cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/../cmake/modules"
    )

set($(PROJECT_NAME)_MAJOR_VERSION 0)
set($(PROJECT_NAME)_MINOR_VERSION 1)

#allow more human readalbe "if then else" construct
set(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS TRUE)

# cmake project name, default language is cxx
PROJECT(TCC CXX)

# project version
set(${PROJECT_NAME}_PATCH_LEVEL 0)
set(TARGET_NAME tcc)

message("Project cmake current directory = ${CMAKE_CURRENT_SOURCE_DIR}")

# project source directory
set(PROJECT_SOURCE_DIR  "${CMAKE_CURRENT_SOURCE_DIR}/..")
set(PROJECT_BINARY_DIR ${PROJECT_SOURCE_DIR}/bin)
set(PROJECT_INCLUDE_DIR ${PROJECT_SOURCE_DIR}) 
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

# set grammar file location
set(GRAMMAR_FILE "${CMAKE_CURRENT_SOURCE_DIR}/tlang.grammar")

message("...Project source directory = ${PROJECT_SOURCE_DIR}")
message("...Project include directory = ${PROJECT_INCLUDE_DIR}")
message("...Project binary directory = ${EXECUTABLE_OUTPUT_PATH}")
message("...Project lib directory = ${LIBRARY_OUTPUT_PATH}")

# project option
if (NOT CMAKE_BUILD_TYPE)
    set (CMAKE_BUILD_TYPE Debug)
endif()

#add source directories
aux_source_directory(. COMPILER_SRC_LIST)
aux_source_directory(runtime RUNTIME_SRC_LIST)
aux_source_directory(ast AST_SRC_LIST)
aux_source_directory(parser PARSER_SRC_LIST)
aux_source_directory(expression EXPR_SRC_LIST)
aux_source_directory(statement STMT_SRC_LIST)
aux_source_directory(codegen CODEGEN_SRC_LIST)
aux_source_directory(type CODEGEN_SRC_LIST)

add_executable(${TARGET_NAME}
    ${COMPILER_SRC_LIST}
    ${RUNTIME_SRC_LIST}
    ${AST_SRC_LIST}
    ${PARSER_SRC_LIST}
    ${EXPR_SRC_LIST}
    ${STMT_SRC_LIST}
    ${CODEGEN_SRC_LIST})


#include directoris
include_directories("${PROJECT_INCLUDE_DIR}")

# c++ definitions
add_definitions("-Wall")
if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    add_definitions("-DDEBUG")
    add_definitions("-g")
endif()

# set grammra file location
add_definitions("-DTLANG_GRAMMAR_FILE=\"${GRAMMAR_FILE}\"")
message("...Grammar file = ${GRAMMAR_FILE}")

#set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR})

# set binary director
#set(EXECUTABLE_BINARY_DIR Build)
#set(EXECUTABLE_OUTPUT_PATH
#   ${PROJECT_BINARY_DIR}
#   CACHE PATH
#   "build and bin directory"
#   )

# look for xml2 library
find_library(XML2_LIBRARY
    NAMES xml2
    PATH /usr/lib /usr/local/lib
    )
find_path(XML2_INCLUDES parser.h
    /usr/local/include
    /usr/include
    )
include_directories(
    ${XML2_INC_DIR}
    ${PROJECT_SOURCE_DIR}
    )
if(WIN32)
    TARGET_LINK_LIBRARIES(${TARGET_NAME} ${XML2_LIBRARY}, src mingw32)
else(WIN32)
    TARGET_LINK_LIBRARIES(${TARGET_NAME} ${XML2_LIBRARY})
endif(WIN32)

message(STATUS "Generating Makefile for linux...")
set (CMAKE_SYSTEM_NAME Linux) 

# set compiler, the g++ will be used both in linux or windows
set(CMAKE_C_COMPILER gcc)
set(CMAKE_CXX_COMPILER g++)

include_directories(${PROJECT_SOURECE_DIR}/src /usr/include/libxml2)
link_directories(/usr/lib/)

# set default iinstall prefix project root directory
if (CMAKE_INSTALL_PREFIX STREQUAL "/usr/local")
    set (CMAKE_INSTALL_PREFIX "${PROJECT_SOURCE_DIR}")
endif()

#display status message for important variables
message(STATUS "-------------------------------------------------")
message(STATUS "PROJECT_NAME = ${PROJECT_NAME}")
message(STATUS "CMAKE_SYSTEM_NAME = ${CMAKE_SYSTEM_NAME}")
message(STATUS "PROJECT_SOURCE_DIR = ${PROJECT_SOURCE_DIR}")
message(STATUS "CMAKE_BUILD_TYPE = ${CMAKE_BUILD_TYPE}")
message(STATUS "CMAKE_MODULE_PATH = ${CMAKE_MODULE_PATH}")
message(STATUS "------------------------------------------------")
message(STATUS)
