print("Level 0")
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()


 -- "scene:create()"
 function scene:create( event )
   local sceneGroup = self.view

    local bg1 = display.newImage("Landing on moon.png")
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
    sceneGroup:insert(pauseIcon) 

    local tempRect = display.newRoundedRect(display.contentCenterX - 10, display.contentCenterY + 200, 250, 50, 10)
    tempRect:setFillColor( 0.51 )
    sceneGroup:insert(tempRect)
    local bgTempText = display.newText(
        {
            x = display.contentCenterX - 28,
            y = display.contentCenterY + 200,
            text = "Temperature: ",
            font = native.systemFontBold,
            fontSize = 30
        }
    
    )
    bgTempText:setFillColor( 0.36, 0.36, 0.36)

    local tempText = display.newText(
        {
            x = display.contentCenterX - 30,
            y = display.contentCenterY + 200,
            text = "Temperature: ",
            font = native.systemFontBold,
            fontSize = 30
        }
    )
    tempText:setFillColor( 0.98, 0.99, 0.45)
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
