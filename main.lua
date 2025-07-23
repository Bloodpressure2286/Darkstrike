-- Darkstrike v1: Базовый интерфейс с кнопками

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- Удаляем старый GUI, если есть
if CoreGui:FindFirstChild("DarkstrikeGui") then
	CoreGui.DarkstrikeGui:Destroy()
end

-- Интерфейс
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DarkstrikeGui"
ScreenGui.Parent = CoreGui

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 400)
Frame.Position = UDim2.new(0, 20, 0, 100)
Frame.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local UIListLayout = Instance.new("UIListLayout", Frame)
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Создание кнопки с подсветкой
local function createToggleButton(text)
	local btn = Instance.new("TextButton", Frame)
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 18
	btn.Text = text .. ": OFF"
	btn.AutoButtonColor = false

	local toggled = false

	btn.MouseButton1Click:Connect(function()
		toggled = not toggled
		if toggled then
			btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			btn.Text = text .. ": ON"
		else
			btn.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
			btn.Text = text .. ": OFF"
		end
		-- Вызываем callback для включения/выключения функции
		btn.Toggled = toggled
	end)

	return btn
end

-- Хранилище состояний
local states = {
	Fly = false,
	ESP = false,
	Aimbot = false,
	Teleport = false,
	NoClip = false,
	AntiAFK = false,
	FreeCam = false,
}

-- Функции для каждой кнопки (пока заглушки, заменишь своими)
local function toggleFly(state)
	states.Fly = state
	print("Fly:", state)
	if state then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
	else
		-- Логика отключения флая здесь (если есть)
	end
end

local function toggleESP(state)
	states.ESP = state
	print("ESP:", state)
	-- Добавь сюда логику ESP
end

local function toggleAimbot(state)
	states.Aimbot = state
	print("Aimbot:", state)
	-- Логика аимбота
end

local function toggleTeleport(state)
	states.Teleport = state
	print("Teleport:", state)
	-- Логика телепорта
end

local function toggleNoClip(state)
	states.NoClip = state
	print("NoClip:", state)
	-- Логика ноклипа
end

local function toggleAntiAFK(state)
	states.AntiAFK = state
	print("AntiAFK:", state)
	-- Логика антиАФК
end

local function toggleFreeCam(state)
	states.FreeCam = state
	print("FreeCam:", state)
	-- Логика фрикам
end

-- Создаём кнопки и подключаем функции
local btnFly = createToggleButton("Fly")
btnFly.MouseButton1Click:Connect(function()
	toggleFly(btnFly.Toggled)
end)

local btnESP = createToggleButton("ESP")
btnESP.MouseButton1Click:Connect(function()
	toggleESP(btnESP.Toggled)
end)

local btnAimbot = createToggleButton("Aimbot")
btnAimbot.MouseButton1Click:Connect(function()
	toggleAimbot(btnAimbot.Toggled)
end)

local btnTeleport = createToggleButton("Teleport")
btnTeleport.MouseButton1Click:Connect(function()
	toggleTeleport(btnTeleport.Toggled)
end)

local btnNoClip = createToggleButton("NoClip")
btnNoClip.MouseButton1Click:Connect(function()
	toggleNoClip(btnNoClip.Toggled)
end)

local btnAntiAFK = createToggleButton("AntiAFK")
btnAntiAFK.MouseButton1Click:Connect(function()
	toggleAntiAFK(btnAntiAFK.Toggled)
end)

local btnFreeCam = createToggleButton("FreeCam")
btnFreeCam.MouseButton1Click:Connect(function()
	toggleFreeCam(btnFreeCam.Toggled)
end)

-- Пояснения:  
-- Вызовы toggleXXX() надо заменить на реальные функции с твоей логикой.
-- Флай уже подключен через loadstring — по нажатию кнопки загрузится и включится.
-- Остальные пока пустые, туда ты вставишь свои скрипты.

