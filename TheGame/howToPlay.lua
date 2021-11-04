print("How To Play")

local composer = require( "composer" )
local scene = composer.newScene()



 -- "scene:create()"
 function scene:create( event )
    local sceneGroup = self.view

    local bg1 = display.newImage("Background_startScreen_with_Button_bigger.png")
    bg1.x = display.contentCenterX
    bg1.y = display.contentCenterY
     bg1.width = display.contentWidth
     bg1.height = display.contentHeight
     sceneGroup:insert(bg1)

     bgHowToPlayText = display.newText(
        {
          x = display.contentCenterX + 7,
          y = display.contentCenterY - 200,
          text = "How To Play", 
          font = native.systemFontBold,
          fontSize = 50,
        }
       )
       bgHowToPlayText:setFillColor( 0.36, 0.36, 0.36)
       sceneGroup:insert(bgHowToPlayText)

     howToPlayText = display.newText(
        {
          x = display.contentCenterX,
          y = display.contentCenterY - 200,
          text = "How To Play", 
          font = native.systemFontBold,
          fontSize = 50,
        }
       )
       howToPlayText:setFillColor( 0.99, 1, 0.61)
       sceneGroup:insert(howToPlayText)

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
