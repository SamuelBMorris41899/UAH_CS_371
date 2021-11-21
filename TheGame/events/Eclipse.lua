Eclipse = {}
function Eclipse.start(self,durration)
    Eclipse.durration = durration
end

function Eclipse.effect(self) 
    globalTemp = globalTemp - 10
    Eclipse.durration  - 1
end

return Eclipse