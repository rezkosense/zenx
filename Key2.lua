getgenv().zenpassed = false
local save = true
local key = loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenhub/main/tracker'))()
if save then
    if not isfile('Zen X Key.txt') then
        writefile('Zen X Key.txt','')
    end
    local content = readfile('Zen X Key.txt')
    if content == key then
        getgenv().zenpassed = true
    end
end
local KeySystem = Instance.new("ScreenGui")
local Bckg = Instance.new("Frame")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local TitleDesc = Instance.new("TextLabel")
local TextboxTitle = Instance.new("TextLabel")
local KeyBox = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")
local ntowkring = Instance.new("TextLabel")
local desc2 = Instance.new("TextLabel")
local desc2_2 = Instance.new("TextLabel")
local howtogetkey = Instance.new("TextLabel")
local Close = Instance.new("ImageButton")
local GetKey = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Premium = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local Title_2 = Instance.new("TextLabel")
local TitleDesc_2 = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local V3rmillion = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local Title_3 = Instance.new("TextLabel")
local TitleDesc_3 = Instance.new("TextLabel")
local TextButton_2 = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")

--Properties:

KeySystem.Name = "Key System"
KeySystem.Parent = game.CoreGui
KeySystem.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Bckg.Name = "Bckg"
Bckg.Parent = KeySystem
Bckg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bckg.BackgroundTransparency = 1.000
Bckg.Size = UDim2.new(0, 1396, 0, 686)
Bckg.AnchorPoint = Vector2.new(0.5, 0.5)
Bckg.Position = UDim2.new(0.5, 0, 0.5, 0)

Main.Name = "Main"
Main.Parent = Bckg
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.Position = UDim2.new(0.31437701, 0, 0.289665222, 0)
Main.Size = UDim2.new(0, 518, 0, 288)

UICorner.CornerRadius = UDim.new(0, 11)
UICorner.Parent = Main

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.0675675645, 0, 0.121527776, 0)
Title.Size = UDim2.new(0, 78, 0, 23)
Title.Font = Enum.Font.GothamBold
Title.Text = "Zen X"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left

TitleDesc.Name = "TitleDesc"
TitleDesc.Parent = Main
TitleDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleDesc.BackgroundTransparency = 1.000
TitleDesc.Position = UDim2.new(0.0675675645, 0, 0.201388896, 0)
TitleDesc.Size = UDim2.new(0, 92, 0, 25)
TitleDesc.Font = Enum.Font.Gotham
TitleDesc.Text = "Key System"
TitleDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleDesc.TextScaled = true
TitleDesc.TextSize = 18.000
TitleDesc.TextTransparency = 0.200
TitleDesc.TextWrapped = true
TitleDesc.TextXAlignment = Enum.TextXAlignment.Left
TitleDesc.TextYAlignment = Enum.TextYAlignment.Top

TextboxTitle.Name = "TextboxTitle"
TextboxTitle.Parent = Main
TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextboxTitle.BackgroundTransparency = 1.000
TextboxTitle.Position = UDim2.new(0.0675675645, 0, 0.375, 0)
TextboxTitle.Size = UDim2.new(0, 124, 0, 29)
TextboxTitle.Font = Enum.Font.GothamBold
TextboxTitle.Text = "Enter your key"
TextboxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
TextboxTitle.TextSize = 15.000
TextboxTitle.TextTransparency = 0.200
TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left
TextboxTitle.TextYAlignment = Enum.TextYAlignment.Top

KeyBox.Name = "KeyBox"
KeyBox.Parent = Main
KeyBox.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
KeyBox.Position = UDim2.new(0.0675675645, 0, 0.458333343, 0)
KeyBox.Size = UDim2.new(0, 221, 0, 24)

UICorner_2.CornerRadius = UDim.new(0.00999999978, 7)
UICorner_2.Parent = KeyBox

TextBox.Parent = KeyBox
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.Position = UDim2.new(0.06334842, 0, 0.375, 0)
TextBox.Size = UDim2.new(0, 191, 0, 5)
TextBox.Font = Enum.Font.GothamSemibold
TextBox.PlaceholderText = "enter key"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14.000
TextBox.TextTransparency = 0.200
TextBox.TextXAlignment = Enum.TextXAlignment.Left

ntowkring.Name = "ntowkring"
ntowkring.Parent = Main
ntowkring.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ntowkring.BackgroundTransparency = 1.000
ntowkring.Position = UDim2.new(0.550193012, 0, 0.37500003, 0)
ntowkring.Size = UDim2.new(0, 125, 0, 22)
ntowkring.Font = Enum.Font.GothamBold
ntowkring.Text = "Not working?"
ntowkring.TextColor3 = Color3.fromRGB(255, 255, 255)
ntowkring.TextScaled = true
ntowkring.TextSize = 14.000
ntowkring.TextWrapped = true
ntowkring.TextXAlignment = Enum.TextXAlignment.Left

