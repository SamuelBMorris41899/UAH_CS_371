
-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
display.setStatusBar(display.hiddenStatusBar);


local widget = require("widget")

local composer = require( "composer" )

require("rocketEnviroment"); -- this will start the model...

--Code to initialize your app
--Assumes that "scene1.lua" exists and is configured as a Composer scene
composer.gotoScene( "GUI_Scenes.mainScreen" )

