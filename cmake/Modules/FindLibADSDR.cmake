if(NOT LIBADSDR_FOUND)
  pkg_check_modules (LIBADSDR_PKG libadsdr)
  find_path(LIBADSDR_INCLUDE_DIRS NAMES adsdr.hpp
    PATHS
    ${LIBADSDR_PKG_INCLUDE_DIRS}
    /usr/include
    /usr/local/include
  )

  find_library(LIBADSDR_LIBRARIES NAMES adsdr
    PATHS
    ${LIBADSDR_PKG_LIBRARY_DIRS}
    /usr/lib
    /usr/local/lib
  )

if(LIBADSDR_INCLUDE_DIRS AND LIBADSDR_LIBRARIES)
  set(LIBADSDR_FOUND TRUE CACHE INTERNAL "libadsdr found")
  message(STATUS "Found libadsdr: ${LIBADSDR_INCLUDE_DIRS}, ${LIBADSDR_LIBRARIES}")
else(LIBADSDR_INCLUDE_DIRS AND LIBADSDR_LIBRARIES)
  set(LIBADSDR_FOUND FALSE CACHE INTERNAL "libadsdr found")
  message(STATUS "libadsdr not found.")
endif(LIBADSDR_INCLUDE_DIRS AND LIBADSDR_LIBRARIES)

mark_as_advanced(LIBADSDR_LIBRARIES LIBADSDR_INCLUDE_DIRS)

endif(NOT LIBADSDR_FOUND)
