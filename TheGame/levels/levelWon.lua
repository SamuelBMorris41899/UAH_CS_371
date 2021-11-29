print("Level Won")
local widget = require( "widget" )
local composer = require( "composer" )
local heater = require("Items.heater")
local cooler = require("Items.cooler")
local scene = composer.newScene()
local dancingDoge = require("GUI_Objects.dancingDoge")

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

    local bgLevelWonText = display.newText(
        {
          x = display.contentCenterX - 15,
          y = display.contentCenterY - 200,
          text = "Level Won!!", 
          font = native.systemFontBold,
          fontSize = 40,
        }
       )
       bgLevelWonText:setFillColor( 0.36, 0.36, 0.36)
       sceneGroup:insert(bgLevelWonText)

     local levelWonText = display.newText(
        {
          x = display.contentCenterX - 20,
          y = display.contentCenterY - 200,
          text = "Level Won!!", 
          font = native.systemFontBold,
          fontSize = 40,
        }
       )
       levelWonText:setFillColor( 0.98, 0.99, 0.45)
       sceneGroup:insert(levelWonText)

      --  local exitOverlay = display.newImage("x.png")
      --  exitOverlay.x = display.contentCenterX + 125
      --  exitOverlay.y = display.contentCenterY - 200
      --  exitOverlay.width = exitOverlay.width*2
      --  exitOverlay.height = exitOverlay.height*2
      --  exitOverlay:addEventListener("touch", backEvent)
      --  sceneGroup:insert(exitOverlay)

       -- The options and frames of the Ryu sprite sheet.

       dancingDoge.anchorX = 0 -- Anchor the sprite to the left x
       dancingDoge.anchorY = 1 -- Anchor the sprite to the right x
       
       dancingDoge.x = display.contentCenterX - 45 -- Change the sprite x location
       dancingDoge.y = display.contentCenterY - 25 -- Change the sprite y location
       dancingDoge.xScale = 1.35
       dancingDoge.yScale = 1.35

      sceneGroup:insert(dancingDoge)
       
       local totalPtsRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY, 310, 50, 10)

       
       totalPtsRect:setFillColor( 0.51 )
       sceneGroup:insert(totalPtsRect)

       local totalPtsText = display.newText(
           {
               x = display.contentCenterX - 35,
               y = display.contentCenterY,
               text = "Total Time Survived!:", 
               font = native.systemFontBold,
               fontSize = 20,
           }
        )
        sceneGroup:insert(totalPtsText)

        local totalPts = display.newText(
           {
               x = display.contentCenterX + 100,
               y = display.contentCenterY,
               text = " 3 mins", 
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
               text = "Total DogeCoin:", 
               font = native.systemFontBold,
               fontSize = 20,
           }
        )
        sceneGroup:insert(timeInRangeText)

        local timeInRangePts = display.newText(
           {
               x = display.contentCenterX + 100,
               y = display.contentCenterY + 65,
               text = tostring(totalScore), 
               font = native.systemFont,
               fontSize = 25,
           }
        )
        if timeInRangePts.text == tostring(nil) then
            timeInRangePts.text = " 100"
        end
        sceneGroup:insert(timeInRangePts)

        local timeInTempRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY + 130, 310, 50, 10)
        timeInTempRect:setFillColor( 0.51 )
        sceneGroup:insert(timeInTempRect)

        local timeInTempText = display.newText(
           {
               x = display.contentCenterX - 40,
               y = display.contentCenterY + 130,
               text = "Events Survived:", 
               font = native.systemFontBold,
               fontSize = 20,
           }
        )
        sceneGroup:insert(timeInTempText)

        local timeInTempPts = display.newText(
           {
               x = display.contentCenterX + 100,
               y = display.contentCenterY + 130,
               text = "6", 
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
