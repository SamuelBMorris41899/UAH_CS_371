print("Level Lost")
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()

local function backEvent( event )
  if event.phase == "began" then
    composer.hideOverlay("fade", 400)
  end
 end

local function exitLevelEvent(event)
  if event.phase == "began" then
    composer.gotoScene("GUI_Scenes.levelSelection")
  end
end

 -- "scene:create()"
 function scene:create( event )
   local sceneGroup = self.view

    local rect = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    rect:setFillColor(0.15, 0.15, 0.15, 0.8)
    sceneGroup:insert(rect)

    local bgLevelLostText = display.newText(
        {
          x = display.contentCenterX - 15,
          y = display.contentCenterY - 200,
          text = "Level Lost :(", 
          font = native.systemFontBold,
          fontSize = 40,
        }
       )
       bgLevelLostText:setFillColor( 0.36, 0.36, 0.36)
       sceneGroup:insert(bgLevelLostText)

     local levelLostText = display.newText(
        {
          x = display.contentCenterX - 20,
          y = display.contentCenterY - 200,
          text = "Level Lost :(", 
          font = native.systemFontBold,
          fontSize = 40,
        }
       )
       levelLostText:setFillColor( 0.98, 0.99, 0.45)
       sceneGroup:insert(levelLostText)

        local exitLevelButton = widget.newButton(
        {
            label = "Exit Level",
            fontSize = 35,
            emboss = false, --Properties for a rounded rectangle button
            shape = "roundedRect",
            width = 200,
            height = 60,
            x = display.contentCenterX,
            y = display.contentCenterY + 200,
            cornerRadius= 10,
            fillColor= { default={0.51, 0.51, 0.51}, over={0.36, 0.36, 0.36} },
            labelColor= { default={ 1, 1, 1}, over={ 0.8, 0.8, 0.8} },
            onEvent = exitLevelEvent,
            }
        )
        sceneGroup:insert(exitLevelButton)

         

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
