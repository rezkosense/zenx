
repeat task.wait() until game:IsLoaded()
pcall(function()
    repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild('FULLY_LOADED_CHAR')
end)
loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/Key2.lua'))()

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
local chr
pcall(function()
repeat task.wait() chr = player.Character until chr
end)
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
    for _,v in pairs(chr:GetDescendants()) do
        if v:IsA("BasePart") then
            v:Destroy()
        end
    end
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
    task.wait(2)
    for _,v in pairs(workspace.Cashiers:GetChildren()) do
        if v.Humanoid.Health > 1 then
            local part = v.Open
            repeat
                pcall(function()
                    chr.HumanoidRootPart.CFrame = v.Head.CFrame + Vector3.new(3, -2, 0)
                end)
                lookAt(chr, v.Open)
                getgenv().selectedpart = v.Open
                task.wait(0.2)
                m1click()
            until v.Humanoid.Health < 2 or KO.Value == true or abort == true
            task.wait()
            if KO.Value == true then
                forceReset()
            end
            pcall(function()
            chr.HumanoidRootPart.CFrame = v.Open.CFrame + Vector3.new(2, 0, 0)
            end)
            task.wait(0.1)
            for _,v in pairs(workspace.Ignored.Drop:GetChildren()) do
                if v:IsA('Part') and v.Name == "MoneyDrop" then
                    repeat
                        pcall(function()
                            chr.HumanoidRootPart.CFrame = CFrame.new(v.Position)
                        end)
                        fireclickdetector(v:WaitForChild('ClickDetector'))
                        task.wait()
                    until not v:IsDescendantOf(workspace.Ignored.Drop)
                end
            end
        end
    end
    game:ShutDown()
end

player.CharacterAdded:Connect(function() ATM() end)
aad = false
function check()
    if not player.Backpack:FindFirstChild('[Double-Barrel SG]') and not chr:FindFirstChild("[Double-Barrel SG]") then
        repeat
            task.wait(0.3)
            chr.HumanoidRootPart.CFrame = workspace.Ignored.Shop["[Double-Barrel SG] - $1400"].Head.CFrame + Vector3.new(0, 5, 0)
            task.wait(0.3)
            fireclickdetector( workspace.Ignored.Shop["[Double-Barrel SG] - $1400"].ClickDetector)
        until player.Backpack:FindFirstChild('[Double-Barrel SG]')
    end
    if player.Backpack:FindFirstChild('[Double-Barrel SG]') then
        chr.Humanoid:EquipTool(player.Backpack:FindFirstChild('[Double-Barrel SG]'))
    end
    if chr:FindFirstChild("[Double-Barrel SG]") then
        if player.DataFolder.Inventory["[Double-Barrel SG]"].Value == 0 then
            chr:BreakJoints()
        end
        VirtualInputManager:SendKeyEvent(true, "R", false, game)
        task.wait(0.05)
        VirtualInputManager:SendKeyEvent(false, "R", false, game)
    end
    aad = true
end

spawn(function()
    while task.wait() do
        check()
    end
end)

repeat task.wait() until aad

spawn(function()
    while task.wait(100) do
        if getgenv().serverhop then hop() end
    end
end)
game.StarterGui:SetCore("SendNotification", {
    Title = "KEY SYSTEM";
    Text = "We added the key system. Don't worry, your key saves so you don't keep having to do this.";
    Duration = 9e9;
})

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)


ATM()
