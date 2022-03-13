
repeat wait() until game:IsLoaded()
pcall(function()
    repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild('FULLY_LOADED_CHAR')
end)

isPremium = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/mods/main/mod.lua"))()

if not isPremium[game.Players.LocalPlayer.UserId] then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/Key2.lua'))()
end

local function load(package)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/packages/' .. tostring(package) .. '.lua'))()
end

--// load packages \\--
load('log') -- user, game, exploit

-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService('Players')

-- // Vars
local player = players.LocalPlayer
local chr = player.Character
local hrp = chr:WaitForChild('HumanoidRootPart')
local KO = chr.BodyEffects["K.O"]

local __index
__index = hookmetamethod(game, "__index", function(t, k)
    if (t:IsA("Mouse") and (k == "Hit" or k == "Target")) then
        local SelectedPart = getgenv().selectedpart
        if (k == "Hit" or k == "Target") then
            local Hit = SelectedPart.CFrame
            return (k == "Hit" and Hit or SelectedPart)
        end
    end
    return __index(t, k)
end)

-- // Functions

function hop()
    local x = {}
    for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
        if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
            x[#x + 1] = v.id
        end
    end
    if #x > 0 then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
    else
        print('failed to find server')
    end
end

function forceReset()
    chr:BreakJoints()
end

function lookAt(chr,target)
    if chr.PrimaryPart then 
        local chrPos=chr.PrimaryPart.Position 
        local tPos=target.Position 
        local newCF=CFrame.new(chrPos,tPos) 
        chr:SetPrimaryPartCFrame(newCF)
    end
end

local VirtualInputManager = game:GetService('VirtualInputManager')
local function m1click() 
    VirtualInputManager:SendMouseButtonEvent(0,0,0,true,game,0)
    task.wait()
    VirtualInputManager:SendMouseButtonEvent(0,0,0,false,game,0)
end

abort = false
function ATM()
    task.wait(1)
    for _,v in pairs(workspace.Cashiers:GetChildren()) do
        if v.Humanoid.Health > 1 then
            local part = v.Open
            repeat
                pcall(function()
                    chr.HumanoidRootPart.CFrame = v.Open.CFrame + Vector3.new(2, 0, 0)
                end)
                lookAt(chr, v.Open)
                getgenv().selectedpart = v.Open
                task.wait()
                m1click()
            until v.Humanoid.Health < 2 or KO.Value == true or abort == true
            task.wait()
            if KO.Value == true then
                forceReset()
            end
            chr.HumanoidRootPart.CFrame = v.Open.CFrame + Vector3.new(2, 0, 0)
            for _,v in pairs(workspace.Ignored.Drop:GetChildren()) do
                if not abort then
                    if v:IsA('Part') and v.Name == "MoneyDrop" then
                        if (chr.HumanoidRootPart.Position - v.Position).Magnitude <= 100 then
                            chr.HumanoidRootPart.CFrame = CFrame.new(v.Position)
                            repeat
                                fireclickdetector(v:WaitForChild('ClickDetector'))
                                task.wait()
                            until not v:IsDescendantOf(workspace.Ignored.Drop)
                        end
                    end
                end
            end
        end
    end
    if getgenv().serverhop then
        wait()
        hop()
        wait()
        ATM()
    else 
        ATM() 
    end
end

player.CharacterAdded:Connect(function() ATM() end)
aad = false
function check()
    if not player.Backpack:FindFirstChild('[Double-Barrel SG]') and not chr:FindFirstChild("[Double-Barrel SG]") then
        abort = true
        repeat
            task.wait(0.3)
            chr.HumanoidRootPart.CFrame = workspace.Ignored.Shop["[Double-Barrel SG] - $1400"].Head.CFrame + Vector3.new(0, 5, 0)
            task.wait(0.3)
            fireclickdetector( workspace.Ignored.Shop["[Double-Barrel SG] - $1400"].ClickDetector)
        until player.Backpack:FindFirstChild('[Double-Barrel SG]')
        abort = false
    end
    if player.Backpack:FindFirstChild('[Double-Barrel SG]') then
        chr.Humanoid:EquipTool(player.Backpack:FindFirstChild('[Double-Barrel SG]'))
    end
    if chr:FindFirstChild("[Double-Barrel SG]") then
        if chr:FindFirstChild("[Double-Barrel SG]").Ammo.Value == 0 then
            VirtualInputManager:SendKeyEvent(true, "R", false, game)
            wait(0.1)
            VirtualInputManager:SendKeyEvent(false, "R", false, game)
        end
    end
    aad = true
end

spawn(function()
    while wait() do
        check()
    end
end)
repeat wait() until aad
spawn(function()
    while wait(100) do
        if getgenv().serverhop then hop() end
    end
end)
game.StarterGui:SetCore("SendNotification", {
    Title = "KEY SYSTEM";
    Text = "We added the key system. Don't worry, your key saves so you don't keep having to do this.";
    Duration = 9e9;
})

ATM()
