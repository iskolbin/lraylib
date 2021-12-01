RAYLIB?=../raylib

generate_bindings:
	lua generate.lua "$(RAYLIB)/parser/?.lua" raylib raylib_api > lraylib.c
