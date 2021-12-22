getgenv().speed = 300
local VirtualInputManager = game:GetService('VirtualInputManager')
function swing()
    local args = {[1] = "Slash"}
    game:GetService("ReplicatedStorage").Events.attack:FireServer(unpack(args))
    local args = {[1] = "T"}
    game:GetService("ReplicatedStorage").Events.attack:FireServer(unpack(args)) 
    local args = {[1] = "E"}
    game:GetService("ReplicatedStorage").Events.attack:FireServer(unpack(args))
end
function gettarget(mob)
    for _,v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
        if v.Name == mob then
            if v.Humanoid.Health ~= 0 then
                target = v
            end
        end
    end
    return target
end
function getMobs()
    currentmobs = {}
    for _,v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
        if v:IsA('Model') then
            if not table.find(currentmobs, v.Name) then
                table.insert(currentmobs, v.Name)
            end
        end
    end
    return currentmobs
end
function farm()
    if getgenv().auto then
        part = gettarget(mob)
        local Time = (part.HumanoidRootPart.Position + Vector3.new(0, 0, 3) - game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').Position).Magnitude / getgenv().speed
        local Info = TweenInfo.new(Time, Enum.EasingStyle.Linear)
        local Tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart'), Info, {CFrame = CFrame.new(part.HumanoidRootPart.Position + Vector3.new(0, 0, 3))})
        Tween:Play()
        Tween.Completed:Connect(function()
            repeat
                swing()
                wait(0.5) -- delay is needed as if you attack too quickly u get banned
            until part.Humanoid.Health == 0 or not part:IsDescendantOf(game.Workspace.Mobs) or not part.HumanoidRootPart:IsDescendantOf(part) or game.Players.LocalPlayer.Character.Humanoid.Health == 0
            farm()
        end)
    end
end

coroutine.resume(coroutine.create(function()
    while wait(1) do
        if getgenv().autoskill1 then
            VirtualInputManager:SendKeyEvent(true, "Q", false, game)
            wait()
            VirtualInputManager:SendKeyEvent(false, "Q", false, game)
        end
    end
end))
coroutine.resume(coroutine.create(function()
    while wait(1) do
        if getgenv().autoskill2 then
            VirtualInputManager:SendKeyEvent(true, "E", false, game)
            wait()
            VirtualInputManager:SendKeyEvent(false, "E", false, game)
        end
    end
end))
coroutine.resume(coroutine.create(function()
    while wait(1) do
        if getgenv().autoskill3 then
            VirtualInputManager:SendKeyEvent(true, "R", false, game)
            wait()
            VirtualInputManager:SendKeyEvent(false, "R", false, game)
        end
    end
end))

game.Players.LocalPlayer.CharacterAdded:connect(function()
    wait(1)
    farm()
end)
-- UI
local ZenLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/scripts/main/library.lua"))()

local win = ZenLib:New({
Name = "RPG Simulator - Zen X",
FolderToSave = "ZenXLibv2 - RPG Simulator"
})

local auto = win:Tab("Main")

local autofarm = auto:Section("Auto farm")
local autoskill = auto:Section("Auto skill")

autofarm:Toggle("Auto farm",false,"Toggle",function(v)
    getgenv().auto = v
    farm()
end)
local mob = autofarm:Dropdown("Select Mob",getMobs(),"","Dropdown", function(v)
    mob = v
end)

autoskill:Toggle("Auto skill 1",false,"Toggle",function(v)
    getgenv().autoskill1 = v
end)
autoskill:Toggle("Auto skill 2",false,"Toggle",function(v)
    getgenv().autoskill2 = v
end)
autoskill:Toggle("Auto skill 3",false,"Toggle",function(v)
    getgenv().autoskill3 = v
end)
