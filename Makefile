CC?=cc
RAYLIB?=../raylib
LUA?=/usr/include/lua5.3

binding:
	lua generate.lua "$(RAYLIB)/parser/?.lua" > lraylib.c

so:
	$(CC) -Wall -Wextra lraylib.c -I$(LUA) -I$(RAYLIB)/src -L$(RAYLIB)/src -lraylib -lm -lGL -lc -lpthread -ldl -lrt -fPIC -shared -o raylib.so
