##### pragma once #####
if(CLANG_FORMAT_INCLUDED)
    return()
endif()
set(CLANG_FORMAT_INCLUDED true)
#######################

add_custom_target(
        format
        COMMAND find src tests -iname *.h -o -iname *.hpp -o -iname *.c -iname *.cpp | xargs clang-format -style=file -i
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
)
