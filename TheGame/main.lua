
-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
display.setStatusBar(display.hiddenStatusBar);


local widget = require("widget")

local composer = require( "composer" )



globalTemp = 105
currentLevelGroup = nil

butterBuilder = require("butter")
butter = butterBuilder:init()
butter:hide()

effects = require("effects")

coolerBuilder = require("items.cooler")
heaterBuilder = require("items.heater")

function tick()
    butter:tick()
    effects:globalTick()
    updateScene()
end

function eventStartLoop()
    
end

gameLoopTimer = timer.performWithDelay( 1000, tick, 0)

eventLoopTimer = timer.performWithDelay( 10000, tick, 0) --let there be an even once every 10 seconds of so...




require("rocketEnviroment"); -- this will start the model...

--Code to initialize your app
--Assumes that "scene1.lua" exists and is configured as a Composer scene
composer.gotoScene( "GUI_Scenes.mainScreen" )

