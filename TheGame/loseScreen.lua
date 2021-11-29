print("Level Lost")
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()

-- local function backEvent( event )
--   if event.phase == "began" then
--     composer.hideOverlay("fade", 400)
--   end
--  end

local function exitLevelEvent(event)
  if event.phase == "began" then
    composer.gotoScene("GUI_Scenes.levelSelection")
  end
end

 -- "scene:create()"
 function scene:create( event )
   local sceneGroup = self.view

    local rect = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    rect:setFillColor(0.15, 0.15, 0.15, 0.9)
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

    --    local exitOverlay = display.newImage("x.png")
    --    exitOverlay.x = display.contentCenterX + 125
    --    exitOverlay.y = display.contentCenterY - 200
    --    exitOverlay.width = exitOverlay.width*2
    --    exitOverlay.height = exitOverlay.height*2
    --    exitOverlay:addEventListener("touch", backEvent)
    --    sceneGroup:insert(exitOverlay)


       
       local totalPtsRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY, 310, 50, 10)

       
       totalPtsRect:setFillColor( 0.51 )
       sceneGroup:insert(totalPtsRect)

       local totalPtsText = display.newText(
           {
               x = display.contentCenterX - 35,
               y = display.contentCenterY,
               text = "Total Doge Coin Made:", 
               font = native.systemFontBold,
               fontSize = 20,
           }
        )
        sceneGroup:insert(totalPtsText)

        local totalPts = display.newText(
           {
               x = display.contentCenterX + 100,
               y = display.contentCenterY,
               text = "100", 
               font = native.systemFont,
               fontSize = 25,
           }
        )
        sceneGroup:insert(totalPts)

        local timeInRangeRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY + 65, 310, 50, 10)
        timeInRangeRect:setFillColor( 0.51 )
        sceneGroup:insert(timeInRangeRect)

        local timeInRangeText = display.newText(
           {
               x = display.contentCenterX - 35,
               y = display.contentCenterY + 65,
               text = "Time in Perfect Range:", 
               font = native.systemFontBold,
               fontSize = 20,
           }
        )
        sceneGroup:insert(timeInRangeText)

        local timeInRangePts = display.newText(
           {
               x = display.contentCenterX + 100,
               y = display.contentCenterY + 65,
               text = "100", 
               font = native.systemFont,
               fontSize = 25,
           }
        )
        sceneGroup:insert(timeInRangePts)

        local timeInTempRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY + 130, 310, 50, 10)
        timeInTempRect:setFillColor( 0.51 )
        sceneGroup:insert(timeInTempRect)

        local timeInTempText = display.newText(
           {
               x = display.contentCenterX - 40,
               y = display.contentCenterY + 130,
               text = "Time in Perfect Temp:", 
               font = native.systemFontBold,
               fontSize = 20,
           }
        )
        sceneGroup:insert(timeInTempText)

        local timeInTempPts = display.newText(
           {
               x = display.contentCenterX + 100,
               y = display.contentCenterY + 130,
               text = "100", 
               font = native.systemFont,
               fontSize = 25,
           }
        )
        sceneGroup:insert(timeInTempPts)

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
