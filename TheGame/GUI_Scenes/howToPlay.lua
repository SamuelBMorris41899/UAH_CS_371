print("How To Play")
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()

local function backEvent( event )
   if event.phase == "began" then
   composer.gotoScene( "GUI_Scenes.mainScreen" )
   end
end


 -- "scene:create()"
 function scene:create( event )
    local sceneGroup = self.view

    local bg1 = display.newImage("Background_startScreen_with_Button_bigger.png")
    bg1.x = display.contentCenterX
    bg1.y = display.contentCenterY
     bg1.width = display.contentWidth
     bg1.height = display.contentHeight
     sceneGroup:insert(bg1)

     local bgHowToPlayText = display.newText(
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

     local howToPlayText = display.newText(
        {
          x = display.contentCenterX,
          y = display.contentCenterY - 200,
          text = "How To Play", 
          font = native.systemFontBold,
          fontSize = 50,
        }
       )
       howToPlayText:setFillColor( 0.98, 0.99, 0.45)
       sceneGroup:insert(howToPlayText)

      --  local bodyTxtBg = ;
      --  sceneGroup:insert(bodyTxtBg)
      
      local bodyTextBg = display.newRoundedRect(display.contentCenterX,display.contentCenterY,display.contentWidth - 5,350,10);
      bodyTextBg:setFillColor(0.51) 
      sceneGroup:insert(bodyTextBg)

      local bodyText = display.newText(
         {
           x = 10,
           y = 75,
           text = "You are tasked with bringing\n"..
            "butter to the moon for Elon's\n"..
            "birthday to do this you must\n"..
            "keep the butter at the perfect\n"..
            "temperature\n"..
            "If you keep the butter's \n"..
            "temp in a specific range\n"..
            "you will earn dodge coin \n"..
            "which you can spend at\n"..
            "the shop to make your \n"..
            "task easier if you have\n"..
            "the butter at the perfect\n"..
            "temperature  then you can \n"..
            "earn double the dodge coin!\n"
            , 
           font = native.systemFontBold,
           fontSize = 20,
         }
        )
        bodyText.anchorX = 0
        bodyText.anchorY = 0
        sceneGroup:insert(bodyText)
      
       local backButton = widget.newButton(
         {
             label = "Go Back",
             fontSize = 35,
             emboss = false, --Properties for a rounded rectangle button
             shape = "roundedRect",
             width = 200,
             height = 60,
             x = display.contentCenterX,
             y = display.contentCenterY + 225,
             cornerRadius= 10,
             fillColor= { default={0.51, 0.51, 0.51}, over={0.36, 0.36, 0.36} },
             labelColor= { default={ 1, 1, 1 }, over={ 0.8, 0.8, 0.8 } },
             onEvent = backEvent,
             }
         )
         sceneGroup:insert(backButton)
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
