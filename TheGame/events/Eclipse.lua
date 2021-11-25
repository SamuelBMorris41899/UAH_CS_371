local Eclipse = {}
Eclipse.durration = 1
Eclipse.type = "event"

function Eclipse.start(self,durration,severity)
    self.durration = durration
end

function Eclipse.effect(self) 
    print("Eclipse")
    globalTemp = globalTemp - 10
    self.durration = self.durration  - 1
end

function Eclipse.isOver(self)
    return self.durration <= 0
end

return Eclipse