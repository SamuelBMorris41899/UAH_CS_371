require("utility")
--Mon wed fri 940
--Here to initalize the table
planet = {}
planet.name = "bob"
planet.velocityX = 0
planet.velocityY = 0
planet.mass = 10

--constructor
function planet.init(self,name,aXPos,aYPos,aSize,mass,velX,velY)
    --Start out by making a circle
    local copy = display.newCircle(aXPos,aYPos,aSize);
    copy = deepAppend(self,copy)
    copy.name = name
    copy.mass = mass
    copy.velocityX = velX
    copy.velocityY = velY
    return copy
end

function planet.move(self,otherObjectList)
    self:calculateGravity(otherObjectList)
end


function planet.calculateGravity(self,otherObjectList)
    --constants
    
    local myMass = self.mass
    local addAccelX,addAccelY = 0,0 

    for i,v in pairs(otherObjectList) do
        local otherMass = v.mass 
        local deltaX = pixelsToMeters(v.x - self.x)
        local deltaY = pixelsToMeters(v.y - self.y)
        local distance = math.sqrt(deltaX * deltaX + deltaY * deltaY)
        local F = 0
        local angle = 0

        if(distance ~= 0) then
            angle  = math.atan2(deltaY,deltaX)
            F = calculateForceBetweenObjects(self,v,distance)
        end

        addAccelX = F * math.cos(angle)/ self.mass
        addAccelY = F * math.sin(angle)/ self.mass
        self.velocityX = self.velocityX + addAccelX
        self.velocityY =self.velocityY + addAccelY
    end
    self.x = self.x +  self.velocityX
    self.y = self.y +  self.velocityY
    
end


function planet.updateVelocity(self,Force,angle)
    addAccelX = Force * math.cos(angle)/ self.mass
    addAccelY = Force * math.sin(angle)/ self.mass
    self.velocityX = self.velocityX + addAccelX
    self.velocityY =self.velocityY + addAccelY
end

function planet.updatePosition(deltaX,deltaY)
    self.x = self.x + deltaX
    self.y = self.y + deltaY
end