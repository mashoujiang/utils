include(${PROJECT_SOURCE_DIR}/cmake/functions.cmake)

file(GLOB HDRS "*.h")
file(GLOB SRCS "*.cpp")

message("${HDRS}")
message("${SRCS}")

set(TARGET_NAME utils_static)

add_library(${TARGET_NAME} STATIC ${HDRS} ${SRCS})
set_target_output_dirs(${TARGET_NAME} lib lib bin)
