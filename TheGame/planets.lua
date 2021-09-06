planets = {
    list = {},
    movableList = {}
}

function planets.add(self,newPlanet)
    table.insert(planets.list,#planets + 1,newPlanet)

end


function planets.getList(self)
    return self.list
end

function planets.updateView(self)
    -- for i,v in ipairs(self.list) do 
    --     local xPos,yPos = v.xPosition,v.yPosition
    --     self.renderers[i].x = xPos
    --     self.renderers[i].y = yPos
    --     print (i,v,v.size,v.xPosition,v.yPosition)
    --     print (i,self.renderers[i],self.renderers[i].rad,self.renderers[i].x,self.renderers[i].y)
    -- end
end
