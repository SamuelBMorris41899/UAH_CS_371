effects = {
    list = {},
}

function effects.addCooler(self)
    newCooler = nil 
    if(self.cooler == nil ) then 
        newCooler = coolerBuilder:init(100,300)
        newCooler:toFront()
        table.insert(self.list,newCooler)
    else
        self.cooler:upgrade()
        newCooler = self.cooler
    end
    return newCooler
end

function effects.addHeater(self)
    newHeater = nil 
    if(self.heater == nil ) then 
        newHeater = heaterBuilder:init(150,200)
        table.insert(self.list,newHeater)
    else
        self.heater:upgrade()
        newHeater = self.heater
    end

    table.insert(self.list,newHeater)

    return newHeater
end

function effects.addEvent (self,event)
    table.insert(self.events,event)
end

function effects.globalTick(self)
    for _,v in ipairs(self.list) do
        v:effect()
    end
end

return effects