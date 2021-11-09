event = {}

function event.effect(self,severity) 
    globalTemp = globalTemp + 10 * severity
    butter.temp = butter.temp + severity
end

return event