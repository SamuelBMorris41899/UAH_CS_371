local widget = require( "widget" )

local composer = require( "composer" )
local scene = composer.newScene()
musicVolume = 50 --sliders at settigns and pause start at 50
soundVolume = 50
 
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
 
-- local forward references should go here
 
---------------------------------------------------------------------------------
 

local function playGameEvent( event )-- function to send to level selection
  if event.phase == "began" then-- if the event is pressed for start game
   composer.gotoScene( "GUI_Scenes.levelSelection" )
  end
 end

 local function settingsEvent( event )--function t send to settings scene if touch event 
  if event.phase == "began" then--for settings button
   composer.gotoScene( "GUI_Scenes.settings" )
  end
 end

 local function howToPlayEvent( event )-- function to send to howtoplay scene if button is pressed
  if event.phase == "began" then
   composer.gotoScene( "GUI_Scenes.howToPlay" )
  end
 end

 local function exitEvent(event)--function to exit app if exit button pressed
  if event.phase == "began" then
    os.exit()
  end
end





-- "scene:create()"
function scene:create( event )
  backgroundSong=audio.loadSound("snailhouseSong.mp3");--initates the music
  tappingSound=audio.loadSound("boopSound.wav");--initiates the boop sound
  local backgroundMusicChannel = audio.play( backgroundSong, { channel=1, loops=-1, fadein=5000 } )--continously loops song beause -1
   local sceneGroup = self.view--initiates local group


   local bg1 = display.newImage("Background_startScreen_with_Button_bigger.png")
   bg1.x = display.contentCenterX--dsplays and positions background
   bg1.y = display.contentCenterY
    bg1.width = display.contentWidth
    bg1.height = display.contentHeight
    sceneGroup:insert(bg1)

    local bgButterMeltText = display.newText(--text for buttermelt background
      {
        x = display.contentCenterX + 7,
        y = display.contentCenterY - 200,
        text = "Butter Melt", 
        font = native.systemFontBold,
        fontSize = 55,
      }
     )
     bgButterMeltText:setFillColor( 0.36, 0.36, 0.36)
     sceneGroup:insert(bgButterMeltText)

   local butterMeltText = display.newText(-- butter melt tital text
      {
        x = display.contentCenterX,
        y = display.contentCenterY - 200,
        text = "Butter Melt", 
        font = native.systemFontBold,
        fontSize = 55,
      }
     )
     butterMeltText:setFillColor( 0.98, 0.99, 0.45)
     sceneGroup:insert(butterMeltText)


    local playGameButton = widget.newButton(
        {
            label = "Play Game",
            fontSize = 35,
            emboss = false, --Properties for a rounded rectangle button
            shape = "roundedRect",
            width = 200,
            height = 60,
            x = display.contentCenterX,
            y = display.contentCenterY - 100,
            cornerRadius= 10,
            fillColor= { default={0.51, 0.51, 0.51}, over={0.36, 0.36, 0.36} },
            labelColor= { default={ 1, 1, 1 }, over={ 0.8, 0.8, 0.8 } },
            onEvent = playGameEvent,
        }
    )
    sceneGroup:insert(playGameButton)

    local settingsButton = widget.newButton(
        {
            label = "Settings",
            fontSize = 40,
            emboss = false, --Properties for a rounded rectangle button
            shape = "roundedRect",
            width = 200,
            height = 60,
            x = display.contentCenterX,
            y = display.contentCenterY,
            cornerRadius= 10,
            fillColor= { default={0.51, 0.51, 0.51}, over={0.36, 0.36, 0.36} },
            labelColor= { default={ 1, 1, 1 }, over={ 0.8, 0.8, 0.8 } },
            onEvent = settingsEvent,
        }
    )
    sceneGroup:insert(settingsButton)

    local howToPlayButton = widget.newButton(
        {
            label = "How To Play",
            fontSize = 30,
            emboss = false, --Properties for a rounded rectangle button
            shape = "roundedRect",
            width = 200,
            height = 60,
            x = display.contentCenterX,
            y = display.contentCenterY + 100,
            cornerRadius= 10,
            fillColor= { default={0.51, 0.51, 0.51}, over={0.36, 0.36, 0.36} },
            labelColor= { default={ 1, 1, 1 }, over={ 0.8, 0.8, 0.8 } },
            onEvent = howToPlayEvent,
        }
    )
    sceneGroup:insert(howToPlayButton)

    local exitButton = widget.newButton(
        {
            label = "Exit",
            fontSize = 40,
            emboss = false, --Properties for a rounded rectangle button
            shape = "roundedRect",
            width = 200,
            height = 60,
            x = display.contentCenterX,
            y = display.contentCenterY + 200,
            cornerRadius= 10,
            fillColor= { default={0.51, 0.51, 0.51}, over={0.36, 0.36, 0.36} },
            labelColor= { default={ 1, 1, 1 }, over={ 0.8, 0.8, 0.8 } },
            onEvent = exitEvent,
        }
    )
    local function tapSound(event)
      local tapToSound = audio.play( tappingSound, {channel=2,} )
    end
    sceneGroup:insert(exitButton)--exitbutton grouping 
    Runtime:addEventListener("tap",tapSound)--event listener for tap anywhere on screen to make a sound
    
end

 
-- "scene:show()"
function scene:show( event )
 
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
   end
end
 
-- "scene:hide()"
function scene:hide( event )
 
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
      transition.cancel(scene1)
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end
 
-- "scene:destroy()"
function scene:destroy( event )
 
   local sceneGroup = self.view
 
   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end
 
---------------------------------------------------------------------------------
 
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
 
---------------------------------------------------------------------------------
 
return scene