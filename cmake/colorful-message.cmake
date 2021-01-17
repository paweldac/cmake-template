include_guard()

option(COLORFUL_OUTPUT "Enable/disable colorful output" ON)

# cmake-format: off
#https://stackoverflow.com/a/19578320/6367382
if($ENV{SHELL} MATCHES "bash|csh|zsh")
    string(ASCII 27 Esc)
    set(ColourReset "${Esc}[0m")
    set(ColourBold  "${Esc}[1m")
    set(Red         "${Esc}[31m")
    set(Green       "${Esc}[32m")
    set(Yellow      "${Esc}[33m")
    set(Blue        "${Esc}[34m")
    set(Magenta     "${Esc}[35m")
    set(Cyan        "${Esc}[36m")
    set(White       "${Esc}[37m")
    set(BoldRed     "${Esc}[1;31m")
    set(BoldGreen   "${Esc}[1;32m")
    set(BoldYellow  "${Esc}[1;33m")
    set(BoldBlue    "${Esc}[1;34m")
    set(BoldMagenta "${Esc}[1;35m")
    set(BoldCyan    "${Esc}[1;36m")
    set(BoldWhite   "${Esc}[1;37m")
endif()
# cmake-format: on

function(cmessage)
  list(GET ARGV 0 MessageType)
  if(COLORFUL_OUTPUT)
    if(MessageType STREQUAL FATAL_ERROR OR MessageType STREQUAL SEND_ERROR)
      list(REMOVE_AT ARGV 0)
      message(${MessageType} "${BoldRed}${ARGV}${ColourReset}")
    elseif(MessageType STREQUAL WARNING OR MessageType STREQUAL NOTICE)
      list(REMOVE_AT ARGV 0)
      message(${MessageType} "${BoldYellow}${ARGV}${ColourReset}")
    elseif(MessageType STREQUAL AUTHOR_WARNING)
      list(REMOVE_AT ARGV 0)
      message(${MessageType} "${BoldCyan}${ARGV}${ColourReset}")
    elseif(MessageType STREQUAL STATUS)
      list(REMOVE_AT ARGV 0)
      message(${MessageType} "${Green}${ARGV}${ColourReset}")
    else()
      message("${ARGV}")
    endif()
  else()
    set(CMAKE_DEFAULT_MESSAGE_TYPES
        FATAL_ERROR
        SEND_ERROR
        WARNING
        AUTHOR_WARNING
        DEPRECATION
        NOTICE
        STATUS
        VERBOSE
        DEBUG
        TRACE)
    if(MessageType IN_LIST CMAKE_DEFAULT_MESSAGE_TYPES)
      list(REMOVE_AT ARGV 0)
      message(${MessageType} "${ARGV}")
    else()
      message("${ARGV}")
    endif()
  endif()
endfunction()
