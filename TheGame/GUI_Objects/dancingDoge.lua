
local doge_opt = {
    frames = {
         -- Dancing
         {x = 31, y = 20, width = 66, height = 108}, -- frame 1
         {x = 161, y = 4, width = 66, height = 111}, -- frame 2
         {x = 287, y = 9, width = 69, height = 114}, -- frame 3
         {x = 413, y = 13, width = 75, height = 114}, -- frame 4
         {x = 546, y = 21, width = 71, height = 106}, -- frame 5
         {x = 29, y = 148, width = 72, height = 108}, -- frame 6
         {x = 155, y = 144, width = 73, height = 112},-- frame 7
         {x = 286, y = 131, width = 67, height = 114}, -- frame 8
         {x = 421, y = 135, width = 60, height = 115}, -- frame 9
         {x = 550, y = 145, width = 63, height = 110}, -- frame 10
         {x = 29, y = 288, width = 67, height = 96}, -- frame 11
         {x = 159, y = 286, width = 67, height = 99}, -- frame 12
    }
  }
  
local doge_sheet = graphics.newImageSheet("dogeSpriteT.png", doge_opt)

-- Setting each dancingDogeation according to their frames as well as giving them each a time and correct loop count.
local doge_sequenceData = {
    {name = "dancing", start = 1, count = 12, time = 1520, loopCount = 0},
}

-- Creating the sprite and setting correct options.
local sheet = doge_sheet;
local sequenceData = doge_sequenceData;
dancingDoge = display.newSprite(sheet, sequenceData)
dancingDoge:setSequence("dancing") --Time to dance!!!
dancingDoge:play()


return dancingDoge;