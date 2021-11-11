print("Credits")
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()


local function backEvent( event )
   if event.phase == "began" then
   composer.gotoScene( "GUI_Scenes.settings" )
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

     local bgCreditsText = display.newText(
        {
          x = display.contentCenterX + 7,
          y = display.contentCenterY - 200,
          text = "Credits", 
          font = native.systemFontBold,
          fontSize = 50,
        }
       )
       bgCreditsText:setFillColor( 0.36, 0.36, 0.36)
       sceneGroup:insert(bgCreditsText)

     local creditsText = display.newText(
        {
          x = display.contentCenterX,
          y = display.contentCenterY - 200,
          text = "Credits", 
          font = native.systemFontBold,
          fontSize = 50,
        }
       )
       creditsText:setFillColor( 0.98, 0.99, 0.45)
       sceneGroup:insert(creditsText)

       local samRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY - 100, 300, 50, 10)
       samRect:setFillColor(0.51)
       sceneGroup:insert(samRect)

       local bgSamText = display.newText(
          {
             x = display.contentCenterX + 5,
             y = display.contentCenterY - 100,
             text = "Sam Morris",
             font = native.systemFontBold,
             fontSize = 40,
          }
       )
       bgSamText:setFillColor(0.36, 0.36, 0.36)
       sceneGroup:insert(bgSamText)

       local samText = display.newText(
          {
             x = display.contentCenterX,
             y = display.contentCenterY - 100,
             text = "Sam Morris",
             font = native.systemFontBold,
             fontSize = 40,
          }
       )
       samText:setFillColor(0.98, 0.99, 0.45)
       sceneGroup:insert(samText)

       local luisRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY, 300, 50, 10)
       luisRect:setFillColor(0.51)
       sceneGroup:insert(luisRect)

       local bgLuisText = display.newText(
          {
             x = display.contentCenterX + 5,
             y = display.contentCenterY,
             text = "Luis Porras",
             font = native.systemFontBold,
             fontSize = 40,
          }
       )
       bgLuisText:setFillColor(0.36, 0.36, 0.36)
       sceneGroup:insert(bgLuisText)

       local luisText = display.newText(
          {
             x = display.contentCenterX,
             y = display.contentCenterY,
             text = "Luis Porras",
             font = native.systemFontBold,
             fontSize = 40,
          }
       )
       luisText:setFillColor(0.98, 0.99, 0.45)
       sceneGroup:insert(luisText)

       local faithRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY + 100, 300, 50, 10)
       faithRect:setFillColor(0.51)
       sceneGroup:insert(faithRect)

       local bgFaithText = display.newText(
          {
             x = display.contentCenterX + 5,
             y = display.contentCenterY + 100,
             text = "Faith Grimmeisen",
             font = native.systemFontBold,
             fontSize = 33,
          }
       )
       bgFaithText:setFillColor(0.36, 0.36, 0.36)
       sceneGroup:insert(bgFaithText)

       local faithText = display.newText(
          {
             x = display.contentCenterX,
             y = display.contentCenterY + 100,
             text = "Faith Grimmeisen",
             font = native.systemFontBold,
             fontSize = 33,
          }
       )
       faithText:setFillColor(0.98, 0.99, 0.45)
       sceneGroup:insert(faithText)

      local backButton = widget.newButton(
         {
             label = "Go Back",
             fontSize = 35,
             emboss = false, --Properties for a rounded rectangle button
             shape = "roundedRect",
             width = 200,
             height = 60,
             x = display.contentCenterX,
             y = display.contentCenterY + 200,
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
