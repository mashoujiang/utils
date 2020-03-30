cmake_minimum_required(VERSION 3.10)
set(TARGET_NAME utils)
project(${TARGET_NAME} VERSION 1.0.0 LANGUAGES CXX)

#find_package(OpenCV REQUIRED)

include(cmake/prepare.cmake)

file(GLOB SRCS "src/*.cpp")

set(TARGET_NAME utils)
set(TARGET_STATIC utils_static)
set(TARGET_SHARED utils_shared)

# ======
# install static library
#add_library(${TARGET_STATIC} STATIC)
#target_compile_features(${TARGET_STATIC} PRIVATE cxx_std_11)
#target_sources(${TARGET_STATIC} PRIVATE ${SRCS})
#target_include_directories(${TARGET_STATIC}
#        PUBLIC
#        $<INSTALL_INTERFACE:include>
#        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
#        #        PRIVATE
#        #        ${OpenCV_INCLUDE_DIRS}
#        )
#target_link_libraries(${TARGET_STATIC} PRIVATE ${OpenCV_LIBRARIES})
#set_target_properties(${TARGET_STATIC} PROPERTIES OUTPUT_NAME "utils")

# ======
# install shared library
add_library(${TARGET_SHARED} SHARED)
target_compile_features(${TARGET_SHARED} PRIVATE cxx_std_11)
target_sources(${TARGET_SHARED} PRIVATE ${SRCS})
target_include_directories(${TARGET_SHARED}
        PUBLIC
        $<INSTALL_INTERFACE:include>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
#        PRIVATE
#        ${OpenCV_INCLUDE_DIRS}
        )
#target_link_libraries(${TARGET_SHARED} PRIVATE ${OpenCV_LIBRARIES})
set_target_properties(${TARGET_SHARED} PROPERTIES OUTPUT_NAME "utils")
set_target_properties(${TARGET_SHARED} PROPERTIES VERSION ${${TARGET_NAME}_VERSION} SOVERSION 1)

# both static and shared library co-exist
#set_target_properties(${TARGET_STATIC} PROPERTIES CLEAN_DIRECT_OUTPUT 1)
set_target_properties(${TARGET_SHARED} PROPERTIES CLEAN_DIRECT_OUTPUT 1)

# ======
## We firstly install the generated libraries to /usr/local. The path
## comes from GNUInstallDirs, which includes lots of predefined system
## paths.
include(GNUInstallDirs)
install(TARGETS ${TARGET_SHARED}
        EXPORT ${TARGET_NAME}Targets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        )

## Then we install the auto-generated target file, in which have many
## exported names and paths of our target.
install(EXPORT ${TARGET_NAME}Targets
        FILE ${TARGET_NAME}Targets.cmake
        NAMESPACE ${TARGET_NAME}::
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${TARGET_NAME})

## And we should install the header files.
install(DIRECTORY include/
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        )

## Finally, install the <package>Config.cmake file, which is provided
## for users.
install(FILES ${CMAKE_CURRENT_LIST_DIR}/cmake/${TARGET_NAME}Config.cmake
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${TARGET_NAME})
