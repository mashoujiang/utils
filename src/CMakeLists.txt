include(${PROJECT_SOURCE_DIR}/cmake/functions.cmake)

file(GLOB HDRS "*.h")
file(GLOB SRCS "*.cpp")

message("${HDRS}")
message("${SRCS}")

set(TARGET_NAME utils)
set(TARGET_STATIC utils_static)
set(TARGET_SHARED utils_shared)

# build static library
add_library(${TARGET_STATIC} STATIC ${HDRS} ${SRCS})
set_target_properties(${TARGET_STATIC} PROPERTIES OUTPUT_NAME "utils")
target_include_directories(${TARGET_STATIC} PUBLIC ${CMAKE_SOURCE_DIR}/include)

# build shared library
add_library(${TARGET_SHARED} SHARED ${HDRS} ${SRCS})
set_target_properties(${TARGET_SHARED} PROPERTIES OUTPUT_NAME "utils")
set_target_properties(${TARGET_SHARED} PROPERTIES VERSION ${${TARGET_NAME}_VERSION} SOVERSION 1)
target_include_directories(${TARGET_SHARED} PRIVATE ${CMAKE_SOURCE_DIR}/include)

# both static and shared library co-exist
set_target_properties(${TARGET_STATIC} PROPERTIES CLEAN_DIRECT_OUTPUT 1)
set_target_properties(${TARGET_SHARED} PROPERTIES CLEAN_DIRECT_OUTPUT 1)

# build app
set(TARGET_APP utilsApp)
add_executable(${TARGET_APP} main.cpp)
target_link_libraries(${TARGET_APP} ${TARGET_SHARED})
target_include_directories(${TARGET_APP} PRIVATE ${CMAKE_SOURCE_DIR}/include)

install(TARGETS ${TARGET_SHARED} ${TARGET_APP}
        EXPORT UtilsTargets
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        PUBLIC_HEADER DESTINATION include
        )

install(EXPORT UtilsTargets
        NAMESPACE Utils::
        FILE utils.cmake
        DESTINATION lib/cmake/utils
        )

# install config version
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
        utilsConfigVersion.cmake
        VERSION ${${TARGET_NAME}_VERSION}
        COMPATIBILITY SameMajorVersion
)
message("Build shared library version: ${${TARGET_NAME}_VERSION}")
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/utilsConfigVersion.cmake
        DESTINATION lib/cmake/utils
        )