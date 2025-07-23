-- Интерфейс
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 140) -- чуть больше по высоте, чтобы все кнопки вместить
Frame.Position = UDim2.new(0, 20, 0, 100)
Frame.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- Кнопка AutoFarm (твой старый функционал полёта вверх)
local autoFarmRunning = false
local flyConn
local autoFarmLoop

local button = Instance.new("TextButton", Frame)
button.Size = UDim2.new(1, -20, 0, 40)
button.Position = UDim2.new(0, 10, 0, 10)
button.Text = "AutoFarm: OFF"
button.TextColor3 = Color3.new(1, 1, 1)
button.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
button.Font = Enum.Font.SourceSansBold
button.TextSize = 18

local flySpeed = 270 -- скорость
local flyTime = 4.3 -- время полёта

local function startFly()
	local char = player.Character or player.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart")

	if flyConn then flyConn:Disconnect() end

	local flying = true
	flyConn = RunService.Heartbeat:Connect(function()
		if flying and autoFarmRunning then
			hrp.Velocity = Vector3.new(0, flySpeed, 0)
		end
	end)

	task.wait(flyTime)
	flying = false
	if flyConn then flyConn:Disconnect() end
	if hrp then hrp.Velocity = Vector3.new(0, 0, 0) end
end

button.MouseButton1Click:Connect(function()
	autoFarmRunning = not autoFarmRunning
	button.Text = autoFarmRunning and "AutoFarm: ON" or "AutoFarm: OFF"
	if autoFarmRunning then
		autoFarmLoop = task.spawn(function()
			while autoFarmRunning do
				pcall(startFly)
				task.wait(20)
			end
		end)
	else
		if autoFarmLoop then task.cancel(autoFarmLoop) end
		if flyConn then flyConn:Disconnect() end

		local char = player.Character
		if char then
			local hrp = char:FindFirstChild("HumanoidRootPart")
			if hrp then hrp.Velocity = Vector3.new(0, 0, 0) end
		end
	end
end)

-- Кнопка Fly (загрузка внешнего флая)
local flyLoaded = false
local flyEnabled = false

local flyButton = Instance.new("TextButton", Frame)
flyButton.Size = UDim2.new(1, -20, 0, 40)
flyButton.Position = UDim2.new(0, 10, 0, 60)
flyButton.Text = "Fly: OFF"
flyButton.TextColor3 = Color3.new(1, 1, 1)
flyButton.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
flyButton.Font = Enum.Font.SourceSansBold
flyButton.TextSize = 18

flyButton.MouseButton1Click:Connect(function()
	if not flyLoaded then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
		flyLoaded = true
		flyEnabled = true
		flyButton.Text = "Fly: ON"
		flyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
	else
		-- Просто переключаем состояние и меняем цвет/текст, реальное включение/выключение зависит от внешнего скрипта
		flyEnabled = not flyEnabled
		if flyEnabled then
			flyButton.Text = "Fly: ON"
			flyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
			-- Тут можно вызвать функцию включения из флая, если она доступна
		else
			flyButton.Text = "Fly: OFF"
			flyButton.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
			-- Тут можно вызвать функцию выключения, если есть
		end
	end
end)
