##### pragma once #####
if(CLANG_FORMAT_INCLUDED)
    return()
endif()
set(CLANG_FORMAT_INCLUDED true)
#######################

add_custom_target(
    format
    COMMAND find src tests -type f '\(' -iname *.h -o -iname *.hpp -o -iname *.c -o -iname *.cpp '\)' -not -path "*/tests/tools/*"  | xargs clang-format -style=file -i
    WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
)
