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
print("Planet",planet)
planet.path.radius = 100
planet:move()
-- returns the radius of the cirlce
--print(circle.path.radius)

for i,v in pairs(planet) do
    print(i,v)
end

local function gameLoop()

end

gameLoopTimer = timer.performWithDelay( 500, gameLoop, 0 )

