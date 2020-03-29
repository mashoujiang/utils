get_filename_component(utils_CMAKE_DIR "${CMAKE_CURRENT_LIST_DIR}" DIRECTORY)
include(CMakeFindDependencyMacro)
#find_dependency(OpenCV REQUIRED)

if(NOT TARGET utils::utils)
    include("${utils_CMAKE_DIR}/utils/utilsTargets.cmake")
endif()