CC?=cc
RAYLIB?=../iskolbin-raylib
LUA?=/usr/include/lua5.3

binding:
	lua generate.lua "$(RAYLIB)/parser/?.lua" raylib raylib_api 'RAYGUI_IMPLEMENTATION' 'raylib extras/raygui' > lraylib.c
	lua generate.lua "$(RAYLIB)/parser/?.lua" raymath raymath_api 'RAYMATH_IMPLEMENTATION' 'raymath'> lraymath.c
	lua generate.lua "$(RAYLIB)/parser/?.lua" easings easings_api '' 'raylib extras/easings'> leasings.c
	#lua generate.lua "$(RAYLIB)/parser/?.lua" physac physac_api 'PHYSAC_IMPLEMENTATION' 'raylib extras/physac'> lphysac.c
	#lua generate.lua "$(RAYLIB)/parser/?.lua" raygui raygui_api 'RAYGUI_IMPLEMENTATION' 'raylib extras/raygui'> lraygui.c

shared:
	$(CC) -Wall -Wextra lraylib.c -I$(LUA) -I$(RAYLIB)/src -L$(RAYLIB)/src -lraylib -lm -lGL -lc -lpthread -ldl -lrt -fPIC -shared -o raylib.so
	$(CC) -Wall -Wextra lraymath.c -I$(LUA) -I$(RAYLIB)/src -lm -fPIC -shared -o raymath.so
	$(CC) -Wall -Wextra leasings.c -I$(LUA) -I$(RAYLIB)/src -lm -fPIC -shared -o easings.so
	#$(CC) -Wall -Wextra lphysac.c -I$(LUA) -I$(RAYLIB)/src -L$(RAYLIB)/src -lraylib -lm -lGL -lc -lpthread -ldl -lrt -fPIC -shared -o physac.so
	#$(CC) -Wall -Wextra lraygui.c -I$(LUA) -I$(RAYLIB)/src -L$(RAYLIB)/src -lraylib -lm -lGL -lc -lpthread -ldl -lrt -fPIC -shared -o raygui.so
