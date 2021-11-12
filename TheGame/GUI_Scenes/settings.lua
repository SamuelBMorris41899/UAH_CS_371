print("Settings")
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()



local function backEvent( event )
  if event.phase == "began" then
    composer.gotoScene( "GUI_Scenes.mainScreen" )
  end
end

local function creditsEvent( event )
  if event.phase == "began" then
    composer.gotoScene( "GUI_Scenes.credits" )
  end
end

local function musicVolumeListener(event)
        musicVolume = event.value
        trueSong=musicVolume/100
        audio.setVolume(trueSong)
        print(musicVolume)
        
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

     local settingsText = display.newText(
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
    
    --   musicVolumeRect = display.newRoundedRect(display.contentCenterX, display.contentCenterY - 100, 250,100, 5)
    -- musicVolumeRect:setFillColor( 0.51 )
    -- sceneGroup:insert(musicVolumeRect)
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

      local creditsButton = widget.newButton(
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


