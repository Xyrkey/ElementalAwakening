local DataStuff = {
  MagicCircle = 'Reality Collapse', 
  CanMove = true,
  MaxChargeEndlag = 0,
  MaxCharge = 60,
  CastTime = -10^10000,
  EndLag = -10^10000
}


local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Player = Players.LocalPlayer
local SpellLibrary = require(ReplicatedStorage.SpellLibrary)

local function ManipulateTool(Tool)
  local Name = Tool.Name:gsub(' %(.+', '') -- gsub for cooldown
  local Info = SpellLibrary[Name]

  for Property, Value in pairs(DataStuff) do
      if rawget(Info, Property) then
          rawset(Info, Property, Value)
      end
  end
end

for _, Tool in pairs(Player.Character:GetChildren()) do
  if Tool:IsA('Tool') then
      ManipulateTool(Tool)
  end
end
for _, Tool in pairs(Player.Backpack:GetChildren()) do
  ManipulateTool(Tool) -- safe to assume something in the backpack is a tool
end
