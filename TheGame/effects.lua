effects = {
    list = {},
}

function effects.addCooler(self)
<<<<<<< Updated upstream
    newCooler = coolerBuilder:init(100,100)
    table.insert(self.list,newCooler)

=======
    local newCooler = nil 
    if(self.cooler == nil ) then 
        newCooler = coolerBuilder:init(100,300)
        newCooler:toFront()
        table.insert(self.list,newCooler)
    else
        self.cooler:upgrade()
        newCooler = self.cooler
    end
>>>>>>> Stashed changes
    return newCooler
end

function effects.addHeater(self)
<<<<<<< Updated upstream
    newHeater = heaterBuilder:init(100,100)
    table.insert(self.list,newHeater)
=======
    local newHeater = nil 
    if(self.heater == nil ) then 
        newHeater = heaterBuilder:init(150,200)
        table.insert(self.list,newHeater)
    else
        self.heater:upgrade()
        newHeater = self.heater
    end

    -- table.insert(self.list,newHeater)

>>>>>>> Stashed changes
    return newHeater
end

function effects.addEvent (self,event)
    table.insert(self.events,event)
end

function effects.globalTick(self)
    for _,v in ipairs(self.list) do
        print("DOING SOMETHING!!")
        v:effect()
        --globalTemp = globalTemp + v.effect 
        print(globalTemp)
    end
end

return effects