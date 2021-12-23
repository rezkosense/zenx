repeat wait() until game:IsLoaded()
repeat wait() until game:GetService("Players").LocalPlayer:WaitForChild('Loaded').Value == true
if getgenv().loaded then
    game.Players.LocalPlayer:Kick("Script already loaded, rejoining..")
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
else
FTS = "ZenXLibv2 - RPG Simulator"
local ZenLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/scripts/main/library.lua"))()
ver = "1.0.1a"
local win = ZenLib:New({
Name = "RPG Simulator - Zen X",
FolderToSave = FTS
})

--// config \\--

defaultConfig = {
    autofarm = false;
    mob = "",
    autoskill1 = false;
    autoskill2 = false;
    autoskill3 = false;
    raidfarm = false;
    raid = "";
    raidfarmhardcore = false;
    version = ver;
}
if not isfile(FTS .. "/configs/config.json") then
    writefile(FTS .. "/configs/config.json",game:GetService("HttpService"):JSONEncode(defaultConfig))
end
Settings = game:GetService("HttpService"):JSONDecode(readfile(FTS .. "/configs/config.json"))
if Settings.version ~= ver then
    delfile(FTS .. "/configs/config.json")
    writefile(FTS .. "/configs/config.json",game:GetService("HttpService"):JSONEncode(defaultConfig))
end
function save()
    writefile(FTS .. "/configs/config.json",game:GetService("HttpService"):JSONEncode(Settings))
end

--// functions / settings \\--
local VirtualInputManager = game:GetService('VirtualInputManager')
function swingdasword()
    local args = {[1] = "Slash"}
    game:GetService("ReplicatedStorage").Events.attack:FireServer(unpack(args))
    local args = {[1] = "T"}
    game:GetService("ReplicatedStorage").Events.attack:FireServer(unpack(args)) 
    local args = {[1] = "E"}
    game:GetService("ReplicatedStorage").Events.attack:FireServer(unpack(args))
end
function lookAt(chr,target) -- found this func somewhere
    if chr.PrimaryPart then 
        local chrPos=chr.PrimaryPart.Position 
        local tPos=target.Position 
        local newCF=CFrame.new(chrPos,tPos) 
        chr:SetPrimaryPartCFrame(newCF)
    end
