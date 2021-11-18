local entity = require("entity")

if not Asteroid then
    Asteroid = entity:new({
        tag = "enemy",
        shapePath = {
            0, -15,
            -14, -5,
            -9, 12,
            9, 12,
            14, -5
        },
        color = {0.36},
        pathLoop = false,
        power = 1,
        physics = {"dynamic", {}},
        destroyOnCollide = { bottom = true, player = true },
        pathIndex = math.random(1, 25)
    })
end

function Asteroid:setup(args)
    if not self.path or #self.path < 1 then
        self.path = {{x = args.destX or self.x , y = args.destY or display.actualContentHeight, time = args.time or 500}}
    end
end

function Asteroid:onPathFinished()
  if self.shape and self.shape.removeSelf then
    self.shape:removeSelf()
  end
  self.shape = nil
end

function Asteroid:bringToFront()
    Asteroid:toFront()
    print("to front")
    return true
end

return Asteroid