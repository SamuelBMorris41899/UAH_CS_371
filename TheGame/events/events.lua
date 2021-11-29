local csv = require("csv")
local math =require("math")
events = {}
local csvFileName = system.pathForFile("events.csv") 
local f = csv.open(csvFileName,{separator = ",", header = true})
for fields in f:lines() do
    local e = {
        name = fields.Name,
        durration = 1,
        type = "event"
    }

    function e.start(self,durration,severity)
        self.durration = durration
    end

    function e.effect(self)
        print(self.name)
        globalTemp = globalTemp + fields.global
        butter.temp = butter.temp + fields.butter
        self.durration = self.durration - 1
    end

    function e.isOver(self)
        return self.durration <= 0
    end
    
    
    table.insert( events, e )
end 

-- eclipse = require("events.Eclipse")
-- table.insert( events, eclipse )

-- solarFlare = require("events.SolarStorm")
-- table.insert( events, solarFlare )

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