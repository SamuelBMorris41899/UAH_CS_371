butter = {}


butter.state = 0
butterSpriteSheet = {}


local animationStateManager ={
    {name="Nominal", start=1, count=4, time=700, loopCount=0},
}

--create Ryu and set the idle animation to start






function init() 
    newButter = display.newSprite(butterSpriteSheet, animationStateManager)
    newButter = deepAppend(butter,newButter) --adds all functions,tables and variables from butter to the new butter
end

function butter.tick(self) 

end

function butter.setState(self,state)
    self:setSequence(state)
    self:play()
end
