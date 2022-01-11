## raylib-lua

[Lua](https://www.lua.org/) or [LuaJIT](https://luajit.org/) binding for [raylib](https://www.raylib.com/), a simple and easy-to-use library to learn videogames programming.

The binding is created using parsed data from raylib/parser, it includes in single raylib library: raylib itself, raymath, extras/raygui, extras/easings.

### Quick start

1. Clone raylib repo
```
git clone raylib
```

2. Parse API info in raylib/parser folder
```
cd raylib/parser
make all
```

3. Create bindings, you can redefine used lua version and raylib location, by default:
```
RAYLIB=../raylib LUA=/usr/include/lua5.3 make bind
```

### Linux

- You can compile shared `raylib.so`, you can redefine used compiler, by default:
```
CC=cc make so
```

- Finally, you can use it in REPL (don't mess with lua version number, it must be the same as on step 3):
```
lua5.3
Lua 5.3.3  Copyright (C) 1994-2016 Lua.org, PUC-Rio
> rl = require('raylib')
> rl.RAYLIB_VERSION
4.1-dev
```
