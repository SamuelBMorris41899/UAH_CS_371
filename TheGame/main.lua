-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--display.setStatusBar(display.hiddenStatusBar);

require("planet")
require("planets")


planet2 = planet:init("planet 1",200,200,60,1000000,0,0)
planet1 = planet:init("planet 1",200,275,10, 100,50,0)

planet1:setFillColor(0,0.5,0.5);

testList = {planet2}

-- planets.add(planet1)
-- planets.add(planet2)

local function gameLoop()
    planet1:move(testList)
end

gameLoopTimer = timer.performWithDelay( 500, gameLoop, 0 )

