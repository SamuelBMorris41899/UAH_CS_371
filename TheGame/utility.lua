
function deepCopy (orgional)
    local copy = {}
    for key, value in pairs(orgional) do
        if(value ~= orgional) then 
            copy[key] = value
            if(type(value) == "table") then
            copy[key] = deepCopy(value)     
            end
        end
    end
    return copy
end

--TODO: make this a deep copy (might not be needed so I can by lazy for now)
--A non destructive way to move functions from one table to another
function deepAppend(from,to)
    local copy = to
    for key,value in pairs(from) do 
        copy[key] = value
        if(type(value) == "table") then
            copy[key] = deepCopy(value)     
        end
    end
    return copy
end

function getDistance(x1,y1,x2,y2)
    local deltaX = x2-x1
    local deltaY = y2-y1
    return math.sqrt(deltaX * deltaX + deltaY * deltaY)
end

function between(number,min,max) 
    return (number > min and number < max);
end

function updateScene()
    if(currentLevelGroup == nil or currentLevelGroup.globalTempNum == nil) then
        
    else
        currentLevelGroup.bgGlobalTempNum.text = tostring(globalTemp)
        currentLevelGroup.globalTempNum.text = tostring(globalTemp)
        -- currentLevelGroup.bgTempNum.text =  tostring(butter.temp)
        -- currentLevelGroup.tempNum.text = tostring(butter.temp)
    end
end

function resetLevel () 
    heaterLevel = 1
    coolerLevel = 1
    Cooler.name = "Cooler "
    Heater.name = "Heater "
    
end