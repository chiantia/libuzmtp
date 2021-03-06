# cmocka

ExternalProject_Add(cmocka-project
	GIT_REPOSITORY git://git.cryptomilk.org/projects/cmocka.git
	UPDATE_COMMAND ""
	INSTALL_COMMAND ""
	INSTALL_COMMAND make install
	LIST_SEPARATOR |
	CMAKE_ARGS 
		-DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
		-DWITH_STATIC_LIB:BOOL=ON 
		-DUNIT_TESTING:BOOL=OFF
	)

file(MAKE_DIRECTORY ${CMAKE_INSTALL_PREFIX}/include)

add_library(cmocka STATIC IMPORTED)
set_property(TARGET cmocka 
	PROPERTY IMPORTED_LOCATION 
	${CMAKE_INSTALL_PREFIX}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}cmocka${CMAKE_STATIC_LIBRARY_SUFFIX}
	)
set_property(TARGET cmocka 
	PROPERTY INTERFACE_INCLUDE_DIRECTORIES 
	${CMAKE_INSTALL_PREFIX}/include
	)
add_dependencies(cmocka cmocka-project)
