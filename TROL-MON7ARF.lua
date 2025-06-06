local Player = game.Players.LocalPlayer
local Gui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
Gui.Name = "AlMon7arifGUI"
Gui.ResetOnSpawn = false

-- تشغيل صوت ترحيبي
local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://72142838917246"
sound.Volume = 2
sound:Play()

-- رسالة تحت الشاشة بعد الدخول
local msg = Instance.new("TextLabel", Gui)
msg.Size = UDim2.new(0, 400, 0, 30)
msg.Position = UDim2.new(0.5, -200, 1, -40)
msg.BackgroundTransparency = 0.3
msg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
msg.Text = "المنحرف الأعظم بيحبك وبيقلق ❤️ خد بنت موزة أهي 🍌🔥"
msg.Font = Enum.Font.GothamBold
msg.TextColor3 = Color3.fromRGB(255, 255, 0)
msg.TextSize = 18
msg.TextStrokeTransparency = 0.8
msg.TextWrapped = true

-- حذف الصوت والرسالة بعد 10 ثواني
delay(10, function()
	sound:Destroy()
	msg:Destroy()
end)

wait(3) -- وقت ظهور رسالة البداية

-- واجهة البداية
local WelcomeFrame = Instance.new("Frame", Gui)
WelcomeFrame.Size = UDim2.new(0, 500, 0, 100)
WelcomeFrame.Position = UDim2.new(0.5, -250, 0.5, -50)
WelcomeFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
WelcomeFrame.BorderSizePixel = 0
WelcomeFrame.Visible = true

local welcomeText = Instance.new("TextLabel", WelcomeFrame)
welcomeText.Size = UDim2.new(1, 0, 1, 0)
welcomeText.Text = "أهلاً بيك! المنحرف العظيم بيمسي على فخادك وبيقولك بحبك ❤️"
welcomeText.Font = Enum.Font.GothamBlack
welcomeText.TextSize = 22
welcomeText.TextColor3 = Color3.fromRGB(255, 255, 255)
welcomeText.BackgroundTransparency = 1

wait(3)
WelcomeFrame:Destroy()

-- الإطار الأساسي
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 500, 0, 400)
Main.Position = UDim2.new(0.5, -250, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

-- زر إغلاق
local Close = Instance.new("TextButton", Main)
Close.Text = "✖"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 20
Close.TextColor3 = Color3.fromRGB(255, 80, 80)
Close.Size = UDim2.new(0, 40, 0, 40)
Close.Position = UDim2.new(1, -45, 0, 5)
Close.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Close.MouseButton1Click:Connect(function()
	Gui:Destroy()
end)

-- زر تصغير مع إخفاء وإظهار الأزرار مع الحفاظ على نص كلان ثابت
local Min = Instance.new("TextButton", Main)
Min.Text = "━"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 20
Min.TextColor3 = Color3.fromRGB(80, 255, 80)
Min.Size = UDim2.new(0, 40, 0, 40)
Min.Position = UDim2.new(1, -90, 0, 5)
Min.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

local minimized = false
local buttonsToToggle = {}

Min.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		Main.Size = UDim2.new(0, 500, 0, 60)
		for _, btn in pairs(buttonsToToggle) do
			btn.Visible = false
		end
	else
		Main.Size = UDim2.new(0, 500, 0, 400)
		for _, btn in pairs(buttonsToToggle) do
			btn.Visible = true
		end
	end
end)

-- عنوان
local Title = Instance.new("TextLabel", Main)
Title.Text = "قائمة المنحرف العظيم (k7) 💀🔥"
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 24
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Size = UDim2.new(0.7, -100, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 10)
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left

-- نص كلان ثابت بجانب العنوان
local ClanTag = Instance.new("TextLabel", Main)
ClanTag.Text = "كلان K7 عمكم يولاد المتنااكه"
ClanTag.Font = Enum.Font.GothamBold
ClanTag.TextSize = 22
ClanTag.TextColor3 = Color3.fromRGB(255, 165, 0)
ClanTag.Position = UDim2.new(0.05, 0, 0, 325)
ClanTag.Size = UDim2.new(0.9, 0, 0, 40)        -- حجم عرض تقريبا مثل عرض الزر، وارتفاع 40 بكسل
ClanTag.BackgroundTransparency = 1
ClanTag.TextXAlignment = Enum.TextXAlignment.Right

-- زر مخصص
local function MakeButton(text, posY, callback)
	local Btn = Instance.new("TextButton", Main)
	Btn.Size = UDim2.new(0.9, 0, 0, 45)
	Btn.Position = UDim2.new(0.05, 0, 0, posY)
	Btn.Text = text
	Btn.Font = Enum.Font.GothamBold
	Btn.TextSize = 20
	Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	Btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	Btn.BorderSizePixel = 0
	Btn.MouseButton1Click:Connect(callback)

	table.insert(buttonsToToggle, Btn) -- خزّن الزر هنا
end

-- الخانات
MakeButton("🎭 فعل بانج بسلوب جديد", 60, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tptub/fuke/refs/heads/main/almon7arf"))()
end)

MakeButton("🚨 RD4", 115, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/M1ZZ001/BrookhavenR4D/main/Brookhaven%20R4D%20Script"))()
end)

MakeButton("📜 أكواد", 170, function()
	local CodesFrame = Instance.new("Frame", Gui)
	CodesFrame.Size = UDim2.new(0, 350, 0, 300)
	CodesFrame.Position = UDim2.new(0.5, -175, 0.5, -150)
	CodesFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	CodesFrame.BorderSizePixel = 0
	CodesFrame.Active = true
	CodesFrame.Draggable = true

	local codes = {
		"98509241790002",
		"106169760792625",
		"118074256196452",
		"8701632845",
		"6713993281",
		"6989727632",
		"4776398821",
		"16190784875"
	}

	for i, code in ipairs(codes) do
		local codeText = Instance.new("TextLabel", CodesFrame)
		codeText.Size = UDim2.new(0.7, 0, 0, 25)
		codeText.Position = UDim2.new(0.05, 0, 0, (i - 1) * 30)
		codeText.Text = code
		codeText.TextColor3 = Color3.fromRGB(255, 255, 255)
		codeText.Font = Enum.Font.Gotham
		codeText.TextSize = 16
		codeText.BackgroundTransparency = 1
		codeText.TextXAlignment = Enum.TextXAlignment.Left

		local copyBtn = Instance.new("TextButton", CodesFrame)
		copyBtn.Size = UDim2.new(0.2, 0, 0, 25)
		copyBtn.Position = UDim2.new(0.75, 0, 0, (i - 1) * 30)
		copyBtn.Text = "نسخ"
		copyBtn.Font = Enum.Font.GothamBold
		copyBtn.TextSize = 14
		copyBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
		copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		copyBtn.MouseButton1Click:Connect(function()
			setclipboard(code)
		end)
	end
end)

MakeButton("✈️ طيران نسخة المنحرف", 225, function()
	loadstring(game:HttpGet("https://pastebin.com/raw/cZHh2grR"))()
end)

MakeButton("🔧 ESP كشف اماكن ", 280, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tptub/ESP/refs/heads/main/ESP.lua"))()
end)
