planets = {
    list = {}

}


function planets.add(self,toAdd)
    table.insert(planets.list,#planets + 1,toAdd)
end

function planets.new(self)
    local newPlanet = planet:clone()
    table.insert(planets.list,#planets + 1,newPlanet)
end

function planets.getList(self)
    return self.list
end