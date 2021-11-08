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
    rect:setFillColor(0.36, 0.36, 0.36, 0.5)
    sceneGroup:insert(rect)

    local bgLevelWonText = display.newText(
        {
          x = display.contentCenterX + 7,
          y = display.contentCenterY - 200,
          text = "Level Won!!", 
          font = native.systemFontBold,
          fontSize = 60,
        }
       )
       bgLevelWonText:setFillColor( 0.36, 0.36, 0.36)
       sceneGroup:insert(bgLevelWonText)

     local levelWonText = display.newText(
        {
          x = display.contentCenterX,
          y = display.contentCenterY - 200,
          text = "Level Won!!", 
          font = native.systemFontBold,
          fontSize = 60,
        }
       )
       levelWonText:setFillColor( 0.98, 0.99, 0.45)
       sceneGroup:insert(levelWonText)

       local pauseIcon = display.newImage("PauseIcon.png")
       pauseIcon.x = display.contentCenterX + 125
       pauseIcon.y = display.contentCenterY - 210
       pauseIcon.width = pauseIcon.width/2
       pauseIcon.height = pauseIcon.height/2
       pauseIcon:addEventListener("touch", backEvent)
       sceneGroup:insert(pauseIcon) 
    
    local musicVolumeRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY - 100, 300, 75, 10)
    musicVolumeRect:setFillColor( 0.51 )
    sceneGroup:insert(musicVolumeRect)
        
    local musicVolumeSlider = widget.newSlider(
        {
          x = display.contentCenterX,
          y = display.contentCenterY - 90,
          width = 250,
          value = 100,
          listener = musicVolumeListener
        }
    )
    sceneGroup:insert(musicVolumeSlider)

    local musicVolumeText = display.newText(
        {
          x = display.contentCenterX,
          y = display.contentCenterY - 115,
          text = "Music Volume", 
          font = native.systemFont,
          fontSize = 30,
        }
       )
       sceneGroup:insert(musicVolumeText)

    local soundVolumeRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY + 5, 300, 75, 10)
    soundVolumeRect:setFillColor( 0.51 )
    sceneGroup:insert(soundVolumeRect)

    local soundVolumeSlider = widget.newSlider(
        {
          x = display.contentCenterX,
          y = display.contentCenterY + 15,
          width = 250,
          value = 100,
          listener = soundVolumeListener
        }
    )
    sceneGroup:insert(soundVolumeSlider)


    local soundVolumeText = display.newText(
        {
          x = display.contentCenterX,
          y = display.contentCenterY - 5,
          text = "Sound Volume", 
          font = native.systemFont,
          fontSize = 30,
        }
       )
       sceneGroup:insert(soundVolumeText)

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
             labelColor= { default={ 1, 1, 1}, over={ 0.8, 0.8, 0.8} },
             onEvent = backEvent,
             }
         )
         sceneGroup:insert(backButton)

         local exitLevelButton = widget.newButton(
            {
                label = "Exit Level",
                fontSize = 35,
                emboss = false, --Properties for a rounded rectangle button
                shape = "roundedRect",
                width = 200,
                height = 60,
                x = display.contentCenterX,
                y = display.contentCenterY + 100,
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
