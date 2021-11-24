local math =require("math")
events = {}

eclipse = require("Eclipse")
table.insert( events, eclipse )

solarFlare =require("SolarStorm")
table.insert( events, solarFlare )

function getRandomEvent()
    event = events[math.random(#myTable)]
    event:start() 
    return event
end

return events