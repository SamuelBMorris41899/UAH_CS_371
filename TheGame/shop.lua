print("Shop")
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local buttonComposer = require("shopButton")
local itemList = require("items")

local function exitListener( event )
  if event.phase == "began" then
    composer.hideOverlay("fade", 400)
  end
 end


 -- "scene:create()"
 function scene:create( event )
   local sceneGroup = self.view

    local bg1 = display.newImage("ShopBackground.png")
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




       --FLAT Values to make all the buttons look the same...
       --TODO add these to a scoll pane and have a mask and all (maybe, we might just have a few items to be honest and will not need this)
       ITEM_LIST_X_POS =  10
       ITEM_LIST_Y_POS_START = 200 
       ITEM_LIST_WIDTH =  display.contentWidth - 20
       ITEM_LIST_HEIGHT =  50
       SPACE_BTWN_ITEMS = 10
       

       --these are the params for each button
      

          

      count = 1
      for _,v in ipairs(itemList) do 
        itemButton = buttonComposer:newButton(v)
        itemButton.x = ITEM_LIST_X_POS
        itemButton.y = ITEM_LIST_Y_POS_START + count *  ITEM_LIST_HEIGHT + SPACE_BTWN_ITEMS           --BS
        itemButton.width = ITEM_LIST_WIDTH
        itemButton.height = ITEM_LIST_HEIGHT
        itemButton.anchorX = 0
        itemButton.anchorY = 0
        count = count + 1
        sceneGroup:insert(itemButton)
      end 

    

         

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
