-- DARKSTRIKE GUI by Bloodpressure2286

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DARKSTRIKE"
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 300)
Frame.Position = UDim2.new(0.05, 0, 0.1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 12)

local Label = Instance.new("TextLabel")
Label.Text = "DARKSTRIKE LOADED"
Label.Size = UDim2.new(1, 0, 0, 40)
Label.BackgroundTransparency = 1
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.Font = Enum.Font.GothamBold
Label.TextSize = 18
Label.Parent = Frame

-- Кнопки и функции будут позже сюда добавлены

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

print("DARKSTRIKE LOADED!")
