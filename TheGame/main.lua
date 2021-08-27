-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
screenSizeX = 320
screenSizeY = 480

require("planet")

-- triangleCount = 2
-- squareCount = 5

-- for i = 1,squareCount,1 do
--     rectObject = display.newRect(math.random(screenSizeX),math.random(screenSizeY), 10+math.random(100), 10+math.random(100)) --display.newRect(leftBorder, topBorder, width, height) (a number from 1 to 5)
--     rectObject:setFillColor( math.random(), math.random(), math.random() )
-- end

-- for i = 1,triangleCount,1 do 
--     local verts = {0,0,10,-20,20,0}
--     local scale = math.random(10)
--     local realVerts = {}

--     for vert in ipairs(verts) do
--         realVerts [vert] = verts[vert] * scale
--         print(realVerts)
--     end

--     polyObj = display.newPolygon(math.random(screenSizeX),math.random(screenSizeY),realVerts)
--     polyObj:setFillColor( math.random(), math.random(), math.random()) -- 0...1 NOT 0...255
-- end

-- textObject= display.newText( "TODO,\nsomething a\nlittle harder", 160, 80, native.systemFont, 36 )
-- textObject: setFillColor( 1, 1, 1 )

Planet1 = planet:init(0,0,10)

local function gameLoop()
    planet1:move(10,10)
end

gameLoopTimer = timer.performWithDelay( 500, gameLoop, 0 )
