local math =require("math")
events = {}

eclipse = require("Eclipse")
table.insert( events, eclipse )

solarFlare =require("SolarStorm")
table.insert( events, solarFlare )

acOn = require("ACOn")
table.insert(events, acOn)

heatOn = require("HeatOn")
table.insert(events, heatOn)

function getRandomEvent()
    return events[math.random(#myTable)]
end
return events;