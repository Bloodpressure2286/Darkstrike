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
-- DARKSTRIKE main.lua (часть ESP + интерфейс)

-- Сервисы
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Основной GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "DARKSTRIKE_GUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 250, 0, 350)
Frame.Position = UDim2.new(0, 20, 0, 100)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local title = Instance.new("TextLabel", Frame)
title.Text = "DARKSTRIKE | ESP"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20

-- Кнопка включения ESP
local espToggle = Instance.new("TextButton", Frame)
espToggle.Text = "ESP: OFF"
espToggle.Size = UDim2.new(0, 200, 0, 40)
espToggle.Position = UDim2.new(0, 25, 0, 60)
espToggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
espToggle.TextColor3 = Color3.new(1,1,1)
espToggle.Font = Enum.Font.SourceSansBold
espToggle.TextSize = 18

-- Переключатели подфункций ESP
local function createToggle(text, posY)
  local cb = Instance.new("TextButton", Frame)
  cb.Text = text .. ": OFF"
  cb.Size = UDim2.new(0, 200, 0, 30)
  cb.Position = UDim2.new(0, 25, 0, posY)
  cb.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
  cb.TextColor3 = Color3.new(1,1,1)
  cb.Font = Enum.Font.SourceSans
  cb.TextSize = 16
  return cb
end

local vhToggle = createToggle("ВХ (Сквозь стены)", 110)
local namesToggle = createToggle("Ники игроков", 150)
local highlightToggle = createToggle("Подсветка тел", 190)

-- Флаги включения функций
local espEnabled = false
local vhEnabled = false
local namesEnabled = false
local highlightEnabled = false

-- Таблица для хранения объектов ESP по игрокам
local espObjects = {}

-- Функция для очистки ESP объектов
local function clearESP()
  for _, v in pairs(espObjects) do
    if v.box then v.box:Destroy() end
    if v.nameTag then v.nameTag:Destroy() end
    if v.highlight then v.highlight:Destroy() end
  end
  espObjects = {}
end

-- Функция создания ESP для игрока
local function createESP(plr)
  if espObjects[plr] then return end
  local box = Instance.new("BoxHandleAdornment")
  box.Adornee = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
  box.AlwaysOnTop = true
  box.ZIndex = 10
  box.Size = Vector3.new(4, 6, 1)
  box.Color3 = Color3.new(1, 0, 0)
  box.Transparency = vhEnabled and 0.3 or 1
  box.Parent = game:GetService("CoreGui")

  local nameTag = Instance.new("BillboardGui", box.Adornee or nil)
  nameTag.Size = UDim2.new(0, 100, 0, 25)
  nameTag.StudsOffset = Vector3.new(0, 3, 0)
  nameTag.AlwaysOnTop = true
  local textLabel = Instance.new("TextLabel", nameTag)
  textLabel.BackgroundTransparency = 1
  textLabel.Size = UDim2.new(1,0,1,0)
  textLabel.Text = plr.Name
  textLabel.TextColor3 = Color3.new(1,1,1)
  textLabel.Font = Enum.Font.SourceSansBold
  textLabel.TextSize = 18

  local highlight = Instance.new("Highlight")
  highlight.Adornee = plr.Character
  highlight.FillColor = Color3.fromRGB(255, 0, 0)
  highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
  highlight.Enabled = highlightEnabled
  highlight.Parent = game:GetService("CoreGui")

  espObjects[plr] = {
    box = box,
    nameTag = nameTag,
    highlight = highlight,
  }
end

-- Обновление ESP
local function updateESP()
  for _, plr in pairs(Players:GetPlayers()) do
    if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
      if espEnabled then
        if not espObjects[plr] then createESP(plr) end
        local esp = espObjects[plr]
        esp.box.Adornee = plr.Character.HumanoidRootPart
        esp.box.Transparency = vhEnabled and 0.3 or 1

        esp.nameTag.Parent = esp.box.Adornee
        esp.nameTag.Enabled = namesEnabled
        esp.highlight.Enabled = highlightEnabled
      else
        if espObjects[plr] then
          if espObjects[plr].box then espObjects[plr].box:Destroy() end
          if espObjects[plr].nameTag then espObjects[plr].nameTag:Destroy() end
          if espObjects[plr].highlight then espObjects[plr].highlight:Destroy() end
          espObjects[plr] = nil
        end
      end
    end
  end
end

-- Связывание переключателей
espToggle.MouseButton1Click:Connect(function()
  espEnabled = not espEnabled
  espToggle.Text = espEnabled and "ESP: ON" or "ESP: OFF"
  if not espEnabled then clearESP() end
end)

vhToggle.MouseButton1Click:Connect(function()
  vhEnabled = not vhEnabled
  vhToggle.Text = vhEnabled and "ВХ (Сквозь стены): ON" or "ВХ (Сквозь стены): OFF"
end)

namesToggle.MouseButton1Click:Connect(function()
  namesEnabled = not namesEnabled
  namesToggle.Text = namesEnabled and "Ники игроков: ON" or "Ники игроков: OFF"
end)

highlightToggle.MouseButton1Click:Connect(function()
  highlightEnabled = not highlightEnabled
  highlightToggle.Text = highlightEnabled and "Подсветка тел: ON" or "Подсветка тел: OFF"
end)

-- Обновление каждый кадр
RunService.Heartbeat:Connect(function()
  updateESP()
end)

print("ESP модуль загружен")
