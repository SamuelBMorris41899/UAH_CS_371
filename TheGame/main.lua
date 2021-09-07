-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--display.setStatusBar(display.hiddenStatusBar);

require("planet")
require("planets")


planet1 = planet:init(200,200,10)
planet2 = planet:init(100,100,60)

local function gameLoop()

end

gameLoopTimer = timer.performWithDelay( 500, gameLoop, 0 )

