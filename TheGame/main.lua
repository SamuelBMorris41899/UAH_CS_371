-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--display.setStatusBar(display.hiddenStatusBar);

require("planet")
require("planets")


planet2 = planet:init("planet 2",200,200,60,100000000,0,0)
planet1 = planet:init("planet 1",200,275,10, 10000, 3 ,0)

-- div = 10000
-- planet2 = planet:init("planet 2",200,0,60,1.989 * 10^30 / div,0,0)
-- planet1 = planet:init("planet 1",200,150,10, 100, 5.972 * 10^24 / div ,0)

planet1:setFillColor(0,0.5,0.5);

testList = {planet2}

-- planets.add(planet1)
-- planets.add(planet2)

local function gameLoop()
    planet1:move(testList)
end

gameLoopTimer = timer.performWithDelay( 100, gameLoop, 0 )

