require("utility")
builder = {}

builder.On = true

local frameInfo = { 
    frames = {
        {x = 1, y = 2, width = 111, height = 138},      --off
        {x = 122, y = 2, width = 111, height = 138},    --on
    }
}

local spriteSheetData = graphics.newImageSheet( "Items\\heater.png", frameInfo )

--This is the controller for the sprite animations
local stateManager ={
    {name="off", start=1, count=1, time=1, loopCount=1},
    {name="on", start=2, count=2, time=700, loopCount=1},
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
    self:changeAnim()
end

function builder.effect(self) 
    globalTemp = globalTemp + 5
end

return builder