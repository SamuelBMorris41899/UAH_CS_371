
-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
display.setStatusBar(display.hiddenStatusBar);


local widget = require("widget")
local heater = require("Items.heater")
local cooler = require("items.cooler")
local composer = require( "composer" )

globalTemp = 75
currentLevelGroup = nil

butterBuilder = require("butter")
butter = butterBuilder:init()
butter:hide()

effects = require("effects")
events = require("events.events")
coolerBuilder = require("items.cooler")
heaterBuilder = require("items.heater")


function tick()
    local i = 0
    print ("i: ".. i)
    butter:tick()
    effects:globalTick()
    updateScene()
    if(butter:gameLost()) then 
        timer.cancel(gameLoopTimer)
        gameLoopTimer = nil
        timer.cancel(eventLoopTimer)
        eventLoopTimer = nil
        timer.cancel(gameTimer)
        gameTimer = nil
        
        heater:removeHeater()
        cooler:removeCooler()
        local options = {
            isModal = true,
            effect = "fade",
            time = 400,
        } 
        composer.showOverlay( "loseScreen", options )
    end 
    i = i +1
end

secondsBetweenEvents = 30

MINIMUM_EVENT_DURRATION = 1
MAXIMUM_EVENT_DURRATION = 10
MINIMUM_EVENT_SEVERITY = 1
MAXIMUM_EVENT_SEVERITY = 5

function eventStartLoop(e)
    local j = 0
    print("j: "..j)
    newEvent = events:startRandomEvent(MINIMUM_EVENT_DURRATION,MAXIMUM_EVENT_DURRATION,MINIMUM_EVENT_SEVERITY,MAXIMUM_EVENT_SEVERITY)
    
    effects:addEvent(newEvent)
end


function gameWon()
    timer.cancel(gameLoopTimer)
    gameLoopTimer = nil
    timer.cancel(eventLoopTimer)
    eventLoopTimer = nil
    timer.cancel(gameTimer)
    gameTimer = nil
    
    heater:removeHeater()
    cooler:removeCooler()
    local options = {
        isModal = true,
        effect = "fade",
        time = 400,
     }  
    composer.showOverlay( "levels.levelWon", options )
end




require("rocketEnviroment"); -- this will start the model...

--Code to initialize your app
--Assumes that "scene1.lua" exists and is configured as a Composer scene
composer.gotoScene( "GUI_Scenes.mainScreen" )

