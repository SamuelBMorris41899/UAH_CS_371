planets = {
    listOfPlanets = {},
    mobilePlanets = {}
}

function planets.add(self,newPlanet)
    table.insert(self.listOfPlanets,newPlanet)

end


function planets.getList(self)
    return self.listOfPlanets
end
