local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))()
local a = false
local OwO = library:Window("MM2 Autofarm")
local speed = 2

local coinType = "Coin"
local farmType = "Tween"

local gotCoin = false 

OwO:Toggle("Autofarm", false, function(bool)
    a = bool
end)

OwO:Slider("Speed",2, 6,2, function(value)
   speed = value
end)

local dropdown = OwO:Dropdown("Coin Type", {"Coin", "BeachBall", "Egg", "RareEgg", "Candy", "SnowToken"}, function(name)
   coinType = name
end)


local dropdown = OwO:Dropdown("Farm Type", {"Tween", "AirTP (kickable)"}, function(name)
   farmType = name
end)

OwO:Label("Do not start autofarm before a round", Color3.fromRGB(127, 143, 166))
OwO:Label("started and before a role selector", Color3.fromRGB(127, 143, 166))
OwO:Label("https://github.com/BonnieRBLX", Color3.fromRGB(127, 143, 166))

spawn(function()
while wait(1) do
    if a then
        local map = workspace:FindFirstChild("Normal") or workspace:FindFirstChild("Halloween") or workspace:FindFirstChild("Christmas")
        if map == nil then
            a = false
        end
        local coins = map:WaitForChild("CoinContainer")
        for i, v in pairs(coins:GetChildren()) do
            if v:GetAttribute("CoinID") == coinType then 
                  for _, k in pairs(coins:GetChildren()) do
            if k:GetAttribute("CoinID") == coinType then 
                local magnitude = (k.Position - v.Position).Magnitude
                 if gotCoin then return end
               if farmType == "Tween" then
                   if magnitude <= 10 then
               gotCoin = true
              
                   game.TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(speed + 3, Enum.EasingStyle.Linear), {CFrame = v.CFrame}):Play()
                   wait(speed)
                   gotCoin = false
                   end
                   else
                    if magnitude <= 10 then
                   game.Players.LocalPlayer.Character:PivotTo(v.CFrame)
                   gotCoin = false
                    end
               end
            end
            end
    end
    end
    end
end
end)


game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
a = false
end)
