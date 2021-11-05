print("Shop")
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()


local function exitListener( event )
  if event.phase == "began" then
    composer.hideOverlay("fade", 400)
  end
 end


 -- "scene:create()"
 function scene:create( event )
   local sceneGroup = self.view

    local bg1 = display.newImage("Shop IDea.png")
    bg1.x = display.contentCenterX
    bg1.y = display.contentCenterY
    bg1.width = display.contentWidth
    bg1.height = display.contentHeight
    sceneGroup:insert(bg1)


    local bgShopText = display.newText(
        {
          x = display.contentCenterX - 18,
          y = display.contentCenterY - 250,
          text = "Shop", 
          font = native.systemFontBold,
          fontSize = 60,
        }
       )
       bgShopText:setFillColor( 0.36, 0.36, 0.36)
       sceneGroup:insert(bgShopText)

     local shopText = display.newText(
        {
          x = display.contentCenterX - 25,
          y = display.contentCenterY - 250,
          text = "Shop", 
          font = native.systemFontBold,
          fontSize = 60,
        }
       )
       shopText:setFillColor( 0.98, 0.99, 0.45)
       sceneGroup:insert(shopText)
    
       local exitShop = display.newImage("x.png")
       exitShop.x = display.contentCenterX + 125
       exitShop.y = display.contentCenterY - 250
       exitShop.width = exitShop.width*2
       exitShop.height = exitShop.height*2
       exitShop:addEventListener("touch", exitListener)
       sceneGroup:insert(exitShop)


         

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
