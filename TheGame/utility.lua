

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

function pixelsToMeters(pixels) 
    return pixels * 300000000
end

function calculateForceBetweenObjects(object1,object2,distance)
    G = 6.67408 * 10 ^ 11
    return G * object1.mass * object2.mass / (distance^2) 

end

function getDistance(x1,y1,x2,y2)
    local deltaX = x2-x1
    local deltaY = y2-y1
    return math.sqrt(deltaX * deltaX + deltaY * deltaY)
end