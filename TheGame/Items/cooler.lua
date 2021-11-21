require("utility")
local cooler_Builder = {}

cooler_Builder.On = true

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



function cooler_Builder.init(self,x,y)
    new = display.newSprite(spriteSheetData, stateManager)
    new = deepAppend(cooler_Builder,new)
    new:changeAnim()
    new.level = 1
    new.x = x
    new.y = y
    new.xScale = .75
    new.yScale = .75
    new:addEventListener("touch",new.turnOnOff)
    
    return new
end

function cooler_Builder.upgrade(self)
    self.level = self.level + 1
end

function cooler_Builder.changeAnim(self)

    if (self.On) then 
        print("ON!")
        self:setSequence("on")
    else 
        print("Off")
        self:setSequence("off")
    end
    self:play()
end

function cooler_Builder.turnOnOff(event)
    if (event.phase == "ended") then 
        self = event.target     
        self.On = not self.On
        self:changeAnim()
    end
end

function cooler_Builder.effect(self) 
    
    if(self.On) then 
        globalTemp = globalTemp - 5 * self.level
    end
end

return cooler_Builder