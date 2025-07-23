-- DARKSTRIKE GUI by Bloodpressure2286

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DARKSTRIKE"
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 320)
Frame.Position = UDim2.new(0.05, 0, 0.1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Text = "🔥 DARKSTRIKE MENU 🔥"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.Parent = Frame

local Info = Instance.new("TextLabel")
Info.Text = "GUI загружен. Функции скоро появятся!"
Info.Size = UDim2.new(1, -20, 0, 60)
Info.Position = UDim2.new(0, 10, 0, 50)
Info.BackgroundTransparency = 1
Info.TextWrapped = true
Info.TextColor3 = Color3.fromRGB(180, 180, 180)
Info.Font = Enum.Font.Gotham
Info.TextSize = 14
Info.Parent = Frame

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

print("DARKSTRIKE GUI LOADED!")
