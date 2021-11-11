globalTemp = 105
currentLevelGroup = ""

require("butter")
butter = butterBuilder:init()
butter.xScale = .1
butter.yScale = .1

effects = require("effects")

--TEST AREA
coolerBuilder = require("items.cooler")
heaterBuilder = require("items.heater")

function tick()
    butter:tick()
    effects:globalTick()
end

gameLoopTimer = timer.performWithDelay( 1000, tick, 0)