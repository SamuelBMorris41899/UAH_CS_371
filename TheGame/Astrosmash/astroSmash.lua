print("AstroSmash")
local widget = require( "widget" )
local composer = require( "composer" )
local entity = require("entity")
local asteroid = require("Astrosmash.asteroids")
local scene = composer.newScene()

local playerBuilder = require("Astrosmash.playerBuilder")

local score = 0
local timeLimit = 3 * 60000
local runtime = 0
local lastAst = 0
local astChance = 0.0035
local enemies = {}



local function backEvent( event )
    if event.phase == "began" then
        physics.pause()

        for i, v in ipairs(enemies) do
          if v.removeSelf then
            v:removeSelf()
          end
        end

        enemies = {}
        timer.pause(updateTimer)
      composer.hideOverlay("fade", 400)
    end
end

function scoreUp ()
  score = score + 1
  dogeCoinTotal = dogeCoinTotal + 1
  scene.scoreText.text = "DogeCoin Earned: " .. score
  scene.bgScoreText.text = "DogeCoin Earned: " .. score
end

  

local function spawnAsteroid()
    local ast = asteroid:new({ x = math.random(25, display.contentWidth - 25), y = 135 }, { destY = scene.player.y })
    ast:spawn(scene.view)
    ast:move()

    ast.shape.isFixedRotation = true

    lastAst = system.getTimer()

    table.insert(enemies, ast.shape)
end

local function getDeltaTime()
    local temp = system.getTimer()
    local dt = (temp - runtime) / (1000 / 60)
    runtime = temp
    return dt
end


local function update ()
    local dt = getDeltaTime()
    local t = system.getTimer()

    local rt = astChance * dt

    if math.random() < rt or t - lastAst > 500 then spawnAsteroid() end
end



 -- "scene:create()"
 function scene:create( event )
   local sceneGroup = self.view

   local bg = display.newImage("Landing on moon.png")
   bg.x = display.contentCenterX
   bg.y = display.contentCenterY
   bg.width = display.contentWidth
   sceneGroup:insert(bg)

   
 

   local exitAstroSmash = display.newImage("x.png")
    exitAstroSmash.x = display.contentCenterX + 125
    exitAstroSmash.y = display.contentCenterY - 250
    exitAstroSmash.width = exitAstroSmash.width*2
    exitAstroSmash.height = exitAstroSmash.height*2
    exitAstroSmash:addEventListener("touch", backEvent)
    sceneGroup:insert(exitAstroSmash)

    physics.start()
    physics.setGravity(0, 0)


    --- Arena
    local top = display.newRect(sceneGroup, 0, 100, display.contentWidth, 10)
    local left = display.newRect(sceneGroup, 0, 0, 5, display.contentHeight)
    local right = display.newRect(sceneGroup, display.contentWidth - 20, 0, 5, display.contentHeight)

    top:setFillColor(1,1,1,0)
    left:setFillColor(1,1,1,0)
    right:setFillColor(1,1,1,0)

    self.bottom = entity:new({x = display.contentCenterX, y = display.contentHeight - 25, width = display.contentWidth, height =  20, color = {0.8, 0.8, 0.8, 0}, physics = {"static", {}}, tag = "bottom"})
    self.bottom:spawn(sceneGroup)
    self.bottom.shape.markX = self.bottom.x


    top.anchorX = 0; top.anchorY = 0
    left.anchorX = 0; left.anchorY = 0
    right.anchorX = 0; right.anchorY = 0

    physics.addBody( left, "static" )
    physics.addBody( right, "static" )
    physics.addBody( top, "static")
    
    self.player = playerBuilder:init(sceneGroup)
    
    local controlBar = display.newRect (sceneGroup, display.contentCenterX, display.contentHeight- 25, display.contentWidth, 50)
    controlBar:setFillColor(1, 1, 1, 0.01)
    controlBar:addEventListener("touch", self.player.move)

    

    self.bgScoreText = display.newText(
      {
        parent = sceneGroup,
        text = "DogeCoin Earned: 0",
        x = display.contentCenterX + 2, 
        y = 25, 
        font = native.systemFontBold, 
        fontSize = 25
      }
    )
    self.bgScoreText:setFillColor(0.36)
    
    self.scoreText = display.newText(
      {
        parent = sceneGroup,
        text = "DogeCoin Earned: 0",
        x = display.contentCenterX, 
        y = 25, 
        font = native.systemFontBold, 
        fontSize = 25
      }
    )
    self.scoreText:setFillColor( 0.98, 0.99, 0.45 )


 end


 -- "scene:show()"
 function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then
        physics.start()

        if not self.player.shape then
          self.player:spawn(sceneGroup)
        end
    end

    if event.phase == "did" then
      if self.gameTimer then timer.cancel(self.gameTimer) end
      self.gameTimer = timer.performWithDelay(timeLimit, gameOver)
    end
 end

 -- "scene:hide()"
 function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase
    local parent = event.parent

    if event.phase == "will" then
      parent:resumeGame()
    end

    if event.phase == "did" then

    end
 end

 -- "scene:destroy()"
 function scene:destroy( event )

    local sceneGroup = self.view

 end
 updateTimer = timer.performWithDelay(2, update, 0)

 ---------------------------------------------------------------------------------

 -- Listener setup
 scene:addEventListener( "create", scene )
 scene:addEventListener( "show", scene )
 scene:addEventListener( "hide", scene )
 scene:addEventListener( "destroy", scene )

 ---------------------------------------------------------------------------------


 return scene
