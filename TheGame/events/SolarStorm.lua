local solarStorm = {}
solarStorm.durration = 1
solarStorm.type = "event"
function solarStorm.start(self,durration,severity)
    self.durration = durration
end

function solarStorm.effect(self)
    print("solar Storm")
    globalTemp = globalTemp + 10
    butter.temp = butter.temp + 5
    self.durration = self.durration - 1
end

function solarStorm.isOver(self)
    return self.durration <= 0
end

return solarStorm