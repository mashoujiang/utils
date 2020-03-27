include(${PROJECT_SOURCE_DIR}/cmake/functions.cmake)

file(GLOB HDRS "*.h")
file(GLOB SRCS "*.cpp")

message("${HDRS}")
message("${SRCS}")

set(TARGET_NAME utils_static)

add_library(${TARGET_NAME} STATIC ${HDRS} ${SRCS})
target_include_directories(${TARGET_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

set(TARGET_APP utilsApp)
add_executable(${TARGET_APP} main.cpp)
target_link_libraries(${TARGET_APP} ${TARGET_NAME})
target_include_directories(${TARGET_APP}  PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

install(TARGETS ${TARGET_NAME} ${TARGET_APP}
        EXPORT UtilsTargets
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        PUBLIC_HEADER DESTINATION include
        )
