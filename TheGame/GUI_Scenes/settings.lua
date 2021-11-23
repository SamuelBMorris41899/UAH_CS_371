print("Settings")
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()



local function backEvent( event )--function to go back to main screen scene
  if event.phase == "began" then
    composer.gotoScene( "GUI_Scenes.mainScreen" )
  end
end

local function creditsEvent( event )--function to go to credits scene
  if event.phase == "began" then
    composer.gotoScene( "GUI_Scenes.credits" )
  end
end

local function musicVolumeListener(event)--function to change volume of music
        musicVolume = event.value --slider amount is converted to global musicVolume 
        backgroundMusicChannel=musicVolume --
        trueSong=backgroundMusicChannel/100--truesong variable changes the 0-100 to 0-1
        backgroundMusicChannel=audio.setVolume(trueSong,{channel=1})--audio is changed to that amonunt
        
end

local function soundVolumeListener(event)--function for the tap sound audio
        soundVolume=event.value--code similar to musicVolumeListener but for sound
        tapToSound=soundVolume
        trueSound=tapToSound/100
        tapToSound=audio.setVolume(trueSound,{channel=2});
end

 -- "scene:create()"
 function scene:create( event )
    local sceneGroup = self.view

    local bg1 = display.newImage("Background_startScreen_with_Button_bigger.png")
    bg1.x = display.contentCenterX--creates the background and positioning.
    bg1.y = display.contentCenterY
     bg1.width = display.contentWidth
     bg1.height = display.contentHeight
     sceneGroup:insert(bg1)

    local  bgsettingsText = display.newText(
        {
          x = display.contentCenterX + 7,
          y = display.contentCenterY - 200,
          text = "Settings", 
          font = native.systemFontBold,
          fontSize = 60,
        }
       )
       bgsettingsText:setFillColor( 0.36, 0.36, 0.36)
       sceneGroup:insert(bgsettingsText)

     local settingsText = display.newText(--settings text to label settings 
        {
          x = display.contentCenterX,
          y = display.contentCenterY - 200,
          text = "Settings", 
          font = native.systemFontBold,
          fontSize = 60,
        }
       )
       settingsText:setFillColor( 0.98, 0.99, 0.45)
       sceneGroup:insert(settingsText)

    local musicVolumeRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY - 100, 300, 75, 10)
    musicVolumeRect:setFillColor( 0.51 )
    sceneGroup:insert(musicVolumeRect)-- rectangle for the music slider
        
    local musicVolumeSlider = widget.newSlider(-- music slider 
        {
          x = display.contentCenterX,
          y = display.contentCenterY - 90,
          width = 250,
          value = musicVolume,
          listener = musicVolumeListener
        }
    )
    sceneGroup:insert(musicVolumeSlider)

    local musicVolumeText = display.newText(-- music text label
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
    soundVolumeRect:setFillColor( 0.51 )--rectangle for the slider
    sceneGroup:insert(soundVolumeRect)

    local soundVolumeSlider = widget.newSlider(-- volume slider
        {
          x = display.contentCenterX,
          y = display.contentCenterY + 15,
          width = 250,
          value = soundVolume,
          listener = soundVolumeListener
        }
    )
    sceneGroup:insert(soundVolumeSlider)


    local soundVolumeText = display.newText(-- the text for soundVolume
        {
          x = display.contentCenterX,
          y = display.contentCenterY - 5,
          text = "Sound Volume", 
          font = native.systemFont,
          fontSize = 30,
        }
       )
       sceneGroup:insert(soundVolumeText)

      local creditsButton = widget.newButton(--button to go to credits with creditevent
        {
            label = "Credits",
            fontSize = 35,
            emboss = false, --Properties for a rounded rectangle button
            shape = "roundedRect",
            width = 200,
            height = 60,
            x = display.contentCenterX,
            y = display.contentCenterY + 100,
            cornerRadius= 10,
            fillColor= { default={0.51, 0.51, 0.51}, over={0.36, 0.36, 0.36} },
            labelColor= { default={ 1, 1, 1 }, over={ 0.8, 0.8, 0.8 } },
            onEvent = creditsEvent,
        }
    )
    sceneGroup:insert(creditsButton)
    
    
    local backButton = widget.newButton(-- back button 
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


