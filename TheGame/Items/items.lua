itemList = {}


function coolerBought(event) 

    local g = display.newGroup()
    local bgCoolerText = display.newText(
        {
            x = display.contentCenterX + 2,
            y = display.contentCenterY - 100,
            text = "Cooler Purchased!",
            font = display.systemFontBold,
            fontSize = 20,
        }
    )
    bgCoolerText:setFillColor(0.36, 0.36, 0.36)
    g:insert(bgCoolerText)

    local coolerText = display.newText(
        {
            x = display.contentCenterX,
            y = display.contentCenterY - 100,
            text = "Cooler Purchased!",
            font = display.systemFontBold,
            fontSize = 20,
        }
    )
    coolerText:setFillColor( 0.98, 0.99, 0.45)
    g:insert(coolerText)

    transition.fadeOut( g, {time = 750} )

    dogeCoinTotal = dogeCoinTotal - 50
    bgDogeCoinNum.text = tostring(dogeCoinTotal)
    dogeCoinNum.text = tostring(dogeCoinTotal)

    coolerRect = display.newRect(display.contentCenterX, 433, display.contentWidth + 5, 45)
    coolerRect:setFillColor(0.36, 0.36, 0.36, 0.9)

    currentLevelGroup:insert(effects:addCooler())
end 

function heaterBought(event) 
    local g = display.newGroup()
    local bgHeaterText = display.newText(
        {
            x = display.contentCenterX + 2,
            y = display.contentCenterY - 100,
            text = "Heater Purchased!",
            font = display.systemFontBold,
            fontSize = 20,
        }
    )
    bgHeaterText:setFillColor(0.36, 0.36, 0.36)
    g:insert(bgHeaterText)

    local heaterText = display.newText(
        {
            x = display.contentCenterX,
            y = display.contentCenterY - 100,
            text = "Heater Purchased!",
            font = display.systemFontBold,
            fontSize = 20,
        }
    )
    heaterText:setFillColor( 0.98, 0.99, 0.45)
    g:insert(heaterText)

    transition.fadeOut( g, {time = 750} )

    dogeCoinTotal = dogeCoinTotal - 50
    bgDogeCoinNum.text = tostring(dogeCoinTotal)
    dogeCoinNum.text = tostring(dogeCoinTotal)

    heaterRect = display.newRect(display.contentCenterX, 383, display.contentWidth + 5, 45)
    heaterRect:setFillColor(0.36, 0.36, 0.36, 0.9)


    currentLevelGroup:insert(effects:addHeater())
end 


Cat = {
    name="Peanut",
    amount = "+"..1,
    cost = 10,
    action=function (event) itemBought(event,{printValue = " bought"}) end,
    tapAction="tap",
    spriteLocation = ""
}

table.insert( itemList, Cat)

Dodge = {
    name="Dodge",
    amount = -1,
    cost=10,
    action=function (event) itemBought(event,{printValue = " bought",item = "Dodge"}) end,
    tapAction="tap",
    spriteLocation = ""
}
table.insert( itemList, Dodge)

Heater = {
    name = "Heater",
    amount = "+"..5,
    cost = 50,
    action=heaterBought,
    tapAction = "tap",
    spriteLocation = ""
}
table.insert( itemList, Heater)

Cooler = {
    name = "Cooler",
    amount = -5,
    cost = 50,
    action= coolerBought,
    tapAction = "tap",
    spriteLocation = ""
}
table.insert( itemList, Cooler)

return itemList