desc2.Name = "desc2"
desc2.Parent = Main
desc2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
desc2.BackgroundTransparency = 1.000
desc2.Position = UDim2.new(0.550193071, 0, 0.447916687, 0)
desc2.Size = UDim2.new(0, 208, 0, 40)
desc2.Font = Enum.Font.GothamSemibold
desc2.Text = "The prompt will automatically disappear and continue to load Zen X after waiting 180s"
desc2.TextColor3 = Color3.fromRGB(255, 255, 255)
desc2.TextScaled = true
desc2.TextSize = 14.000
desc2.TextTransparency = 0.200
desc2.TextWrapped = true
desc2.TextXAlignment = Enum.TextXAlignment.Left

desc2_2.Name = "desc2"
desc2_2.Parent = Main
desc2_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
desc2_2.BackgroundTransparency = 1.000
desc2_2.Position = UDim2.new(0.0675675645, 0, 0.784722209, 0)
desc2_2.Size = UDim2.new(0, 343, 0, 49)
desc2_2.Font = Enum.Font.GothamSemibold
desc2_2.Text = "Click \"Get Key\" then the discord invite link will be copied to your clipboard. Join the discord, verify, go to the key channel then copy paste the key into the textbox."
desc2_2.TextColor3 = Color3.fromRGB(255, 255, 255)
desc2_2.TextScaled = true
desc2_2.TextSize = 14.000
desc2_2.TextTransparency = 0.200
desc2_2.TextWrapped = true
desc2_2.TextXAlignment = Enum.TextXAlignment.Left

howtogetkey.Name = "howtogetkey"
howtogetkey.Parent = Main
howtogetkey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
howtogetkey.BackgroundTransparency = 1.000
howtogetkey.Position = UDim2.new(0.0675675273, 0, 0.729166627, 0)
howtogetkey.Size = UDim2.new(0, 125, 0, 22)
howtogetkey.Font = Enum.Font.GothamBold
howtogetkey.Text = "How to get key:"
howtogetkey.TextColor3 = Color3.fromRGB(255, 255, 255)
howtogetkey.TextScaled = true
howtogetkey.TextSize = 14.000
howtogetkey.TextTransparency = 0.200
howtogetkey.TextWrapped = true
howtogetkey.TextXAlignment = Enum.TextXAlignment.Left

Close.Name = "Close"
Close.Parent = Main
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.Position = UDim2.new(0.922779918, 0, 0.0512290522, 0)
Close.Size = UDim2.new(0, 27, 0, 21)
Close.Image = "rbxassetid://3926305904"
Close.ImageRectOffset = Vector2.new(924, 724)
Close.ImageRectSize = Vector2.new(36, 36)
Close.ScaleType = Enum.ScaleType.Fit

GetKey.Name = "GetKey"
GetKey.Parent = Main
GetKey.BackgroundColor3 = Color3.fromRGB(0, 143, 105)
GetKey.Position = UDim2.new(0.772200763, 0, 0.819444418, 0)
GetKey.Size = UDim2.new(0, 93, 0, 29)
GetKey.Font = Enum.Font.GothamBold
GetKey.Text = "Get Key"
GetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKey.TextSize = 16.000
GetKey.TextWrapped = true

UICorner_3.Parent = GetKey

Premium.Name = "Premium"
Premium.Parent = Bckg
Premium.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Premium.Position = UDim2.new(0.133712798, 0, 0.289665222, 0)
Premium.Size = UDim2.new(0, 245, 0, 200)

UICorner_4.CornerRadius = UDim.new(0, 11)
UICorner_4.Parent = Premium

Title_2.Name = "Title"
Title_2.Parent = Premium
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.Position = UDim2.new(0.0652465522, 0, 0.0737698302, 0)
Title_2.Size = UDim2.new(0, 113, 0, 33)
Title_2.Font = Enum.Font.GothamBold
Title_2.Text = "Premium"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextScaled = true
Title_2.TextSize = 14.000
Title_2.TextWrapped = true
Title_2.TextXAlignment = Enum.TextXAlignment.Left

TitleDesc_2.Name = "TitleDesc"
TitleDesc_2.Parent = Premium
TitleDesc_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleDesc_2.BackgroundTransparency = 1.000
TitleDesc_2.Position = UDim2.new(0.071457468, 0, 0.237468719, 0)
TitleDesc_2.Size = UDim2.new(0, 208, 0, 78)
TitleDesc_2.Font = Enum.Font.Gotham
TitleDesc_2.Text = "With premium, you get \"mod perks\". With mod perks, you can do various command to users of Zen X! If you want to purchase mod perks, head over to the discord."
TitleDesc_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleDesc_2.TextScaled = true
TitleDesc_2.TextSize = 18.000
TitleDesc_2.TextTransparency = 0.200
TitleDesc_2.TextWrapped = true
TitleDesc_2.TextXAlignment = Enum.TextXAlignment.Left
TitleDesc_2.TextYAlignment = Enum.TextYAlignment.Top

