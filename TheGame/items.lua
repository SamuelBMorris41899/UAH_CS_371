itemList = {}

-- local heaterFrameInfo = {
--     frames = {
--         {x = 0, y = 1, width = 111, height = 138}, -- off
--         {x = 122, y = 1, width = 111, height = 138}, -- on
--     }
-- }
-- local heaterSheet = graphics.newImageSheet( "Heater.png", heaterFrameInfo )

-- local heaterStateManager = {
--     {name = "off", frames = {1}, time = 1, loopCount = 0},
--     {name = "on", frames = {2}, time = 1, loopCount = 0},
-- }


-- local coolerFrameInfo = {
--     frames = {
--         {x = 0, y = 2, width = 74, height = 130}, -- off
--         {x = 92, y = 2, width = 74, height = 130}, -- on frame 1
--         {x = 188, y = 2, width = 74, height = 130}, -- on frame 2
--     }
-- }
-- local coolerSheet = graphics.newImageSheet( "Cooler.png", coolerFrameInfo )

-- local coolerStateManager = {
--     {name = "off", frames ={1}, time = 1, loopCount = 0},
--     {name = "on", frames = {2, 3}, time = 700, loopCount = 0},
-- }

-- local heater = display.newSprite(heaterSheet, heaterStateManager)
--     heater:setSequence( "off" )  
--     heater:play()  -- play the new sequence
--     heater.x = 100
--     heater.y = 100

--     local cooler = display.newSprite(coolerSheet, coolerStateManager)
--     cooler:setSequence( "off" )  
--     cooler:play()  -- play the new sequence
--     cooler.x = 100
--     cooler.y = 100


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
    amount = "+"..1,
    cost = 10,
    action=function (event) itemBought(event,{printValue = " bought"}) end,
    tapAction="tap",
    spriteLocation = "",
    
}

table.insert( itemList, Cat)

Dodge = {
    name="Dodge",
    amount = -1,
    cost=10,
    action=function (event) itemBought(event,{printValue = " bought",item = "Dodge"}) end,
    tapAction="tap",
    spriteLocation = "",

}
table.insert( itemList, Dodge)

Heater = {
    name = "Heater",
    amount = "+"..5,
    cost = 50,
    action=function (event) itemBought(event,{printValue = " bought",item = "Heater"}) end,
    tapAction = "tap",
    spriteLocation = "",
   -- itemSheet = heaterSheet,
   -- itemStateManager = heaterStateManager,
}
table.insert( itemList, Heater)

Cooler = {
    name = "Cooler",
    amount = -5,
    cost = 50,
    action= coolerBought,
    tapAction = "tap",
    spriteLocation = "",
   -- itemSheet = coolerSheet,
   -- itemStateManager = coolerStateManager,
}
table.insert( itemList, Cooler)

return itemList