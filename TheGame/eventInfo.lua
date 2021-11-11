require("utility")
require("butter")

eventInfo ={}

function eventInfo.createEvent (self, params)
    local tempNum = params.number or 0
    local eventName = params.name or "NO NAME"
    local increaseorDecrease = params.increaseorDecrease or " "





    butter.temp = butter.temp + tempNum
    local eventWarning = display.newText(
        {
            x = display.contentCenterX,
            y = display.contentCenterY - 100,
            text = "WARNING! INCOMING " .. eventName .. "! " .. tempNum.. " temperature " .. increaseorDecrease "!",
            font = display.systemFontBold,
            fontSize = 20,
        }
    )
    eventWarning:setFillColor(0.99, 0.31, 0.11)
end
