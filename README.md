## GrowPai Internal Wrapper
Originally made by [purpl3r0se#0001](https://github.com/purpl3r0se), ported to growpai by dart

## How to use
To use this, you must copy all of the code from the `main.lua` file and put it at the top of your script or rename the file to wrapper.lua and put `require("wrapper.lua")` at the top of your script.

## Credits
* [purpl3r0se#0001](https://github.com/purpl3r0se)
* arky
* nabhek

## Functions

### Join World
* params: (string worldName)
```lua
-- This will teleport you to the world "start".
JoinWorld("start")
```


### Drop Item
* params: (int itemID, int count)
```lua
-- This will drop 15 of the specific item specified, in this case itemID 2 is dirt, so this will drop 15 dirt.
DropItem(2, 15)
```


### Teleport (exploit, maybe patched)
* params: (string world, int x, int y)
```lua
-- Teleports you to the world "world" at x 24 and y 25.
Teleport("world", 24, 25)
```


### Send Function List
* params: none
```lua
-- Running this function, will log all available functions to your growtopia chat.
SendFunctionList()
```

### Color Mode (by nabhek)
* params: (bool enabled, int pps)
```lua
-- This will enable color mode and set the sending amount of packets per second to 30.
ColorMode(true, 30)
```

### Face Side
* params: (string side)
* possible values for side: right, left
```lua
-- This will make you look to the left side (server-sided, you won't see it on your end.)
FaceSide("left")
```


### Wrench Tile
* params: (int x, int y)
```lua
-- This will wrench the block that is at x-75, y-25
WrenchTile(75, 25)
```


### Hit Tile
* params: (int x, int y)
```lua
-- This will hit the block that is at x-75, y-25.
HitTile(75, 25)
```


### Place Tile
* params: (int id, int x, int y)
```lua
-- This will place a dirt block (id = 2) at x-75, y-25.
PlaceTile(2, 75, 25)
```
