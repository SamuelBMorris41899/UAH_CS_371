itemList = {}

local function itemBought(event,item)
    print(item.printValue)
    if(item.item == "Cooler") then 
        
    end
end
function coolerBought(event) 
    currentLevelGroup:insert(effects:addCooler())
end 

Cat = {
    name="Peanut",
    amount=5,
    cost=42,
    action=function (event) itemBought(event,{printValue = " bought",item = "Cat"}) end,
    tapAction="tap",
    spriteLocation = "",
}

table.insert( itemList, Cat)

Dodge = {
    name="Dodge",
    amount=2,
    cost=10,
    action=function (event) itemBought(event,{printValue = " bought",item = "Dodge"}) end,
    tapAction="tap",
    spriteLocation = "",

}
table.insert( itemList, Dodge)

Heater = {
    name = "Heater",
    amount = 1,
    cost = 50,
    action=function (event) itemBought(event,{printValue = " bought",item = "Heater"}) end,
    tapAction = "tap",
    spriteLocation = "",
}
table.insert( itemList, Heater)

Cooler = {
    name = "Cooler",
    amount = 1,
    cost = 50,
    action= coolerBought,
    tapAction = "tap",
    spriteLocation = "",
}
table.insert( itemList, Cooler)

return itemList