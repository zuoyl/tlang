# See doc/CMake.html for instructions about how to build tlang
project(TLANG)
cmake_minimum_required(VERSION 2.8)

# Add path for custom modoules
set(CMAKE_MODULE_PATH
    ${CMAKE_MODULE_APTH}
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake"
    "${CMAKE_CURRENT_SOURCE_DIR/cmake/modules"
    )

set($(PROJECT_NAME)_MAJOR_VERSION 0)
set($(PROJECT_NAME)_MINOR_VERSION 1)

#allow more human readalbe "if then else" construct
SET (CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS TRUE)

# cmake project name, default language is cxx
PROJECT(TCC CXX)

#project version
SET ($(PROJECT_NAME)_PATCH_LEVEL 0)
SET (TARGET_NAME tcc)

#project option
IF (NOT CMAKE_BUILD_TYPE)
    SET (CMAKE_BUILD_TYPE Debug)
ENDIF()

#add source directories
AUX_SOURCE_DIRECTORY(. COMPILER_RC_LIST)
AUX_SOURCE_DIRECTORY(runtime RUNTIME_SRC_LIST)
AUX_SOURCE_DIRECTORY(ast AST_SRC_LIST)
AUX_SOURCE_DIRECTORY(parser PARSER_SRC_LIST)
AUX_SOURCE_DIRECTORY(expression EXPR_SRC_LIST)
AUX_SOURCE_DIRECTORY(statement STMT_SRC_LIST)
AUX_SOURCE_DIRECTORY(codegen CODEGEN_SRC_LIST)

ADD_EXECUTABLE(${TARGET_NAME}
    ${COMPILER_SRC_LIST}
    ${RUNTIME_SRC_LIST}
    ${AST_SRC_LIST}
    ${PARSER_SRC_LIST}
    ${EXPR_SRC_LIST}
    ${STMT_SRC_LIST}
    ${CODEGEN_SRC_LIST})


#include directoris
INCLUDE_DIRECTORIES("${PROJECT_SOURCE_DIR}/src")

# c++ definitions
ADD_DEFINITIONS("-Wall")
IF (CMAKE_BUILD_TYPE STREQUAL "Debug")
    ADD_DEFINITIONS("-DDEBUG")
ENDIF()

SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR})

# set binary director
SET (EXECUTABLE_BINARY_DIR Build)
SET (EXECUTABLE_OUTPUT_PATH
    ${PROJECT_BINARY_DIR}
    CACHE PATH
    "build and bin directory"
    )

# look for xml2 library
FIND_LIBRARY(XML2_LIBRARY
    NAMES xml2
    PATH /usr/lib /usr/local/lib
    )
FIND_PATH(XML2_INCLUDES parser.h
    /usr/local/include
    /usr/include
    )
INCLUDE_DIRECTORIES( ${XML2_INC_DIR}
    ${PROJECT_SOURCE_DIR}/src
    )
IF(WIN32)
    TARGET_LINK_LIBRARIES(${TARGET_NAME} ${XML2_LIBRARY}, src mingw32)
ELSE(WIN32)
    TARGET_LINK_LIBRARIES(${TARGET_NAME} ${XML2_LIBRARY})
ENDIF(WIN32)

MESSAGE(STATUS "Generating Makefile for linux...")
SET (CMAKE_SYSTEM_NAME Linux) 
# set compiler, the g++ will be used both in linux or windows
SET (CMAKE_C_COMPILER gcc)
SET (CMAKE_CXX_COMPILER g++)
INCLUDE_DIRECTORIES(${PROJECT_SOURECE_DIR}/src /usr/include/libxml2)
LINK_DIRECTORIES(/usr/lib/)
#set default iinstall prefix project root directory
IF (CMAKE_INSTALL_PREFIX STREQUAL "/usr/local")
    SET (CMAKE_INSTALL_PREFIX "${PROJECT_SOURCE_DIR}")
ENDIF()

#display status message for important variables
MESSAGE(STATUS "-------------------------------------------------")
MESSAGE(STATUS "PROJECT_NAME = ${PROJECT_NAME}")
MESSAGE(STATUS "CMAKE_SYSTEM_NAME = ${CMAKE_SYSTEM_NAME}")
MESSAGE(STATUS "PROJECT_SOURCE_DIR = ${PROJECT_SOURCE_DIR}")
MESSAGE(STATUS "CMAKE_BUILD_TYPE = ${CMAKE_BUILD_TYPE}")
MESSAGE(STATUS "CMAKE_MODULE_PATH = ${CMAKE_MODULE_PATH}")
MESSAGE(STATUS "------------------------------------------------")
MESSAGE(STATUS)
