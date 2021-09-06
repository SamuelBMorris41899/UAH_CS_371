-- planet = {
--     xPosition=200,
--     yPosition=200,
--     size = 10,
--     velocityX = 0,
--     velocityY = 100,
--     isMovable = true,
--     testTable={}
-- }

require("utility")
planet = display.newCircle(0,0,30);
planet.velocityX = 0
planet.velocityY = 0
planet.isMovable = true


function planet.init(self,aXPos,aYPos,aSize)
    local copy = self:clone()
    copy.x = aXPos
    copy.y = aYPos
    --copy.path.radius = aSize
    return copy
end

function planet.clone(self)
    local copy = {}
    for key, value in pairs(self) do
        copy[key] = value
        if(type(value) == "table") then
           copy[key] = self:__clone(value)     
       end
        
    end
    return copy
end

--Clone a table from the table
function planet.__clone(self,tableToClone)
    local copy = {}
    for key, value in pairs(self) do
        copy[key] = value
    end
    return copy
end

function planet.deepCopy(self)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- function planet.move(self,otherObjectList)
--     if(self.isMovable) then
--         self:calculateGravity(otherObjectList)
--         self.x = self.x + self.velocityX 
--         self.y = self.x + self.velocityY
--     end
-- end

function planet.move(self)
    self.x = 10
    self.y = 100
end

function planet.calculateGravity(self,otherObjectList)
    --constants
    local G = 6.67408 * 10 ^ -11
    local myMass = self.size
    local addAccelX,addAccelY = 0,0 
    
    for i,v in ipairs(otherObjectList) do
        local otherMass = v.size 
        local deltaX,deltaY = self.xPosition - v.xPosition,self.yPosition - v.yPosition
        local distanceBetweenSquared = deltaX * deltaX + deltaY * deltaY
        local angleBetween = acos(deltaX)
        F = 0
        if(distanceBetweenSquared ~= 0) then
            F = G * myMass * otherMass / distanceBetweenSquared
        end
        addAccelX = F * cos(angleBetween)/ myMass
        addAccelY = F * sin(angleBetween)/ myMass
        self.velocityX = self.velocityX + addAccelX
        self.velocityY =self.velocityY + addAccelY
    end
    print(self.velocityX)
end