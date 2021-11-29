
-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
display.setStatusBar(display.hiddenStatusBar);


local widget = require("widget")

local composer = require( "composer" )

<<<<<<< Updated upstream
=======
globalTemp = 75
currentLevelGroup = nil

butterBuilder = require("butter")
butter = butterBuilder:init()
butter:hide()

effects = require("effects")
events = require("events.events")
coolerBuilder = require("items.cooler")
heaterBuilder = require("items.heater")

levelLost = false;
function tick()
    butter:tick()
    effects:globalTick()
    updateScene()
    if(butter:gameLost() and levelLost == false) then 
        print("Going to lose")
        levelLost =true;
        local options = {
            isModal = true,
            effect = "fade",
            time = 400,
        } 
        composer.showOverlay( "loseScreen", options )
    end 
end

function gameTimerFun()
    gameLoopTimer = timer.performWithDelay( 1000, tick, 0)
    eventLoopTimer = timer.performWithDelay( secondsBetweenEvents * 1000, eventStartLoop, 0) --let there be an even once every 10 seconds of so...
end

secondsBetweenEvents = 30

MINIMUM_EVENT_DURRATION = 3
MAXIMUM_EVENT_DURRATION = 10
MINIMUM_EVENT_SEVERITY = 1
MAXIMUM_EVENT_SEVERITY = 5

function eventStartLoop(e)
    
    newEvent = events:startRandomEvent(MINIMUM_EVENT_DURRATION,MAXIMUM_EVENT_DURRATION,MINIMUM_EVENT_SEVERITY,MAXIMUM_EVENT_SEVERITY)
    
    effects:addEvent(newEvent)
end



gameTimer = timer.performWithDelay( 180000, gameTimerFun, 1)
gameTimer.pause()


>>>>>>> Stashed changes
require("rocketEnviroment"); -- this will start the model...

--Code to initialize your app
--Assumes that "scene1.lua" exists and is configured as a Composer scene
composer.gotoScene( "GUI_Scenes.mainScreen" )

