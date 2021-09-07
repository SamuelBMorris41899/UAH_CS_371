
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

--A non destructive way to move functions from one table to another
function AppendFunctionsFromAtoB(from,to)
    local copy = to
    for key,value in pairs(from) do 
        if(type(value) == "function") then
            copy[key] = value
        end
    end
    return copy
end
