
local shopButtonCreator = require("shopButton");

function action1 (event ) 
    print("1")
end

shopButtonCreator:newButton({})


-- local composer = require( "composer" )
-- --Code to initialize your app
-- --Assumes that "scene1.lua" exists and is configured as a Composer scene
-- composer.gotoScene( "mainScreen" )