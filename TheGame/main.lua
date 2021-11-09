
-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--display.setStatusBar(display.hiddenStatusBar);

--centripital force equation
--Use this to find a good inital velocity


local widget = require("widget")
require("butter")

--Here Testing
butter:init()



globalTemp = 72

local composer = require( "composer" )
--Code to initialize your app
--Assumes that "scene1.lua" exists and is configured as a Composer scene
composer.gotoScene( "mainScreen" )

