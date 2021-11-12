local math =require("math")
events = {}

eclipse = require("Eclipse")
table.insert( events, eclipse )

solarFlare =require("SolarStorm")
table.insert( events, solarFlare )

function getRandomEvent()
    return events[math.random(#myTable)]
end

return events;