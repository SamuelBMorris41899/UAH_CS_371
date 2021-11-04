print("Level 0")
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()

local function pauseListener( event )
    if event.phase == "began" then
        local options = {
        isModal = true,
        effect = "fade",
        time = 400,
        }  
       composer.showOverlay( "pause", options )
    end
end 

 -- "scene:create()"
 function scene:create( event )
   local sceneGroup = self.view

    local bg1 = display.newImage("Deep Space.png")
    bg1.x = display.contentCenterX
    bg1.y = display.contentCenterY
    bg1.width = display.contentWidth
    bg1.height = display.contentHeight
    sceneGroup:insert(bg1)

    local bg2 = display.newImage("Rocket.png")
    bg2.x = display.contentCenterX
    bg2.y = display.contentCenterY
    bg2.width = display.contentWidth
    bg2.height = display.contentHeight
    sceneGroup:insert(bg2)

    local dogeCoinText = display.newText(
        {
          x = display.contentCenterX - 100,
          y = display.contentCenterY - 225,
          text = "DogeCoin: ", 
          font = native.systemFontBold,
          fontSize = 20,
        }
    )
    dogeCoinText:setFillColor( 0.98, 0.99, 0.45)
    sceneGroup:insert(dogeCoinText)

    local pauseIcon = display.newImage("PauseIcon.png")
    pauseIcon.x = display.contentCenterX + 125
    pauseIcon.y = display.contentCenterY - 210
    pauseIcon.width = pauseIcon.width/2
    pauseIcon.height = pauseIcon.height/2
    pauseIcon:addEventListener("tap", pauseListener)
    sceneGroup:insert(pauseIcon) 

    local bgTempRangeText = display.newText(
        {
          x = display.contentCenterX + 112,
          y = display.contentCenterY - 165,
          text = "Temperature\n     Range:", 
          font = native.systemFontBold,
          fontSize = 15,
        }
       )
       bgTempRangeText:setFillColor( 0.36, 0.36, 0.36)
       sceneGroup:insert(bgTempRangeText)
  
     local tempRangeText = display.newText(
        {
          x = display.contentCenterX + 110,
          y = display.contentCenterY - 165,
          text = "Temperature\n     Range:", 
          font = native.systemFontBold,
          fontSize = 15,
        }
    )
    tempRangeText:setFillColor( 0.98, 0.99, 0.45)
    sceneGroup:insert(tempRangeText)
    
    local bgTempRangeNum = display.newText(
      {
        x = display.contentCenterX + 112,
        y = display.contentCenterY - 130,
        text = "85F-65F", 
        font = native.systemFontBold,
        fontSize = 23,
      }
     )
     bgTempRangeNum:setFillColor( 0.36, 0.36, 0.36)
     sceneGroup:insert(bgTempRangeNum)

     local tempRangeNum = display.newText(
      {
        x = display.contentCenterX + 110,
        y = display.contentCenterY - 130,
        text = "85F-65F", 
        font = native.systemFontBold,
        fontSize = 23,
      }
     )
     tempRangeNum:setFillColor( 0.98, 0.99, 0.45)
     sceneGroup:insert(tempRangeNum)

    local bgPerfectTempText = display.newText(
     {
        x = display.contentCenterX - 117,
        y = display.contentCenterY - 165,
        text = "     Perfect\n Tempeature:",
        font = native.systemFontBold,
        fontSize = 15
     }
  )
  bgPerfectTempText:setFillColor( 0.36, 0.36, 0.36)
  sceneGroup:insert(bgPerfectTempText)

  local perfectTempText = display.newText(
     {
        x = display.contentCenterX - 115,
        y = display.contentCenterY - 165,
        text = "     Perfect\n Tempeature:",
        font = native.systemFontBold,
        fontSize = 15
     }
  )
  perfectTempText:setFillColor( 0.98, 0.99, 0.45)
  sceneGroup:insert(perfectTempText)

  local bgPerfectTempNum = display.newText(
      {
        x = display.contentCenterX - 115,
        y = display.contentCenterY - 130,
        text = "75F", 
        font = native.systemFontBold,
        fontSize = 23,
      }
     )
     bgPerfectTempNum:setFillColor( 0.36, 0.36, 0.36)
     sceneGroup:insert(bgPerfectTempNum)

     local perfectTempNum = display.newText(
      {
        x = display.contentCenterX - 113,
        y = display.contentCenterY - 130,
        text = "75F", 
        font = native.systemFontBold,
        fontSize = 23,
      }
     )
     perfectTempNum:setFillColor( 0.98, 0.99, 0.45)
     sceneGroup:insert(perfectTempNum)

    local tempRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY + 200, 300, 50, 10)
    tempRect:setFillColor( 0.51 )
    sceneGroup:insert(tempRect)
    local bgTempText = display.newText(
        {
            x = display.contentCenterX - 37,
            y = display.contentCenterY + 200,
            text = "Temperature: ",
            font = native.systemFontBold,
            fontSize = 30
        }
    
    )
    bgTempText:setFillColor( 0.36, 0.36, 0.36)
    sceneGroup:insert(bgTempText)

    local tempText = display.newText(
        {
            x = display.contentCenterX - 40,
            y = display.contentCenterY + 200,
            text = "Temperature: ",
            font = native.systemFontBold,
            fontSize = 30
        }
    )
    tempText:setFillColor( 0.98, 0.99, 0.45)
    sceneGroup:insert(tempText)

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
