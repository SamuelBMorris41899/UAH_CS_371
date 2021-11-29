local math =require("math")
events = {}

eclipse = require("events.Eclipse")
table.insert( events, eclipse )

solarFlare = require("events.SolarStorm")
table.insert( events, solarFlare )

--Name,globalTempEffect,butterTempEffect,Min durr,Max durr
 
function events.startRandomEvent(self,minDuration,maxDuration,minServerity,maxServerity)
    print(#events)
    eventNum = math.random(#events)
    print(eventNum)
    e = events[eventNum]
    e:start(math.random(minDuration,maxDuration),math.random(minServerity,maxServerity)) 
    return e
end

return events