-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--display.setStatusBar(display.hiddenStatusBar);

require("planet")
require("planets")


sun = planet:init("planet 2",200,200,60,100000000,0,0)
sun:setFillColor(.8,.8,0)
planet1 = planet:init("planet 1",200,275,10, 10000, 3.5 ,0)
planet1:setFillColor(0,0.5,0.5);
planet2 = planet:init("planet 2",200,325,20, 100000, 3.5 ,0)

planet3 = planet:init("planet 3",200,375,5, 100, 3.5 ,0)
planet3:setFillColor(1,0,0)

testList = {sun,planet2,planet1,planet3}

-- planets.add(planet1)
-- planets.add(planet2)

local function gameLoop()
    planet1:move(testList)
    planet2:move(testList)
    planet3:move(testList)
end

gameLoopTimer = timer.performWithDelay( 100, gameLoop, 0 )

