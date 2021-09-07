require("utility")
--Mpn wed fri 940
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
    local G = 6.67408 * 10 ^ 11
    local myMass = self.mass
    local addAccelX,addAccelY = 0,0 

    for i,v in pairs(otherObjectList) do
        local otherMass = v.mass 
        local deltaX = self.x - v.x
        local deltaY = self.y - v.y
        local distanceInPixels = math.sqrt(deltaX * deltaX + deltaY * deltaY) --distance in pixels
        local distance = pixelsToMeters(distanceInPixels)

        local F = 0
        local angle = 0

        if(distance ~= 0) then
            angle  = math.acos(deltaX/math.sqrt(distance))
            print(self.name,v.name,angle,distance)
            F = G * myMass * otherMass / ((distance)^2) 
        end
        addAccelX = F * math.cos(angle)/ myMass
        addAccelY = F * math.sin(angle)/ myMass
        self.velocityX = self.velocityX + addAccelX
        self.velocityY =self.velocityY + addAccelY
    end
    self.x = self.x + self.velocityX 
    self.y = self.y + self.velocityY
end