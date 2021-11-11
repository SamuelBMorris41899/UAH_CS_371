require("utility")
builder = {}

builder.On = true

local frameInfo = { 
    frames = {
        {x = 1, y = 2, width = 87, height = 131}, --1
        {x = 91, y = 2, width = 87, height = 131},--2
        {x = 187, y = 2, width = 87, height = 131},--3
    }
}
local spriteSheetData = graphics.newImageSheet( "Items\\Cooler.png", frameInfo )

--This is the controller for the sprite animations
local stateManager ={
    {name="off", start=1, count=1, time=1, loopCount=1},
    {name="on", start=2, count=2, time=700, loopCount=0},
}



function builder.init(self,x,y)
    new = display.newSprite(spriteSheetData, stateManager)
    new = deepAppend(builder,new)
    new:changeAnim()
    new.x = x
    new.y = y
    return new
end

function builder.changeAnim(self)

    if (self.On) then 
        print("ON!")
        self:setSequence("on")
    else 
        print("Off")
        self:setSequence("off")
    end
    self:play()
end

function builder.turnOnOff(self) 
    self.On = not self.On
end

function builder.effect(self) 
    globalTemp = globalTemp - 5
end

return builder