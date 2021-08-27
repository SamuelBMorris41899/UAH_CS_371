planet = {
    x = 0,
    y = 0,
    size = 0
    self.image = display.newCircle(x,y,size);
}

function planet.init(self,x,y,size)
    self.x = x
    self.y = y
    self.size = size
    self.image.size = self.size
    newPlanet = {}
    for i,v in ipairs(planet) do
        newPlanet[i] = v
    end
    return newPlanet
end
function planet.resize(self,size)
    self.size = size
    self.image.size = self.size
    return self
end

function planet.move(self,x,y)
    self.x = self.x + x
    self.y = self.y + y
    image.transform(x,y)
    image.x = self.x
    image.y = self.y
end