-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------


require("planet")
require("planets")

planet2 = planet:clone()

planets:add(planet)
planets:add(planet2)

planets:new()


local function gameLoop()
    planet:move(1)
    --print(planet.xPosition)
    planet2:move(-1)
    --print(planet2.xPosition)

    for i,v in ipairs(planets:getList()) do
        print(i,v.xPosition)
    end
    
end

gameLoopTimer = timer.performWithDelay( 500, gameLoop, 0 )

