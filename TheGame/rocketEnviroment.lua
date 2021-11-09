globalTemp = 105

require("butter")
butter = b:init()

function tick() 
    butter:tick()    
end

gameLoopTimer = timer.performWithDelay( 1000, tick, 0)