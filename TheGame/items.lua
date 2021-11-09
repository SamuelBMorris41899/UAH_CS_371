itemList = {}

local function itemBought(event,item)
    print(item.printValue)
end
  

Cat = {
    name="Peanut",
    amount=5,
    cost=42,
    action=function (event) itemBought(event,{printValue = " bought"}) end,
    tapAction="tap",
    spriteLocation = "",
}

table.insert( itemList, Cat)

Dodge = {
    name="Dodge",
    amount=2,
    cost=10,
    action=function (event) itemBought(event,{printValue = " bought"}) end,
    tapAction="tap",
    spriteLocation = "",

}
table.insert( itemList, Dodge)

Heater = {
    name = "Heater",
    amount = 1,
    cost = 50,
    action=function (event) itemBought(event,{printValue = " bought"}) end,
    tapAction = "tap",
    spriteLocation = "",
}
table.insert( itemList, Heater)

Cooler = {
    name = "Cooler",
    amount = 1,
    cost = 50,
    action=function (event) itemBought(event,{printValue = " bought"}) end,
    tapAction = "tap",
    spriteLocation = "",
}
table.insert( itemList, Cooler)

return itemList