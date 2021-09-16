-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--display.setStatusBar(display.hiddenStatusBar);

--centripital force equation
-- USe this to find a good inital velocity

require("planet")
require("planets")
local widget = require("widget")

solarSystem = display.newGroup();
sun = planet:init("Sun",150,150,60,1000000000,0,0)
sun:setFillColor(.8,.8,0)
planet1 = planet:init("planet 1",150,150 + 75,10, 100000, 10 ,0)
planet1:setFillColor(0,.8,.8)

solarSystem:insert(sun)
solarSystem:insert(planet1)


planets:add(sun)
planets:add(planet1)

-- testList = {sun,planet1}
-- planets.add(planet1)
-- planets.add(planet2)
solarSystem.xScale=0.5
solarSystem.yScale=0.5

local function gameLoop()
    --sun:move(testList)
    --planet1:move(testList)
    planets:update()
end

gameLoopTimer = timer.performWithDelay( 100, gameLoop, 0 )

function addPlanet(event)
    if(event.phase == "began") then 
        print("Start")
    elseif event.phase == "ended" then
        print("Done")
    elseif event.phase == "moved" then
        print("Moving")
    end 
    

end
Runtime:addEventListener( "touch", addPlanet)