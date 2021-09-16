--[[
TODO: make this the solar system object.

add a function to add a new planet with the parameters of the new planet

--]]

planets = {
    listOfPlanets = {},
    mobilePlanets = {}
}

function planets.add(self,newPlanet)
    table.insert(planets.listOfPlanets,newPlanet)
end


function planets.getList(self)
    return planets.listOfPlanets
end

function planets:update(self) 

    for _,planet in ipairs(planets.listOfPlanets) do 
        planet:move(planets.listOfPlanets)
    end
end