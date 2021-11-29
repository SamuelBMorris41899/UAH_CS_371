print("Level 3")
local widget = require( "widget" )
local composer = require( "composer" )
require("utility")
local scene = composer.newScene()
gameTimer = timer.performWithDelay(180000, gameWon, 1)
gameLoopTimer = timer.performWithDelay( 1000, tick, 0)
eventLoopTimer = timer.performWithDelay( secondsBetweenEvents * 1000, eventStartLoop, 0) --let there be an even once every 10 seconds of so...
dogeCoinTotal = 100
currentTemp = 75

function scene:resumeGame()
   bgDogeCoinNum.text = tostring(dogeCoinTotal)
   dogeCoinNum.text = tostring(dogeCoinTotal)
end

local function pauseListener( event )
    if event.phase == "began" then
        local options = {
        isModal = true,
        effect = "fade",
        time = 400,
        }  
       composer.showOverlay( "levels.pause", options )
    end
end 

local function shopListener( event )
   if event.phase == "began" then
      local options = {
         isModal = true,
         effect = "fade",
         time = 400,
      }  
         composer.showOverlay( "shop", options )
   end
 end 

 local function goToAstroSmash (event)
   if event.phase == "began" then
      local options = {
         isModal = true,
         effect = "fade",
         time = 400
      }
      composer.showOverlay("astroSmash", options)
   end
