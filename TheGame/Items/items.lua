itemList = {}


function coolerBought(event) 
    currentLevelGroup:insert(effects:addCooler())
end 

function heaterBought(event) 
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