globalTemp = 105
currentLevelGroup = ""

butterBuilder = require("butter")
butter = butterBuilder:init()
butter:hide()

effects = require("effects")

--TEST AREA
coolerBuilder = require("items.cooler")
heaterBuilder = require("items.heater")

function tick()
    butter:tick()
    effects:globalTick()
end

gameLoopTimer = timer.performWithDelay( 1000, tick, 0)