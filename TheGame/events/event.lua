local event = {}

event.durration = 1
event.type = "event"
function event.effect(self) 
    --NONE
end

function event.start(self,durration,severity)

end

function event.isOver(self)
    return self.durration <= 0
end

return event