TextButton.Parent = Premium
TextButton.BackgroundColor3 = Color3.fromRGB(0, 93, 143)
TextButton.Position = UDim2.new(0.0619966984, 0, 0.779444396, 0)
TextButton.Size = UDim2.new(0, 93, 0, 29)
TextButton.Font = Enum.Font.GothamBold
TextButton.Text = "Copy Link"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 16.000
TextButton.TextWrapped = true

UICorner_5.Parent = TextButton

V3rmillion.Name = "V3rmillion"
V3rmillion.Parent = Bckg
V3rmillion.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
V3rmillion.Position = UDim2.new(0.689975739, 0, 0.289665222, 0)
V3rmillion.Size = UDim2.new(0, 245, 0, 200)
V3rmillion.Visible = false

UICorner_6.CornerRadius = UDim.new(0, 11)
UICorner_6.Parent = V3rmillion

Title_3.Name = "Title"
Title_3.Parent = V3rmillion
Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_3.BackgroundTransparency = 1.000
Title_3.Position = UDim2.new(0.0652465522, 0, 0.0737698302, 0)
Title_3.Size = UDim2.new(0, 113, 0, 33)
Title_3.Font = Enum.Font.GothamBold
Title_3.Text = "V3rmillion"
Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_3.TextScaled = true
Title_3.TextSize = 14.000
Title_3.TextWrapped = true
Title_3.TextXAlignment = Enum.TextXAlignment.Left

TitleDesc_3.Name = "TitleDesc"
TitleDesc_3.Parent = V3rmillion
TitleDesc_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleDesc_3.BackgroundTransparency = 1.000
TitleDesc_3.Position = UDim2.new(0.071457468, 0, 0.237468719, 0)
TitleDesc_3.Size = UDim2.new(0, 208, 0, 78)
TitleDesc_3.Font = Enum.Font.Gotham
TitleDesc_3.Text = "We have a v3rmillion thread!  We would appreciate it if you'd like and reply to the thread! :) You can click the \"Copy Link\" button below to copy the link to the thread."
TitleDesc_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleDesc_3.TextScaled = true
TitleDesc_3.TextSize = 18.000
TitleDesc_3.TextTransparency = 0.200
TitleDesc_3.TextWrapped = true
TitleDesc_3.TextXAlignment = Enum.TextXAlignment.Left
TitleDesc_3.TextYAlignment = Enum.TextYAlignment.Top

TextButton_2.Parent = V3rmillion
TextButton_2.BackgroundColor3 = Color3.fromRGB(143, 0, 45)
TextButton_2.Position = UDim2.new(0.0619966984, 0, 0.779444396, 0)
TextButton_2.Size = UDim2.new(0, 93, 0, 29)
TextButton_2.Font = Enum.Font.GothamBold
TextButton_2.Text = "Copy Link"
TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.TextSize = 16.000
TextButton_2.TextWrapped = true

UICorner_7.Parent = TextButton_2

coroutine.resume(coroutine.create(function(v)
    while getgenv().zenpassed == false do
        task.wait()
        if TextBox.Text == key then
            getgenv().zenpassed = true
            if save then
                writefile('Zen X Key.txt',key)
            end
        end
    end
end))

coroutine.resume(coroutine.create(function()
    local thetime = 180
    while task.wait(1) do
        if thetime ~= 0 then
            thetime = thetime - 1
            desc2.Text = "The prompt will automatically disappear and continue to load Zen X after waiting " .. tostring(thetime) .. "s"
        else
            getgenv().zenpassed = true
            return
        end
    end
end))

Close.MouseButton1Click:connect(function()
    pcall(function()
        game.CoreGui["Key System"]:Destroy()
    end)
end)

GetKey.MouseButton1Click:connect(function()
    setclipboard("https://discord.gg/Rm3RCvnSqv")
    GetKey.Text = "Copied!"
    wait(2)
    GetKey.Text = "Copy Link"
end)

TextButton.MouseButton1Click:connect(function()
    setclipboard("https://discord.gg/Rm3RCvnSqv")
    TextButton.Text = "Copied!"
    wait(2)
    TextButton.Text = "Copy Link"
end)

repeat wait() until getgenv().zenpassed
if not game.CoreGui:FindFirstChild('Key System') then return end
pcall(function()
    game.CoreGui["Key System"]:Destroy()
end)
print'passed!'