end

 -- "scene:create()"
 function scene:create( event )
   local sceneGroup = self.view
   currentLevelGroup = sceneGroup
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

    local dogeCoin = display.newImage("Coin.png")
    dogeCoin.x = display.contentCenterX - 130
    dogeCoin.y = display.contentCenterY - 210
    dogeCoin.width = dogeCoin.width/25
    dogeCoin.height = dogeCoin.height/25
    sceneGroup:insert(dogeCoin)

    local bgDogeCoinX = display.newText(
     {
       x = display.contentCenterX - 98,
       y = display.contentCenterY - 210,
       text = "x", 
       font = native.systemFontBold,
       fontSize = 23,
     }
    )
    bgDogeCoinX:setFillColor( 0.36, 0.36, 0.36)
    sceneGroup:insert(bgDogeCoinX)

  local dogeCoinX = display.newText(
     {
       x = display.contentCenterX - 100,
       y = display.contentCenterY - 210,
       text = "x", 
       font = native.systemFontBold,

       fontSize = 23,
     }
 )
 dogeCoinX:setFillColor( 0.98, 0.99, 0.45)
 sceneGroup:insert(dogeCoinX)

   bgDogeCoinNum = display.newText(
       {
        x = display.contentCenterX - 68,
        y = display.contentCenterY - 210,
         text = tostring(dogeCoinTotal), 
         font = native.systemFontBold,
         fontSize = 23,
       }
      )
      bgDogeCoinNum:setFillColor( 0.36, 0.36, 0.36)
      sceneGroup:insert(bgDogeCoinNum)

    dogeCoinNum = display.newText(
       {
        x = display.contentCenterX - 70,
        y = display.contentCenterY - 210,
         text = tostring(dogeCoinTotal), 
         font = native.systemFontBold,
         fontSize = 23,
       }
   )
   dogeCoinNum:setFillColor( 0.98, 0.99, 0.45)
   sceneGroup:insert(dogeCoinNum)

    local pauseIcon = display.newImage("PauseIcon.png")
    pauseIcon.x = display.contentCenterX + 125
    pauseIcon.y = display.contentCenterY - 210
    pauseIcon.width = pauseIcon.width/2
    pauseIcon.height = pauseIcon.height/2
    pauseIcon:addEventListener("touch", pauseListener)
    sceneGroup:insert(pauseIcon) 

    local shopIcon = display.newImage("ShopIcon.png")
    shopIcon.x = display.contentCenterX + 80
    shopIcon.y = display.contentCenterY - 215
    shopIcon.width = shopIcon.width/2
    shopIcon.height = shopIcon.height/2
    shopIcon:addEventListener("touch", shopListener)
    sceneGroup:insert(shopIcon)

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
        text = "80F-70F", 
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
        text = "80F-70F", 
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

     local astroSmashIcon = display.newImage("Player.png")
     astroSmashIcon.x = display.contentCenterX - 120
     astroSmashIcon.y = display.contentCenterY - 100
     astroSmashIcon:addEventListener("touch", goToAstroSmash)
     sceneGroup:insert(astroSmashIcon)
     sceneGroup:insert(butter)
     butter:reset()
     butter:show()


     
     local globalTempRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY + 210, 300, 50, 10)
     globalTempRect:setFillColor( 0.51 )
     sceneGroup:insert(globalTempRect)
 
     local bgGlobalTempText = display.newText(
         {
             x = display.contentCenterX - 37,
             y = display.contentCenterY + 210,
             text = "Global Temp: ",
             font = native.systemFontBold,
             fontSize = 30
         }
     )
 
     bgGlobalTempText:setFillColor( 0.36, 0.36, 0.36)
     sceneGroup:insert(bgGlobalTempText)
 
     local globalTempText = display.newText(
         {
             x = display.contentCenterX - 40,
             y = display.contentCenterY + 210,
             text = "Global Temp: ",
             font = native.systemFontBold,
             fontSize = 30
         }
     )
     globalTempText:setFillColor( 0.98, 0.99, 0.45)
     sceneGroup:insert(globalTempText)
 
     sceneGroup.bgGlobalTempNum = display.newText(
        {
           x = display.contentCenterX + 103,
           y = display.contentCenterY + 210,
           text = tostring(globalTemp),
           font = native.systemFontBold,
           fontSize = 30
        }
     )
     sceneGroup.bgGlobalTempNum:setFillColor(0.36)
     sceneGroup:insert(sceneGroup.bgGlobalTempNum)
 
     sceneGroup.globalTempNum = display.newText(
        {
           x = display.contentCenterX + 100,
           y = display.contentCenterY + 210,
           text = tostring(globalTemp),
           font = native.systemFontBold,
           fontSize = 30
        }
     )
     sceneGroup.globalTempNum:setFillColor(0.98, 0.99, 0.45)
     sceneGroup:insert(sceneGroup.globalTempNum)


   --  local tempRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY + 210, 300, 50, 10)
   --  tempRect:setFillColor( 0.51 )
   --  sceneGroup:insert(tempRect)
   --  local bgTempText = display.newText(
   --      {
   --          x = display.contentCenterX - 37,
   --          y = display.contentCenterY + 210,
   --          text = "Temperature: ",
   --          font = native.systemFontBold,
   --          fontSize = 30
   --      }
    
   --  )
   --  bgTempText:setFillColor( 0.36, 0.36, 0.36)
   --  sceneGroup:insert(bgTempText)

   --  local tempText = display.newText(
   --      {
   --          x = display.contentCenterX - 40,
   --          y = display.contentCenterY + 210,
   --          text = "Temperature: ",
   --          font = native.systemFontBold,
   --          fontSize = 30
   --      }
   --  )
   --  tempText:setFillColor( 0.98, 0.99, 0.45)
   --  sceneGroup:insert(tempText)

   --  sceneGroup.bgTempNum = display.newText(
   --    {
   --       x = display.contentCenterX + 103,
   --       y = display.contentCenterY + 210,
   --       text = tostring(currentTemp),
   --       font = native.systemFontBold,
   --       fontSize = 30
   --    }
   -- )
   -- sceneGroup.bgTempNum:setFillColor(0.36)
   -- sceneGroup:insert(sceneGroup.bgTempNum)

   -- sceneGroup.tempNum = display.newText(
   --    {
   --       x = display.contentCenterX + 100,
   --       y = display.contentCenterY + 210,
   --       text = tostring(currentTemp),
   --       font = native.systemFontBold,
   --       fontSize = 30
   --    }
   -- )
   -- sceneGroup.tempNum:setFillColor(0.98, 0.99, 0.45)
   -- sceneGroup:insert(sceneGroup.tempNum)

 end


 -- "scene:show()"
 function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
      if not gameTimer then
         gameTimer = timer.performWithDelay(180000, gameWon, 1)
         dogeCoinTotal = 100
         bgDogeCoinNum.text = tostring(dogeCoinTotal)
         dogeCoinNum.text = tostring(dogeCoinTotal)
         sceneGroup:insert(butter)
         butter:reset()
         butter:show()

      end
      if not gameLoopTimer then
         gameLoopTimer = timer.performWithDelay( 1000, tick, 0) 
      end
      if not eventLoopTimer then
         eventLoopTimer = timer.performWithDelay( secondsBetweenEvents * 1000, eventStartLoop, 0) --let there be an even once every 10 seconds of so...
      end

    elseif ( phase == "did" ) then

    end
 end

 -- "scene:hide()"
 function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
      resetLevel()
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
