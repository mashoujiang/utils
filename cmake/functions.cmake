set_property(GLOBAL PROPERTY USE_FOLDERS ON)

function(SET_TARGET_OUTPUT_DIRS target dir_archive dir_library dir_runtime)
    if (${CMAKE_VERSION} VERSION_GREATER "3.0.1")
        set_target_properties(
                ${target}
                PROPERTIES
                ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/output/${dir_archive}"
                ARCHIVE_OUTPUT_DIRECTORY_DEBUG "${CMAKE_BINARY_DIR}/output/${dir_archive}"
                ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${CMAKE_BINARY_DIR}/output/${dir_archive}"
                ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL "${CMAKE_BINARY_DIR}/output/${dir_archive}"
                ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO "${CMAKE_BINARY_DIR}/output/${dir_archive}"
                LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/output/${dir_library}"
                LIBRARY_OUTPUT_DIRECTORY_DEBUG "${CMAKE_BINARY_DIR}/output/${dir_library}"
                LIBRARY_OUTPUT_DIRECTORY_RELEASE "${CMAKE_BINARY_DIR}/output/${dir_library}"
                LIBRARY_OUTPUT_DIRECTORY_MINSIZEREL "${CMAKE_BINARY_DIR}/output/${dir_library}"
                LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO "${CMAKE_BINARY_DIR}/output/${dir_library}"
                RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/output/${dir_runtime}"
                RUNTIME_OUTPUT_DIRECTORY_DEBUG "${CMAKE_BINARY_DIR}/output/${dir_runtime}"
                RUNTIME_OUTPUT_DIRECTORY_RELEASE "${CMAKE_BINARY_DIR}/output/${dir_runtime}"
                RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL "${CMAKE_BINARY_DIR}/output/${dir_runtime}"
                RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO "${CMAKE_BINARY_DIR}/output/${dir_runtime}"
        )
    endif ()
endfunction()
