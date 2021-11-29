print("Level 0")
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local level0 = nil
dogeCoinTotal = 200


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

 local function TEMPWin(event)
   if event.phase == "began" then
      local options = {
         isModal = true,
         effect = "fade",
         time = 400,
      }  
         composer.showOverlay( "levels.levelWon", options )
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
   level0 = self.view
   currentLevelGroup = level0
    local bg1 = display.newImage("level0_lab.png")
    bg1.x = display.contentCenterX
    bg1.y = display.contentCenterY
     bg1.width = display.contentWidth
     bg1.height = display.contentHeight
     level0:insert(bg1)

     local dogeCoin = display.newImage("Coin.png")
     dogeCoin.x = display.contentCenterX - 130
     dogeCoin.y = display.contentCenterY - 210
     dogeCoin.width = dogeCoin.width/25
     dogeCoin.height = dogeCoin.height/25
     dogeCoin:addEventListener("touch", TEMPWin)
     level0:insert(dogeCoin)

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
     level0:insert(bgDogeCoinX)

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
  level0:insert(dogeCoinX)

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
       level0:insert(bgDogeCoinNum)

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
    level0:insert(dogeCoinNum)

    local pauseIcon = display.newImage("PauseIcon.png")
    pauseIcon.x = display.contentCenterX + 125
    pauseIcon.y = display.contentCenterY - 210
    level0:insert(pauseIcon) 
    pauseIcon.width = pauseIcon.width/2
    pauseIcon.height = pauseIcon.height/2
    pauseIcon:addEventListener("touch", pauseListener)
    level0:insert(pauseIcon)

    local shopIcon = display.newImage("ShopIcon.png")
    shopIcon.x = display.contentCenterX + 80
    shopIcon.y = display.contentCenterY - 215
    shopIcon.width = shopIcon.width/2
    shopIcon.height = shopIcon.height/2
    shopIcon:addEventListener("touch", shopListener)
    level0:insert(shopIcon)

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
     level0:insert(bgTempRangeText)

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
  level0:insert(tempRangeText)

  local bgTempRangeNum = display.newText(
      {
        x = display.contentCenterX + 107,
        y = display.contentCenterY - 130,
        text = "100F-50F", 
        font = native.systemFontBold,
        fontSize = 23,
      }
     )
     bgTempRangeNum:setFillColor( 0.36, 0.36, 0.36)
     level0:insert(bgTempRangeNum)

     local tempRangeNum = display.newText(
      {
        x = display.contentCenterX + 105,
        y = display.contentCenterY - 130,
        text = "100F-50F", 
        font = native.systemFontBold,
        fontSize = 23,
      }
     )
     tempRangeNum:setFillColor( 0.98, 0.99, 0.45)
     level0:insert(tempRangeNum)

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
  level0:insert(bgPerfectTempText)

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
  level0:insert(perfectTempText)

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
     level0:insert(bgPerfectTempNum)

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
     level0:insert(perfectTempNum)

     local astroSmashIcon = display.newImage("Player.png")
     astroSmashIcon.x = display.contentCenterX - 120
     astroSmashIcon.y = display.contentCenterY - 100
     astroSmashIcon:addEventListener("touch", goToAstroSmash)
     level0:insert(astroSmashIcon)

     butter.x = display.contentCenterX + 100
     butter.y = display.contentCenterY + 80
     level0:insert(butter)
     butter:show()

    local globalTempRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY + 210, 300, 50, 10)
    globalTempRect:setFillColor( 0.51 )
    level0:insert(globalTempRect)

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
    level0:insert(bgGlobalTempText)

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
    level0:insert(globalTempText)

    level0.bgGlobalTempNum = display.newText(
       {
          x = display.contentCenterX + 103,
          y = display.contentCenterY + 210,
          text = tostring(butter.temp),
          font = native.systemFontBold,
          fontSize = 30
       }
    )
    
    level0.bgGlobalTempNum:setFillColor(0.36)
    level0:insert(level0.bgGlobalTempNum)

    level0.globalTempNum = display.newText(
       {
          x = display.contentCenterX + 100,
          y = display.contentCenterY + 210,
          text = tostring(globalTemp),
          font = native.systemFontBold,
          fontSize = 30
       }
    )
    
    level0.globalTempNum:setFillColor(0.98, 0.99, 0.45)
    level0:insert(level0.globalTempNum)
    
   --  local tempRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY + 210, 300, 50, 10)
   --  tempRect:setFillColor( 0.51 )
   --  level0:insert(tempRect)
    
   --  level0.bgTempText = display.newText(
   --      {
   --          x = display.contentCenterX - 37,
   --          y = display.contentCenterY + 210,
   --          text = "Temperature: ",
   --          font = native.systemFontBold,
   --          fontSize = 30
   --      }
   --  )

   --  level0.bgTempText:setFillColor( 0.36, 0.36, 0.36)
   --  level0:insert(level0.bgTempText)

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
   --  level0:insert(tempText)

   --  level0.bgTempNum = display.newText(
   --     {
   --        x = display.contentCenterX + 103,
   --        y = display.contentCenterY + 210,
   --        text = tostring(butter.temp),
   --        font = native.systemFontBold,
   --        fontSize = 30
   --     }
   --  )
   --  level0.bgTempNum:setFillColor(0.36)
   --  level0:insert(level0.bgTempNum)

   --  level0.tempNum = display.newText(
   --     {
   --        x = display.contentCenterX + 100,
   --        y = display.contentCenterY + 210,
   --        text = tostring(butter.temp),
   --        font = native.systemFontBold,
   --        fontSize = 30
   --     }
   --  )
   --  level0.tempNum:setFillColor(0.98, 0.99, 0.45)
   --  level0:insert(level0.tempNum)


 end


 -- "scene:show()"
 function scene:show(event)

    local level0 = self.view
    local phase = event.phase

    if ( phase == "will" ) then

    elseif ( phase == "did" ) then

    end
 end

 -- "scene:hide()"
 function scene:hide( event )

    local level0 = self.view
    local phase = event.phase

    if ( phase == "will" ) then

       transition.cancel(scene1)
    elseif ( phase == "did" ) then

    end
 end

 -- "scene:destroy()"
 function scene:destroy( event )

    local level0 = self.view

 end

 ---------------------------------------------------------------------------------

 -- Listener setup
 scene:addEventListener( "create", scene )
 scene:addEventListener( "show", scene )
 scene:addEventListener( "hide", scene )
 scene:addEventListener( "destroy", scene )

 ---------------------------------------------------------------------------------

 return scene
