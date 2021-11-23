print("level Selection")
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()

local function backEvent( event )--function to go back to mainscreen
   if event.phase == "began" then
   composer.gotoScene( "GUI_Scenes.mainScreen" )
   end
end

local function level0Listener(event)--funtion to go to level0 scene
   if event.phase == "began" then
   composer.gotoScene("levels.level0")
   end
end

local function level1Listener(event)--funtion to go to level1 scene
   if event.phase == "began" then
   composer.gotoScene("levels.level1")
   end
end

local function level2Listener(event)--funtion to go to level2 scene
   if event.phase == "began" then
   composer.gotoScene("levels.level2")
   end
end

local function level3Listener(event)--funtion to go to level3 scene
   if event.phase == "began" then
   composer.gotoScene("levels.level3")
   end
end

local function level4Listener(event)--funtion to go to level4 scene
   if event.phase == "began" then
   composer.gotoScene("levels.level4")
   end
end

 -- "scene:create()"
 function scene:create( event )
    local sceneGroup = self.view --creates group
    
    local bg1 = display.newImage("Background_startScreen_with_Button_bigger.png") --create the background
    bg1.x = display.contentCenterX
    bg1.y = display.contentCenterY
     bg1.width = display.contentWidth
     bg1.height = display.contentHeight --makes the size to cover screen
     sceneGroup:insert(bg1) --insertt the background to group to disappear when new scene called
     
     local rect0 = display.newRoundedRect(display.contentCenterX - 73, display.contentCenterY - 98, 90, 90, 5)
     rect0:setFillColor(0.36) -- creates a rectangle and inserts to group
     sceneGroup:insert(rect0)

     local level0 = display.newImage("level0_Icon.png")
       level0.x = display.contentCenterX + 45
       level0.y = display.contentCenterY + 100
       sceneGroup:insert(level0)-- code to create image of level 0 and size

       rect0:addEventListener("touch", level0Listener)-- event to go to level0 scene

       local rect1 = display.newRoundedRect(display.contentCenterX + 71, display.contentCenterY - 98, 91, 91, 5)
       rect1:setFillColor(0.36) --second rectangle for level1 
       sceneGroup:insert(rect1)

       local level1 = display.newImage("level1_Icon.png")
       level1.x = display.contentCenterX + 130  
       level1.y = display.contentCenterY + 210
       sceneGroup:insert(level1)--creates image for the level1 and positions it

       rect1:addEventListener("touch", level1Listener)--event for level1

       local rect2 = display.newRoundedRect(display.contentCenterX  - 74, display.contentCenterY + 2, 91, 91, 5)
       rect2:setFillColor(0.36)--the third rectangle for the level2 icon
       sceneGroup:insert(rect2)

       local level2 = display.newImage("level2_Icon.png")--displays the level2 icon and its position
       level2.x = display.contentCenterX  - 15
       level2.y = display.contentCenterY + 310
       sceneGroup:insert(level2)

       rect2:addEventListener("touch", level2Listener)--eventlistener for level2 scene

       local rect3 = display.newRoundedRect(display.contentCenterX + 71, display.contentCenterY + 2, 91, 91, 5)
       rect3:setFillColor(0.36)
       sceneGroup:insert(rect3)-- fourth rectangle for level 3 icon

       local level3 = display.newImage("level3_Icon.png")
       level3.x = display.contentCenterX + 130
       level3.y = display.contentCenterY + 310
       sceneGroup:insert(level3)-- level3 icon with its position on screen

       rect3:addEventListener("touch", level3Listener)--eventlistenr for level3

       local rect4 = display.newRoundedRect(display.contentCenterX - 74, display.contentCenterY + 101, 91, 91, 5)
       rect4:setFillColor(0.36)
       sceneGroup:insert(rect4)--fifth rectangle for the level4 icon

       local level4 = display.newImage("level4_Icon.png")
       level4.x = display.contentCenterX - 15
       level4.y = display.contentCenterY + 410
       sceneGroup:insert(level4)--position and diplay of level4 icon

       rect4:addEventListener("touch", level4Listener)-- level4 listenr with touch event



     local bgLevelSelectionText = display.newText(--displays text for level seletion
        {
          x = display.contentCenterX + 7,
          y = display.contentCenterY - 200,
          text = "Level Selection", 
          font = native.systemFontBold,
          fontSize = 40,
        }
       )
       bgLevelSelectionText:setFillColor( 0.36, 0.36, 0.36)
       sceneGroup:insert(bgLevelSelectionText)

       local levelSelection = display.newText(
        {
          x = display.contentCenterX,
          y = display.contentCenterY - 200,
          text = "Level Selection", 
          font = native.systemFontBold,
          fontSize = 40,
        }
       )
       levelSelection:setFillColor( 0.98, 0.99, 0.45)
       sceneGroup:insert(levelSelection)
       

       backButton = widget.newButton(--back button 
    {
        label = "Go Back",
        fontSize = 35,
        emboss = false, --Properties for a rounded rectangle button
        shape = "roundedRect",
        width = 200,
        height = 60,
        x = display.contentCenterX,
        y = display.contentCenterY + 200,
        cornerRadius= 10,
        fillColor= { default={0.51, 0.51, 0.51}, over={0.36, 0.36, 0.36} },
        labelColor= { default={ 1, 1, 1 }, over={ 0.8, 0.8, 0.8 } },
        onEvent = backEvent,
        }
    )
    sceneGroup:insert(backButton)--insert back button to group
       
 end


 -- "scene:show()"
 function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then

    elseif ( phase == "did" ) then

    end
 end

 -- "scene:hide()"
 function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then

       transition.cancel(scene1)
    elseif ( phase == "did" ) then

    end
 end

 -- "scene:destroy()"
 function scene:destroy( event )

    local sceneGroup = self.view

 end

 ---------------------------------------------------------------------------------

 -- Listener setup
 scene:addEventListener( "create", scene )
 scene:addEventListener( "show", scene )
 scene:addEventListener( "hide", scene )
 scene:addEventListener( "destroy", scene )

 ---------------------------------------------------------------------------------

 return scene
