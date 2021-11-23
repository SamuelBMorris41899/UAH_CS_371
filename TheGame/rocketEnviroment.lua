globalTemp = 105-- the global temperature is 105 used as a cap on how high temperature gets
currentLevelGroup = ""

butterBuilder = require("butter")-- butter file called and its return is put into butterbuilder
butter = butterBuilder:init()-- inits it into butter
butter:hide()--butter hides

effects = require("effects")

--TEST AREA
coolerBuilder = require("items.cooler")-- calls the items
heaterBuilder = require("items.heater")

function tick()-- uses the tick funtion  and global tick from effects file
    butter:tick()
    effects:globalTick()
end

gameLoopTimer = timer.performWithDelay( 1000, tick, 0)--sets a timer to update tick