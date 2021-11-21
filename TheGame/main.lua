
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

--TEST AREA
coolerBuilder = require("items.cooler")
heaterBuilder = require("items.heater")

function tick()
    butter:tick()
    effects:globalTick()
    updateScene()
end

gameLoopTimer = timer.performWithDelay( 1000, tick, 0)




require("rocketEnviroment"); -- this will start the model...

--Code to initialize your app
--Assumes that "scene1.lua" exists and is configured as a Composer scene
composer.gotoScene( "GUI_Scenes.mainScreen" )

