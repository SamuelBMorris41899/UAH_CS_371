
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