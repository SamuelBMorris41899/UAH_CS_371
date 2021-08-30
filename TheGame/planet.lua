planet = {
    xPosition=0,
    yPosition=0,
    size = 10
}

function planet.clone(self)
    local copy = {}
    for key, value in pairs(self) do
        copy[key] = value
    end
    return copy
end

function planet.move(self,amount)
    self.xPosition = self.xPosition + amount
end


function planet.calculateGravity(self)
    
end