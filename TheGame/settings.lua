print("Settings")
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()


local function backEvent( event )
    composer.gotoScene( "mainScreen" )
end

local function creditsEvent( event )
    composer.gotoScene( "credits" )
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
    --  Text with sldiers
     bgsettingsText = display.newText(
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

     settingsText = display.newText(
        {
          x = display.contentCenterX,
          y = display.contentCenterY - 200,
          text = "Settings", 
          font = native.systemFontBold,
          fontSize = 60,
        }
       )
       settingsText:setFillColor( 0.99, 1, 0.61)
       sceneGroup:insert(settingsText)
    
    --   musicVolumeRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY - 100, 250,100, 5)
    -- musicVolumeRect:setFillColor( 0.51 )
    -- sceneGroup:insert(musicVolumeRect)
        
    musicVolumeSlider = widget.newSlider(
        {
          x = display.contentCenterX,
          y = display.contentCenterY  - 50,
          width = 250,
          value = 100,
          listener = musicVolumeListener
        }
    )
    sceneGroup:insert(musicVolumeSlider)

    
    bgMusicVolumeText = display.newText(
        {
          x = display.contentCenterX + 2,
          y = display.contentCenterY - 100,
          text = "Music Volume", 
          font = native.systemFontBold,
          fontSize = 38,
        }
       )
       bgMusicVolumeText:setFillColor( 0.36, 0.36, 0.36)
       sceneGroup:insert(bgMusicVolumeText)

    musicVolumeText = display.newText(
        {
          x = display.contentCenterX,
          y = display.contentCenterY - 100,
          text = "Music Volume", 
          font = native.systemFont,
          fontSize = 40,
        }
       )
       sceneGroup:insert(musicVolumeText)

    --    soundVolumeRect = display.newRoundedRect(
    --     {
    --         x = display.contentCenterX,
    --         y = display.contentCenterY,
    --         width = 250,
    --         height = 100,
    --         cornerRadius= 5,
    --     }
    -- )
    -- soundVolumeRect:setFillColor( 0.51 )
    -- sceneGroup:insert(soundVolumeRect)

    soundVolumeSlider = widget.newSlider(
        {
          x = display.contentCenterX + 2,
          y = display.contentCenterY + 50,
          width = 250,
          value = 100,
          listener = soundVolumeListener
        }
    )
    sceneGroup:insert(soundVolumeSlider)

    bgSoundVolumeText = display.newText(
        {
          x = display.contentCenterX + 3,
          y = display.contentCenterY,
          text = "Sound Volume", 
          font = native.systemFontBold,
          fontSize = 38,
        }
       )
       bgSoundVolumeText:setFillColor( 0.36, 0.36, 0.36)
       sceneGroup:insert(bgSoundVolumeText)

    soundVolumeText = display.newText(
        {
          x = display.contentCenterX,
          y = display.contentCenterY,
          text = "Sound Volume", 
          font = native.systemFont,
          fontSize = 40,
        }
       )
       soundVolumeText:setFillColor( 0.85, 0.85, 0.85)
       sceneGroup:insert(soundVolumeText)

       creditsButton = widget.newButton(
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
    
    
    backButton = widget.newButton(
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


