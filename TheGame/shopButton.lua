local widget = require("widget")

shopButton = {}


local backgroundLocation = "ShopButton.png"

function shopButton.newButton(self,params)
    

    local objectName = params.name or "NO NAME"
    local amount = params.amonut or -1
    local cost = params.cost or -1
    local action = params.action or function (event) print("No action defined"); end
    local tapAction= params.tapAction or "tap" 

    local newButton = display.newGroup();

    local Background = display.newRect( 10 ,0, display.contentWidth - 20,50)
    Background.anchorX = 0
    Background.anchorY = 0
    local paint = {
        type = "image",
        filename = backgroundLocation
    }
    Background.fill = paint
    newButton:insert(Background)

    --Make new label for the object name
    local objectNameLabel = display.newText( objectName, 10, 0, native.systemFont, 30 )
    objectNameLabel.anchorX = 0
    objectNameLabel.anchorY = 0
    newButton:insert(objectNameLabel)
    --Qnty
    local amountLabel = display.newText( "Qnty:" .. amount, 10, 30, native.systemFont, 15)
    amountLabel.anchorX = 0
    amountLabel.anchorY = 0
    newButton:insert(amountLabel)
    --cost label
    local costLabel = display.newText(cost .. " Dodge", display.contentWidth - 20, 0, native.systemFont, 30)
    costLabel.anchorX = 1
    costLabel.anchorY = 0
    costLabel:setFillColor(0,1,0);
    newButton:insert(costLabel)

    newButton:addEventListener( tapAction , action)

    return newButton
end




return shopButton;




--[[
HOW TO USE:

EXAMPLE CODE:

local shopButtonCreator = require("shopButton");

function action1 (event ) 
    print("1")
end

shopButtonCreator:newButton({action = action1})


PARAMS 

{
    name            the name of the object
    amount          how many is in the shop
    cost            how many dodge
    action          what should happen when you press the button (This can be used to add to the play inventory or some other thing)
    tapAction       what type of event listener should be added to the button (I image this will be tap or touch. tap be default...)
}

A general Use button for the shop. when the user taps on any text this will activate the action given 
]]


