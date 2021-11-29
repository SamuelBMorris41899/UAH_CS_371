require("utility")
-- butterBuilder = {}


if not butterBuilder then
    butterBuilder = {
        x = display.contentCenterX + 100, 
        y = display.contentCenterY + 80
    }
end

butterBuilder.temp = 75

butterBuilder.inited = false


local frameInfo = { 
    frames = {
        
        {x = 2, y = 2, width = 195, height = 97}, --full            1
        {x = 2, y = 102, width = 195, height = 97},--melt 2         2
        {x = 2, y = 202, width = 195, height = 97},--melt 4         3      
        {x = 2, y = 302, width = 195, height = 97},--melt 6         4
        {x = 2, y = 402, width = 195, height = 97},--melt 1         5
        {x = 2, y = 502, width = 195, height = 97},--melt 3         6
        {x = 2, y = 602, width = 195, height = 97},--melt 5         7                
        {x = 201, y = 102, width = 195, height = 97},-- Freeze 7    8
        {x = 201, y = 202, width = 195, height = 97},-- Freeze 6    9  
        {x = 201, y = 302, width = 195, height = 97},-- Freeze 5    10
        {x = 201, y = 402, width = 195, height = 97},-- Freeze 4    11
        {x = 201, y = 502, width = 195, height = 97},-- Freeze 3    12  
        {x = 201, y = 602, width = 195, height = 97},-- Freeze 2    13
        {x = 201, y = 702, width = 195, height = 97}, -- Freeze 1   14
    }
}
local butterSheet = graphics.newImageSheet( "Butter_Stages.png", frameInfo )


--This is the controller for the sprite animations
local butterStateManager ={
    {name="full", start=1, count=1, time=1, loopCount=1},
    {name="melt1", start=5, count=1, time=1, loopCount=1},
    {name="melt2", start=2, count=1, time=1, loopCount=1},
    {name="melt3", start=6, count=1, time=1, loopCount=1},
    {name="melt4", start=3, count=1, time=1 , loopCount=1},
    {name="melt5", start=7, count=1, time=1, loopCount=1},
    {name="melt6", start=4, count=1, time=1, loopCount=1},
    {name="freeze1", start=14, count=1, time=1, loopCount=1},
    {name="freeze2", start=13, count=1, time=1, loopCount=1},
    {name="freeze3", start=12, count=1, time=1, loopCount=1},
    {name="freeze4", start=11, count=1, time=1 , loopCount=1},
    {name="freeze5", start=10, count=1, time=1, loopCount=1},
    {name="freeze6", start=9, count=1, time=1, loopCount=1},
    {name="freeze7", start=8, count=1, time=1, loopCount=1},
    
}
function butterBuilder:new(o, args)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    args = args or {}
    -- o:setup(args)

    return o
end


local function mapButter(number)
    if     number == 1 then return "freeze7"
    elseif number == 2 then return "freeze6"
    elseif number == 3 then return "freeze5"
    elseif number == 4 then return "freeze4"
    elseif number == 5 then return "freeze3"
    elseif number == 6 then return "freeze2"
    elseif number == 7 then return "freeze1"
    elseif number == 8 then return "full"
    elseif number == 9 then return "melt1"
    elseif number == 10 then return "melt2"
    elseif number == 11 then return "melt3"
    elseif number == 12 then return "melt4"
    elseif number == 13 then return "melt5"
    elseif number == 14 then return "melt6"
    else print("ERROR! ERROR! INVALIDE BUTTER STATE MAPPED!!!!")
    end
end



function butterBuilder.init(self) 
    if(self.inited == true) then 
        return self
    end

    newButter = display.newSprite(butterSheet, butterStateManager)
    
    newButter = deepAppend(butterBuilder,newButter)

    newButter.life = 8

    butterState = mapButter(newButter.life)
    newButter:setSequence( butterState )  
    newButter:play()  -- play the new sequence
    newButter.x = self.x
    newButter.y = self.x
    newButter.width = newButter.width*2
    self = newButter
    self.inited = true

    return self
end
function butterBuilder.reset(self) 
    globalTemp = 75
    self.temp = globalTemp
    -- self.inited = false
    -- self = butterBuilder:init()
    
end 
function butterBuilder.tick(self) 
    if(self.temp < globalTemp) then 
        self.temp = self.temp + 5
        print("Butter Temp: "..self.temp)
    elseif (self.temp > globalTemp) then 
        self.temp = self.temp - 5
        print("Butter Temp: "..self.temp)
    end
    print("self.life: " ..self.life )

    if(self.temp >= 0 and self.temp <= 24) then --frozen 7 ALL IS LOST ANYWAY
        self.life = 1
    elseif(self.temp >= 25 and self.temp <= 45) then --frozen 6
        self.life = 2
    elseif(self.temp >= 46 and self.temp <= 50) then --frozen 5
        self.life = 3
    elseif(self.temp >= 51 and self.temp <= 55) then --frozen 4
        self.life = 4
    elseif(self.temp >= 56 and self.temp <= 60) then --frozen 3
        self.life = 5
    elseif(self.temp >= 61 and self.temp <= 65) then --frozen 2
        self.life = 6
    elseif(self.temp >= 66 and self.temp <= 70) then --frozen 1
        self.life = 7
    elseif(self.temp >= 70 and self.temp <= 90) then --perfect 
        self.life = 8
    elseif(self.temp >= 81 and self.temp <= 85) then --melt 1
        self.life = 9
    elseif(self.temp >= 86 and self.temp <= 90) then --melt 2
        self.life = 10
    elseif(self.temp >= 91 and self.temp <= 95) then --melt 3
        self.life = 11
    elseif(self.temp >= 96 and self.temp <= 100) then --melt 4
        self.life = 12
    elseif(self.temp >= 101 and self.temp <= 105) then --melt 5
        self.life = 13
    elseif(self.temp >= 106 and self.temp <= 110) then --melt 6 ALL IS LOST ANYWAY
        self.life = 14
    end
    
    butterState = mapButter(self.life)
    print(butterState)
    self:setSequence(butterState)
end

MIN_TARGET_TEMP = 65
MAX_TARGET_TEMP = 67
PERFECT_TEMP = 66

function butterBuilder.isIdealTemp(self) 
    return between(self.temp, MIN_TARGET_TEMP, MAX_TARGET_TEMP)
end
--Returns true if all is lost!
function butterBuilder.gameLost(self) 
    return (self.life == 14 or self.left == 1);
end

function butterBuilder.isPerfectTemp(self) 
    return (self.temp == PERFECT_TEMP)
end

function butterBuilder.hide(self) 
    self.isVisible = false;
end

function butterBuilder.show(self) 
    self.isVisible = true;
end

return butterBuilder