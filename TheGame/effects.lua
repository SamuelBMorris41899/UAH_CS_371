effects = {
    list = {},
}


function effects.addCooler(self)
    newCooler = nil 
    if(self.cooler == nil ) then 
        newCooler = coolerBuilder:init(100,300)
        self.cooler = newCooler
        table.insert(self.list,newCooler)
    else
        self.cooler:upgrade()
        newCooler = self.cooler
    end
    return newCooler
end

function effects.addHeater(self)
    print("add heater")

    newHeater = nil
    if(self.heater == nil) then 
        newHeater = heaterBuilder:init(150,200)
        self.heater = newHeater
        table.insert(self.list,newHeater)
    else
        self.heater:upgrade()
        newHeater = self.heater
    end

    table.insert(self.list,newHeater)
    
    return newHeater
end

function effects.addEvent (self,event)
    table.insert(self.list,event)
end

function effects.globalTick(self)
    local toRemove = {}
    for i,v in ipairs(self.list) do
        v:effect()
        --if this is an event....
        if(v.type ~= nil and v.type == "event") then 
            if(v:isOver()) then --make expired events for deletion 
                table.insert( toRemove, i )
            end
        end
    end
    --del events
    for _,v in ipairs(toRemove) do 
        table.remove( effects.list, v)
    end
end

return effects