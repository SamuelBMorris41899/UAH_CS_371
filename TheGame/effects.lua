effects = {
    list = {},
}

function effects.addCooler(self)--add cooler function
    newCooler = coolerBuilder:init(100,100)
    table.insert(self.list,newCooler)

    return newCooler
end

function effects.addHeater(self)-- add heater function
    newHeater = heaterBuilder:init(100,100)
    table.insert(self.list,newHeater)
    return newHeater
end

-- function effects.addDoge(self)
--     newDoge= dogeBuilder:init(100,100)
--     table.insert(self.list, newDoge);

-- end

-- function effects.addPeanut(self)
--     newDoge= peanutBuilder:init(100,100)
--     table.insert(self.list, newPeanut);

-- end

function effects.addEvent (self,event)
    table.insert(self.events,event)
end

function effects.globalTick(self)-- globl tick to update 
    for _,v in ipairs(self.list) do
        print("DOING SOMETHING!!")
        v:effect()
        --globalTemp = globalTemp + v.effect 
        print(globalTemp)
    end
end

return effects