end
--============= RAID FARM (won't do anything if not in a raid) ===============--
function farmraid()
    if not workspace:FindFirstChild('Touchies') then
        if getgenv().raidfarm then
            repeat wait() until (#game:GetService("Workspace"):WaitForChild('Mobs'):GetChildren()) > 0
            part = game:GetService("Workspace"):WaitForChild('Mobs'):FindFirstChild('Stand') or game:GetService("Workspace"):WaitForChild('Mobs'):FindFirstChildWhichIsA("Model")
            if part then
                swing = true
                repeat
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.HumanoidRootPart.CFrame + Vector3.new(0,0,3)
                    lookAt(game.Players.LocalPlayer.Character, part.HumanoidRootPart)
                    wait()
                until abort or part.Humanoid.Health == 0 or not part:IsDescendantOf(game.Workspace.Mobs) or not part.HumanoidRootPart:IsDescendantOf(part) or game.Players.LocalPlayer.Character.Humanoid.Health == 0
                farmraid()
                swing = false
                abort = false
            end
        end
    end
end
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    if not workspace:FindFirstChild('Touchies') then -- see if we are in a raid or not
        farmraid()
    end
end)
workspace:WaitForChild('Mobs').ChildAdded:Connect(function(v)
    if v.Name == "Stand" then
        abort = true
        farmraid()
    end
end)

--========= NORMAL =========--

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
    if getgenv().autofarm then
        part = gettarget(getgenv().mob)
        if part then
            swing = true
            repeat
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.HumanoidRootPart.CFrame + Vector3.new(0,0,3)
                lookAt(game.Players.LocalPlayer.Character, part.HumanoidRootPart)
                wait()
            until part.Humanoid.Health == 0 or not part:IsDescendantOf(game.Workspace.Mobs) or not part.HumanoidRootPart:IsDescendantOf(part) or game.Players.LocalPlayer.Character.Humanoid.Health == 0
            swing = false
            farm()
        end
    end
end
function getTeleports()
    tp = {}
    pcall(function()
    for _,v in pairs(game:GetService("Workspace").Touchies:GetChildren()) do
        table.insert(tp, v.Name)
    end
end)
    return tp
end

function getRaids()
    raids = {}
    pcall(function()
    a = require(game:GetService("ReplicatedStorage").Raids)
    for i,v in pairs(a) do table.insert(raids, i) end
    end)
    return raids
end

-- UI

local auto = win:Tab("Main")

local autofarm = auto:Section("Auto Farm")
local autoskill = auto:Section("Auto Skill")
local raidfarm = auto:Section("Raid Farm")
local teleports = auto:Section("Teleports")

autofarm:Toggle("Auto Farm",Settings.autofarm,"Toggle",function(v)
    getgenv().autofarm = v
    Settings.autofarm = v
    save()
    farm()
end)
local mob = autofarm:Dropdown("Select Mob",getMobs(),Settings.mob,"Dropdown", function(v)
    getgenv().mob = v
    Settings.mob = v
    save()
end)
autofarm:Toggle("Auto drink potions",Settings.drink,"Toggle",function(v)
    getgenv().drink = v
    Settings.drink = v
    save()
end)

autoskill:Toggle("Auto Skill 1",Settings.autoskill1,"Toggle",function(v)
    getgenv().autoskill1 = v
    Settings.autoskill1 = v
    save()
end)
autoskill:Toggle("Auto Skill 2",Settings.autoskill2,"Toggle",function(v)
    getgenv().autoskill2 = v
    Settings.autoskill2 = v
    save()
end)
autoskill:Toggle("Auto Skill 3",Settings.autoskill3,"Toggle",function(v)
    getgenv().autoskill3 = v
    Settings.autoskill3 = v
    save()
end)

raidfarm:Toggle("Raid Farm",Settings.raidfarm,"Toggle",function(v)
    getgenv().raidfarm = v
    Settings.raidfarm = v
    save()
end)

raidfarm:Toggle("Raid Farm: Hardcore?",Settings.raidfarmhardcore,"Toggle",function(v)
    getgenv().raidfarmhardcore = v
    Settings.raidfarmhardcore = v
    save()
end)

local rf = raidfarm:Dropdown("Select Raid",getRaids(),Settings.raid,"Dropdown",function(v)
    getgenv().raid = v
    Settings.raid = v
    save()
end)

local teleport = teleports:Dropdown("Select TP",getTeleports(),"","Dropdown",function(v)
    selectedteleport = v
end)

teleports:Button("Teleport",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Touchies[selectedteleport].CFrame + Vector3.new(0, 6, 0)
end)
game.Players.LocalPlayer.CharacterAdded:connect(function()
    wait(1)
    farm()
end)
coroutine.resume(coroutine.create(function()
    while wait(0.3) do
        if swing then
            swingdasword()
        end
    end
end))

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
coroutine.resume(coroutine.create(function()
    while wait(1) do
        if getgenv().drink then
            game:GetService("ReplicatedStorage").Events.drink:FireServer()
        end
    end
end))
coroutine.resume(coroutine.create(function()
    while wait(1) do
        if getgenv().raidfarm then
            if workspace:FindFirstChild('Touchies') then
                local args = {
                    [1] = "Raid",
                    [2] = getgenv().raid,
                    [3] = getgenv().raidfarmhardcore or false
                }
                
                game:GetService("ReplicatedStorage").Events.raidEvent:FireServer(unpack(args))
            end
        end
    end
end))
for _,v in pairs(Settings) do
    getgenv()[_] = v
end
farm()
farmraid()
getgenv().loaded = true
end
