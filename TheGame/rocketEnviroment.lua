globalTemp = 105

require("butter")
butter = butterBuilder:init()


--TEST AREA
coolerBuilder = require("cooler")

coolerBuilder:init(200,200)

coolerBuilder:init(100,200)

function tick()
    butter:tick()
end

gameLoopTimer = timer.performWithDelay( 1000, tick, 0)