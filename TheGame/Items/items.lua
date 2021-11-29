itemList = {}
heaterLevel = 1
coolerLevel = 1

function coolerBought(event) 

    local g = display.newGroup()

    if(dogeCoinTotal - 50 < 0) then
        local noMoneyGroup = display.newGroup()

        local bgNoMoneyText = display.newText(
            {
                x = display.contentCenterX,
                y = display.contentCenterY - 100,
                text = "Not enough Doge Coin!",
                font = display.systemFontBold,
                fontSize = 20
            }
        )
        bgNoMoneyText:setFillColor(0.36)
        noMoneyGroup:insert(bgNoMoneyText)
        
        local noMoneyText = display.newText(
            {
                x = display.contentCenterX,
                y = display.contentCenterY - 100,
                text = "Not enough DogeCoin!",
                font = display.systemFontBold,
                fontSize = 20
            }
        )
        noMoneyText:setFillColor(0.98, 0.99, 0.45)
        noMoneyGroup:insert(noMoneyText)
        transition.fadeOut( noMoneyGroup, {time = 750} )
    else
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

        coolerRect = display.newRect(display.contentCenterX, 333, display.contentWidth + 5, 45)
        coolerRect:setFillColor(0.36, 0.36, 0.36, 0.9)
        shopGroup:insert(coolerRect)


        currentLevelGroup.cooler = effects:addCooler() 
        currentLevelGroup:insert(currentLevelGroup.cooler)
        coolerLevel = coolerLevel + 1
        
        Cooler.name = "Cooler " .. coolerLevel
    end
end 

function heaterBought(event) 
    local g = display.newGroup()
    

    if(dogeCoinTotal - 50 < 0) then
        local noMoneyGroup = display.newGroup()

        local bgNoMoneyText = display.newText(
            {
                x = display.contentCenterX,
                y = display.contentCenterY - 100,
                text = "Not enough Doge Coin!",
                font = display.systemFontBold,
                fontSize = 20
            }
        )
        bgNoMoneyText:setFillColor(0.36)
        noMoneyGroup:insert(bgNoMoneyText)
        
        local noMoneyText = display.newText(
            {
                x = display.contentCenterX,
                y = display.contentCenterY - 100,
                text = "Not enough DogeCoin!",
                font = display.systemFontBold,
                fontSize = 20
            }
        )
        noMoneyText:setFillColor(0.98, 0.99, 0.45)
        noMoneyGroup:insert(noMoneyText)
        transition.fadeOut( noMoneyGroup, {time = 750} )

    else
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

        heaterRect = display.newRect(display.contentCenterX, 283, display.contentWidth + 5, 45)
        heaterRect:setFillColor(0.36, 0.36, 0.36, 0.9)
        shopGroup:insert(heaterRect)



        currentLevelGroup.heater = effects:addHeater() 
        currentLevelGroup:insert(currentLevelGroup.heater)

        heaterLevel = heaterLevel + 1
        Heater.name = "Heater " .. heaterLevel
    end
    
end 



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