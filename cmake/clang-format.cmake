include_guard()

add_custom_target(
    format
    COMMAND find src tests -type f '\(' -iname *.h -o -iname *.hpp -o -iname *.c -o -iname *.cpp '\)' -not -path "*/tests/tools/*"  | xargs clang-format -style=file -i
    WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
)
