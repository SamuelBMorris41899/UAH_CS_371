effects = {
    list = {},
}

function effects.addCooler(self)
    newCooler = coolerBuilder:init(100,100)
    table.insert(self.list,newCooler)

    return newCooler
end

function effects.addHeater(self)
    newHeater = heaterBuilder:init(100,100)
    table.insert(self.list,newHeater)
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