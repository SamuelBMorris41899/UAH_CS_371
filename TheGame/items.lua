itemList = {}

local function itemBought(event,item)
    print(item.printValue)
end
  

Cat = {
    name="PEANUT",
    amount=5,
    cost=42,
    action=function (event) itemBought(event,{printValue = "PEANUT bough"}) end,
    tapAction="tap",
    spriteLocation = "",
}

table.insert( itemList, Cat)

Dodge = {
    name="Dodge",
    amount=2,
    cost=10,
    action=function (event) itemBought(event,{printValue = "Dodge bough"}) end,
    tapAction="tap",
    spriteLocation = "",

}
table.insert( itemList, Dodge)



return itemList