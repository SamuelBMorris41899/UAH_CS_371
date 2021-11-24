solarStorm = {}

function solarStorm.start(self,durration)
    solarStorm.durration = durration
end

function solarStorm.effect(self) 
    globalTemp = globalTemp + 10
    butter.temp = butter.temp + 5
    solarStorm.durration = solarStorm.durration - 1
end

return solarStorm