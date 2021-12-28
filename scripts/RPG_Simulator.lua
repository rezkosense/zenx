repeat wait() until game:IsLoaded()
repeat wait() until game:GetService("Players").LocalPlayer:WaitForChild('Loaded').Value == true
wait()
if getgenv().loaded then
    game.Players.LocalPlayer:Kick("Script already loaded, rejoining..")
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
else
FTS = "ZenXLibv2 - RPG Simulator"
local ZenLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/scripts/main/library.lua"))()
ver = "1.0.2a"
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
    hideui = false;
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

--// functions / settings / loops \\--
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

coroutine.resume(coroutine.create(function()
    while wait() do
        if getgenv().swing then
            swingdasword()
            print'swinged'
            wait(0.3)
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
--============= RAID FARM (won't do anything if not in a raid) ===============--
function farmraid()
    if not workspace:FindFirstChild('W1') or not workspace:FindFirstChild('QuestNPCs') then
        if getgenv().raidfarm then
            part = game:GetService("Workspace"):WaitForChild('Mobs'):FindFirstChild('Crystal') or game:GetService("Workspace"):WaitForChild('Mobs'):FindFirstChild('Stand') or game:GetService("Workspace"):WaitForChild('Mobs'):FindFirstChildWhichIsA("Model")
            if part then
                getgenv().swing = true
                print'ya'
                repeat
                    game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = part.HumanoidRootPart.CFrame + Vector3.new(0,0,3)
                    lookAt(game.Players.LocalPlayer.Character, part.HumanoidRootPart)
                    wait()
                until abort or part.Humanoid.Health == 0 or not part:IsDescendantOf(game.Workspace.Mobs) or not part.HumanoidRootPart:IsDescendantOf(part) or game.Players.LocalPlayer.Character.Humanoid.Health == 0
                getgenv().swing = false
                abort = false
                farmraid()
            else
                wait()
                farmraid()
            end
        end
    end
end
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    farmraid()
end)

workspace:WaitForChild('Mobs').ChildAdded:Connect(function(v) -- sets the target to kill the crystal/shard in shadow palace/crystal caverns
    if v.Name == "Stand" or v.Name == "Crystal" then
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
                wait(0.3)
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
local settings = win:Tab("Settings")

local autofarm = auto:Section("Auto Farm")
local autoskill = auto:Section("Auto Skill")
local raidfarm = auto:Section("Raid Farm")
local teleports = auto:Section("Teleports")

local settingstab = settings:Section("Settings")

settingstab:Toggle("Auto Hide UI on Launch",Settings.hideui,"Toggle",function(v)
    Settings.hideui = v
    save()
end)

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
    farmraid()
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

print'sa'
getgenv().loaded = true
print'set loaded'
-- load allll the settings woohoo
for _,v in pairs(Settings) do
    getgenv()[_] = v
end
print'loaded settings'
farm()
farmraid()
print'turned on'
-- logs game, exploit, first 3 letters of username
loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/log.lua'))()
wait(1)
if Settings.hideui == true then
    for _,v in pairs(game.CoreGui:GetChildren()) do
        if string.find(v.Name, "0.") then
            v:WaitForChild('MainFrameHolder').Visible = false
            v:WaitForChild('MusicFrameHolder').Visible = false
        end
    end
end
end
