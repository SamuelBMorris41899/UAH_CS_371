print("Pause")
local widget = require( "widget" )
local composer = require( "composer" )
local heater = require("Items.heater")
local cooler = require("Items.cooler")
local scene = composer.newScene()


local function backEvent( event )
  if event.phase == "began" then
    composer.hideOverlay("fade", 400)
  end
 end

local function exitLevelEvent(event)
  if event.phase == "began" then
    timer.cancel(gameLoopTimer)
    gameLoopTimer = nil
    timer.cancel(eventLoopTimer)
    eventLoopTimer = nil
    timer.cancel(gameTimer)
    gameTimer = nil
    heater:removeHeater()
    cooler:removeCooler()
    composer.gotoScene("GUI_Scenes.levelSelection")
  end
end

local function musicVolumeListener(event)
  musicVolume = event.value
  trueSong=musicVolume/100
  audio.setVolume(trueSong)
  print(musicVolume)
  backgroundMusicChannel=musicVolume
  trueSong=backgroundMusicChannel/100
  backgroundMusicChannel=audio.setVolume(trueSong,{channel=1})
end

local function soundVolumeListener(event)
  soundVolume=event.value
  tapToSound=soundVolume
  trueSound=tapToSound/100
  tapToSound=audio.setVolume(trueSound,{channel=2});
end

 -- "scene:create()"
 function scene:create( event )
   local sceneGroup = self.view

    local rect = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    rect:setFillColor(0.15, 0.15, 0.15, 0.8)
    sceneGroup:insert(rect)

    local bgPauseText = display.newText(
        {
          x = display.contentCenterX - 13,
          y = display.contentCenterY - 200,
          text = "Paused", 
          font = native.systemFontBold,
          fontSize = 60,
        }
       )
       bgPauseText:setFillColor( 0.36, 0.36, 0.36)
       sceneGroup:insert(bgPauseText)

     local pauseText = display.newText(
        {
          x = display.contentCenterX - 20,
          y = display.contentCenterY - 200,
          text = "Paused", 
          font = native.systemFontBold,
          fontSize = 60,
        }
       )
       pauseText:setFillColor( 0.98, 0.99, 0.45)
       sceneGroup:insert(pauseText)

       local exitPause = display.newImage("x.png")
       exitPause.x = display.contentCenterX + 125
       exitPause.y = display.contentCenterY - 200
       exitPause.width = exitPause.width*2
       exitPause.height = exitPause.height*2
       exitPause:addEventListener("touch", backEvent)
       sceneGroup:insert(exitPause)
    
    local musicVolumeRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY - 100, 300, 75, 10)
    musicVolumeRect:setFillColor( 0.51 )
    sceneGroup:insert(musicVolumeRect)
        
    local musicVolumeSlider = widget.newSlider(
        {
          x = display.contentCenterX,
          y = display.contentCenterY - 90,
          width = 250,
          value = musicVolume,
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
          value = soundVolume,
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
