function planet.init(self,aXPos,aYPos,aSize)
    local copy = self:clone()
    copy.x = aXPos
    copy.y = aYPos
    --copy.path.radius = aSize
    return copy
end

--Makes a deep clone of the object
function planet.clone(self)
    local copy = {}
    for key, value in pairs(self) do
        if(key ~= "_proxy" or key ~= "_proxy") then 
            copy[key] = value
            if(type(value) == "table") then
               copy[key] = deepCopy(value)     
           end
        end
    end
    return copy
end

--TODO refactor to be not unreadable garbage from the internet
function planet.deepCopy(self)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else
        copy = orig
    end
    return copy
end