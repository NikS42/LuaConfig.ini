# LuaConfig.ini
Binds .ini files to lua metatables

Requires https://github.com/Dynodzzo/Lua_INI_Parser/blob/master/LIP.lua 

default.ini - r/o config. Put your default settings here
config.ini - r/w config, overrides preferences from default.ini

Example:
default.ini:
```
[audio]
enabled=true
volume=100

```
config.ini:
```
[audio]
volume=50

```

main.lua:
```
config = require "config"

print (config.audio.enabled) --> true
print (config.audio.volume) --> 50
config.audio.volume = 100 -- as 100 is default value, removes entry from config.lua

```
