require("utility")
local builder = {}

builder.On = true

removeHeater = false
print("I AM IN HEATER.LUA")


local frameInfo = { 
    frames = {
        {x = 1, y = 2, width = 111, height = 138},      --off
        {x = 120, y = 2, width = 111, height = 138},    --on
    }
}

local spriteSheetData = graphics.newImageSheet( "Items\\heater.png", frameInfo )

--This is the controller for the sprite animations
local stateManager ={
    {name="off", start=1, count=1, time=1, loopCount=1},
    {name="on", start=2, count=2, time=700, loopCount=1},
}

function builder.init(self,x,y)
    heaterDisable = false
    heaterNew = display.newSprite(spriteSheetData, stateManager)
    heaterNew = deepAppend(builder,heaterNew)
    heaterNew:changeAnim()
    heaterNew.level = 1
    heaterNew.x = x
    heaterNew.y = y
    heaterNew.xScale = .75
    heaterNew.yScale = .75
    heaterNew:addEventListener("touch",heaterNew.turnOnOff)
    heaterNew:toBack()
    return heaterNew
end

function builder.removeHeater(self)
    print("heater removed")
    if heaterNew == nil then
        print("heater failure")
        return
    end
    heaterNew.isVisible = false
    heaterNew:removeSelf()
    heaterNew = nil
    heaterDisable = true
    
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
        print ("Disabled: " .. tostring(heaterDisable))
        if(heaterDisable) then 
            return
        end
        globalTemp = globalTemp + 2.5
    end
end

return builder