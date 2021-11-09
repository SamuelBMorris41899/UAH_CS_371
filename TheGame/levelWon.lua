print("Level Won")
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
    composer.gotoScene("levelSelection")
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

       local exitOverlay = display.newImage("x.png")
       exitOverlay.x = display.contentCenterX + 125
       exitOverlay.y = display.contentCenterY - 200
       exitOverlay.width = exitOverlay.width*2
       exitOverlay.height = exitOverlay.height*2
       exitOverlay:addEventListener("touch", backEvent)
       sceneGroup:insert(exitOverlay)

       -- The options and frames of the Ryu sprite sheet.
      local doge_opt = {
      frames = {
            -- Dancing
            {x = 31, y = 20, width = 66, height = 108}, -- frame 1
            {x = 161, y = 4, width = 66, height = 111}, -- frame 2
            {x = 287, y = 9, width = 69, height = 114}, -- frame 3
            {x = 413, y = 13, width = 75, height = 114}, -- frame 4
            {x = 546, y = 21, width = 71, height = 106}, -- frame 5
            {x = 29, y = 148, width = 72, height = 108}, -- frame 6
            {x = 155, y = 144, width = 73, height = 112},-- frame 7
            {x = 286, y = 131, width = 67, height = 114}, -- frame 8
            {x = 421, y = 135, width = 60, height = 115}, -- frame 9
            {x = 550, y = 145, width = 63, height = 110}, -- frame 10
            {x = 29, y = 288, width = 67, height = 96}, -- frame 11
            {x = 159, y = 286, width = 67, height = 99}, -- frame 12
      }
      }

      local doge_sheet = graphics.newImageSheet("dogeSpriteT.png", doge_opt)

      -- Setting each animation according to their frames as well as giving them each a time and correct loop count.
      local doge_sequenceData = {
         {name = "dancing", start = 1, count = 12, time = 1520, loopCount = 0},
      }

      -- Creating the sprite and setting correct options.
      local sheet = doge_sheet;
      local sequenceData = doge_sequenceData;
      anim = display.newSprite(sheet, sequenceData)
      anim:setSequence("dancing") -- Set first animation to idle
      anim.anchorX = 0 -- Anchor the sprite to the left x
      anim.anchorY = 1 -- Anchor the sprite to the right x
      anim.x = display.contentCenterX - 45 -- Change the sprite x location
      anim.y = display.contentCenterY - 25 -- Change the sprite y location
      anim.xScale = 1.35
      anim.yScale = 1.35
      anim:play()
      sceneGroup:insert(anim)


       
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
