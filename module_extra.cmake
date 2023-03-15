if(NOT TARGET etherdream)
    find_package(etherdream REQUIRED)
endif()

filter_platform_specific_files(SOURCES)
add_platform_specific_files("${WIN32_SOURCES}" "${MACOS_SOURCES}" "${LINUX_SOURCES}")
filter_platform_specific_files(HEADERS)
add_platform_specific_files("${WIN32_SOURCES}" "${MACOS_SOURCES}" "${LINUX_SOURCES}")

target_include_directories(${PROJECT_NAME} PUBLIC ${ETHERDREAM_INCLUDE_DIR})

target_link_libraries(${PROJECT_NAME} etherdreamlib)

if(WIN32)
    # Copy etherdream DLL to build directory on Windows (plus into packaged app)
    copy_etherdream_dll()
endif()

if(NAP_BUILD_CONTEXT MATCHES "framework_release")
    if(UNIX)
        # Install etherdream lib into packaged app
        install(FILES $<TARGET_FILE:etherdreamlib> DESTINATION lib)
    endif()
endif()
