
local entity = require("entity")

local playerBuilder = {}
local player = nil

function playerBuilder.init(self, group)
    if (player == nil ) then 
        player = entity:new(
            { 
                x = display.contentCenterX, 
                y = display.contentHeight - 25, 
                tag = "player" 
            }
        )
        player.move = playerBuilder.move
        player.hide = playerBuilder.hide
        player.show = playerBuilder.show  

        player:spawn(group)
        player.shape.markX = player.x
    end
    
    return player
end

function playerBuilder.hide(self) 
    self.isVisible = false;
end

function playerBuilder.show(self) 
    self.isVisible = true;
end

function playerBuilder.move ( event )

    local cube = player.shape
    
    if event.phase == "began" then
        cube.markX = cube.x
    elseif event.phase == "moved" then
        local x = (event.x - event.xStart) + cube.markX

        if (x <= 20 + cube.width / 2) then
            cube.x = 20 + cube.width / 2;
        elseif (x >= display.contentWidth - 20 - cube.width / 2) then
            cube.x = display.contentWidth - 20 - cube.width / 2;
        else
            cube.x = x;
        end

    end
end

return playerBuilder