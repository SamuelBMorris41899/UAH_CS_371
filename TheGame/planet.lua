require("utility")

--Here to initalize the table
planet = {}

--constructor
function planet.init(self,aXPos,aYPos,aSize)
    --Start out by making a circle
    local copy = display.newCircle(aXPos,aYPos,aSize);
    
    AppendFunctionsFromAtoB(self,copy)
    
    planet.velocityX = 0
    planet.velocityY = 0
    planet.isMovable = true
    
    return copy
end


function planet.move(self,otherObjectList)
    if(self.isMovable) then
        self:calculateGravity(otherObjectList)
        self.x = self.x + self.velocityX 
        self.y = self.x + self.velocityY
    end
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