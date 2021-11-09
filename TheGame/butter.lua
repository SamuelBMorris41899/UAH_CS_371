require("utility")
butter = {}
butter.temp = globalTemp







local frameInfo = { 
    frames = {
        
        {x = 1, y = 2, width = 198, height = 98}, --full            1
        {x = 1, y = 102, width = 198, height = 98},--melt 2         2
        {x = 1, y = 202, width = 198, height = 98},--melt 4         3      
        {x = 1, y = 302, width = 198, height = 98},--melt 6         4
        {x = 1, y = 402, width = 198, height = 98},--melt 1         5
        {x = 1, y = 502, width = 198, height = 98},--melt 3         6
        {x = 1, y = 602, width = 198, height = 98},--melt 5         7                
        {x = 201, y = 102, width = 198, height = 98},-- Freeze 7    8
        {x = 201, y = 202, width = 198, height = 98},-- Freeze 6    9  
        {x = 201, y = 302, width = 198, height = 98},-- Freeze 5    10
        {x = 201, y = 402, width = 198, height = 98},-- Freeze 4    11
        {x = 201, y = 502, width = 198, height = 98},-- Freeze 3    12  
        {x = 201, y = 602, width = 198, height = 98},-- Freeze 2    13
        {x = 201, y = 702, width = 198, height = 98}, -- Freeze 1   14
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



local function mapButter(number)
    if     number == 1 then return "freeze1"
    elseif number == 2 then return "freeze2"
    elseif number == 3 then return "freeze3"
    elseif number == 4 then return "freeze4"
    elseif number == 5 then return "freeze5"
    elseif number == 6 then return "freeze6"
    elseif number == 7 then return "freeze7"
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



function butter.init(self) 
    


    newButter = display.newSprite(butterSheet, butterStateManager)
    
    newButter = deepAppend(butter,newButter)

    newButter.life = 8


    butterState = mapButter(newButter.life)
    newButter:setSequence( butterState )  
    newButter:play()  -- play the new sequence
    newButter.x = 100
    newButter.y = 100
end


function butter.changeButterState(self,COLDERHOTTER) 
    if(COLDERHOTTER == "COLDER") then 
        self.life = self.life - 1  
    elseif (COLDERHOTTER == "HOTTER") then 
        self.life = self.life + 1  
    else
        print("ERROR! ERROR! INVALID ARGUMENT FOR CHAINGING BUTTER STATE: OPTIONS ARE COLDER or HOTTER")
    end
end


function butter.tick(self) 
    if(self.temp > globalTemp) then 
        self.temp = self.temp + 1
    elseif (self.temp < globalTemp) then 
        self.temp = self.temp - 1
    end
end

MIN_TARGET_TEMP = 65
MAX_TARGET_TEMP = 67
function butter.isIdealTemp(self) 
    return (self.temp > MIN_TARGET_TEMP and self.temp < MAX_TARGET_TEMP)
end