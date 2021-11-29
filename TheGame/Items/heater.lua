require("utility")
local builder = {}

builder.On = true

removeHeater = false
print("I AM IN HEATER.LUA")


local frameInfo = { 
    frames = {
        {x = 1, y = 2, width = 110, height = 138},      --off
        {x = 120, y = 2, width = 110, height = 138},    --on
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
    new.level = 1
    new.x = x
    new.y = y
    new.xScale = .75
    new.yScale = .75
    new:addEventListener("touch",new.turnOnOff)
    new:toBack()
    return new
end

function builder.removeHeater(self)
    self.new = nil
    self.new.isVisible(false)
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

function builder.turnOnOff(event)
    if (event.phase == "ended") then 
        self = event.target
        self.On = not self.On
        self:changeAnim()
    end
end

function builder.effect(self) 
    if(self.On) then 
        globalTemp = globalTemp + 2.5
    end
end

return builder