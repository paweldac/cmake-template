include_guard()

set(FORMAT_SCRIPT ${CMAKE_SOURCE_DIR}/scripts/format_code)

add_custom_target(
    format
    COMMAND ${FORMAT_SCRIPT} "${CMAKE_SOURCE_DIR}/src" "${CMAKE_SOURCE_DIR}/tests"
    VERBATIM
)
