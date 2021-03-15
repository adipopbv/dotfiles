set(BINARY ${CMAKE_PROJECT_NAME})

file(GLOB_RECURSE SOURCES LIST_DIRECTORIES true *.h *.cpp)

set(SOURCES ${SOURCES})

add_executable(${BINARY}-test ${SOURCES})

add_test(NAME ${BINARY}-test COMMAND ${BINARY}-test)

target_link_libraries(${BINARY}-test PUBLIC ${CMAKE_PROJECT_NAME}-lib gtest)

