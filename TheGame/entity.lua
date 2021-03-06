local physics = require("physics")

-- Only ever need one prototype for Entity
if not Entity then
    Entity = {
        tag = "entity",
        hp = 10,
        x = 0,
        y = 0,
        width = 50,
        height = 50,
        shape = nil,
        path = {},
        isPlayer = false,
        pathIndex = nil,
        pathLoop = true,
        transition = nil,
        shapePath = nil,
        color = {0.8, 0.8, 0.8, 1},
        initialVelocity = {},
        physics = {"kinematic", {}},
        damagers = { projectile = true },
        power = 0,
        destroyOnCollide = {}
    }
end

-- Entity:new(o, args)
-- Create a new instance of Entity
-- Passes args to Entity:setup
function Entity:new(o, args)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    args = args or {}
    o:setup(args)

    return o
end

-- Entity:setup(args)
-- Used to initialize an Entity instance dynamically
function Entity:setup(args)
    -- Empty for base class
end
function Entity:bringToFront( args )

end

-- Entity:spawn(grp)
-- Spawns an Entity's DisplayObject, adding it to DisplayGroup grp if provided
function Entity:spawn(grp)
    if self.isPlayer then
        self.shape = display.newImageRect("Player.png", self.width, self.height)
        self.shape.x = self.x
        self.shape.y = self.y
        originalX = self.x
        originalY = self.y
        self.shape:addEventListener("touch", self);
    elseif self.shapePath == nil then
        self.shape = display.newRect(self.x, self.y, self.width, self.height)
    else
        local random = math.random(3)

        if random == 1 then
            self.shape = display.newImageRect("Astroid1.png", self.width, self.height)
            self.shape.x = self.x
            self.shape.y = self.y
        elseif random == 2 then
            self.shape = display.newImageRect("Astroid2.png", self.width, self.height)
            self.shape.x = self.x
            self.shape.y = self.y
        elseif random == 3 then
            self.shape = display.newImageRect("Astroid3.png", self.width, self.height)
            self.shape.x = self.x
            self.shape.y = self.y
        end
    end

    self.shape:setFillColor(unpack(self.color))

    if grp then grp:insert(self.shape) end

    self:initShape()

    return self.shape
end

-- Entity:damage(val, noCallback)
-- Inflict damage to the entity, calling Entity:kill if HP reaches zero
-- Set noCallback to true to suppress onDamage callback
function Entity:damage(val, noCallback)
  local r = false

  if not noCallback then r = self:onDamage(val) end

  if r then return end

    self.hp = self.hp - val

    if self.hp <= 0 then self:kill() end
end

-- Entity:kill(noCallback)
-- Kill the entity
-- Set noCallback to true to suppress onDeath callback
function Entity:kill(noCallback)
    local r = false

    if not noCallback then
        r = self:onDeath()
    end

    if r then return end

    transition.cancel(self.shape)
    self.hp = 0
    self.shape:removeSelf()
    self.shape = nil
end

-- Entity:onDeath()
-- Callback for entity death
-- If this function returns true, it will cancel the death
function Entity:onDeath()

end

-- Entity:onDamage(other, val)
-- Callback for entity damage
-- If this function returns true, it will cancel the damage
function Entity:onDamage(val)
  
end

-- Entity:collision(event)
-- Collision handler for Entities
-- Acts for preCollision, collision, and postCollision.
-- Check event.name to ensure proper behavior
function Entity:collision(event)
    if event.name == "collision" then
        

        if self.destroyOnCollide[event.other.tag] then
            if event.other.tag == "player" then
            self:kill(true)
            elseif event.other.tag == "bottom" then
                -- self:kill(true)
                scoreUp()
            end
        end
    end

end

function Entity:touch(event)
    if event.phase == "began" then
        self.shape.markX = self.shape.x;
        self.shape.markY = self.shape.y;
        elseif event.phase == "moved" then
        local x = (event.x - event.xStart) +   
        self.shape.markX
        local y = (event.y - event.yStart) +  
        self.shape.markY
        if x < display.contentWidth - 25 and y < display.contentHeight then
            if x > 25 and y > 0 then
                self.shape.x = x;
                self.shape.y = y;
            end
        end
    end
end


-- Entity:initShape(grp)
-- Initializes entity's shape by creating necessary references,
-- adding it to given group, and setting up physics.
-- This is done to avoid repeating code in children's spawn methods.
function Entity:initShape(grp)
    if not self.shape then return end

    -- Set up references
    self.shape.pp = self
    self.shape.tag = self.tag
    self.shape.power = self.power

    -- Add to DisplayGroup
    if grp then grp:insert(self.shape) end

    -- Set up physics
    local body, params = unpack(self.physics)
    physics.addBody(self.shape, body, params)

    -- Set up collision handler
    self.shape.collision = function (s, event) s.pp:collision(event) end
    self.shape.preCollision = function (s, event) s.pp:collision(event) end
    self.shape.postCollision = function (s, event) s.pp:collision(event) end
    self.shape:addEventListener("collision")
    self.shape:addEventListener("preCollision")
    self.shape:addEventListener("postCollision")
end

-- Entity:move(index)
-- Starts movement on the Entity's path, optionally starting at the given index
function Entity:move(index)
    self.pathIndex = index or 1

    if #self.path < self.pathIndex then
        print("Path for object undefined at index:", self.tag, self.pathIndex, #self.path)
        return
    end

    if not self.shape then
        print("No shape for path:", self.tag)
        return
    end

    self:pathStep()
end


-- Entity:pathStep()
-- Executes the current step in the entity's path
function Entity:pathStep()
    local p = self.path[self.pathIndex]

    self.transition = transition.to(self.shape, p)
    self.transition._onComplete = function () self:pathNext(self.pathIndex + 1) end
end

-- Entity:pathNext(index)
-- Iterates the current path step, loops if necessary, and starts the next step.
-- Also executes the onPathStepFinished and onPathFinished callbacks.
function Entity:pathNext(index)
    self:onPathStepFinished(index - 1)

    if index > #self.path then
        self:onPathFinished()

        if self.pathLoop then
            index = index - #self.path
        else
            return
        end
    end

    self.pathIndex = index
    self:pathStep()
end

-- Entity:onPathStepFinished(index)
-- Callback for the completion of each step in the entity's path
function Entity:onPathStepFinished(index)

end

-- Entity:onPathFinished()
-- Callback for the completion of the entity's path.
-- Also called when a path loops
function Entity:onPathFinished()

end

return Entity
