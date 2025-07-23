local ui = Instance.new("ScreenGui", game.CoreGui)
ui.Name = "DARKSTRIKE_UI"

local frame = Instance.new("Frame", ui)
frame.Size = UDim2.new(0, 300, 0, 420)
frame.Position = UDim2.new(0.05, 0, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0

local uilist = Instance.new("UIListLayout", frame)
uilist.Padding = UDim.new(0, 5)
uilist.FillDirection = Enum.FillDirection.Vertical

-- Helper: Create toggle button
local function createToggle(name, callback)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(1, -10, 0, 35)
	btn.Text = name .. " [OFF]"
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.MouseButton1Click:Connect(function()
		local isOn = btn.Text:find("ON") == nil
		btn.Text = name .. (isOn and " [ON]" or " [OFF]")
		btn.BackgroundColor3 = isOn and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(50, 50, 50)
		callback(isOn)
	end)
end

-- Флай
createToggle("Fly", function(state)
	if state then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
	end
end)

-- ESP (заглушка)
createToggle("ESP", function(state)
	if state then
		-- Здесь может быть подменю с чекбоксами
		print("ESP ВКЛ")
	end
end)

-- Аимбот
createToggle("Aimbot", function(state)
	if state then
		loadstring(game:HttpGet("https://pastebin.com/raw/ssri2YH8"))()
	end
end)

-- Телепорт к игрокам
createToggle("Teleport Menu", function(state)
	if state then
		loadstring(game:HttpGet("https://pastebin.com/raw/hx8ErZh8"))()
	end
end)

-- NoClip
createToggle("NoClip", function(state)
	if state then
		local noclip = true
		game:GetService('RunService').Stepped:Connect(function()
			if noclip then
				for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
				end
			end
		end)
	end
end)

-- Anti-AFK
createToggle("Anti-AFK", function(state)
	if state then
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:Connect(function()
			vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
			wait(1)
			vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
	end
end)

-- FreeCam
createToggle("FreeCam", function(state)
	if state then
		loadstring(game:HttpGet("https://pastebin.com/raw/gyQcCCXk"))() -- можно заменить ссылку
	end
end)
