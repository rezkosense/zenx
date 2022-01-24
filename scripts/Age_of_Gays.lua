repeat wait() until game:IsLoaded()
Players = game.Players
player = game.Players.LocalPlayer

game:GetService('RunService').Stepped:connect(function()
    getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.GameClient)._G.energy = math.huge
end)

spawn(function()
    while task.wait() do
        if hideuser then
            pcall(function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.titleGui.Frame:Destroy()
            end)
        end
    end
end)

game.Players.LocalPlayer.CharacterAdded:connect(function()
    if autotptoplace then
        repeat wait() until game.Players.LocalPlayer.Character
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4054.0578613281, 98.046501159668, -2694.2946777344)
    end
end)

function Invis()
    local Player = game.Players.LocalPlayer
    local savepos = Player.Character.HumanoidRootPart.CFrame
    
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2463.92822, 256.457916, -2009.25574)
    wait(2)
    local Clone = game:GetService('Players').LocalPlayer.Character.LowerTorso.Root:Clone()
    game:GetService('Players').LocalPlayer.Character.LowerTorso.Root:Destroy()
    Clone.Parent = game:GetService('Players').LocalPlayer.Character.LowerTorso
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savepos
end

local function findPlayer(name)
    for _, Player in ipairs(Players:GetPlayers()) do
        if (string.lower(name) == string.sub(string.lower(Player.Name), 1, #name)) then
            return Player;
        end
    end
end

function view(plr)
    wait()
    if game.Players:FindFirstChild(plr) then
        if game.Players[plr].Character then
            game.Workspace:FindFirstChildWhichIsA('Camera').CameraSubject = game.Players:FindFirstChild(plr).Character.HumanoidRootPart
        else
            spectate = false
        end
    else
        spectate = false
    end
end

local VirtualUser=game:GetService('VirtualUser')
game:GetService('Players').LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

spawn(function()
    while task.wait() do
        if orbfarm then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").ExperienceOrbs:GetChildren()) do
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                end
            end)
        end
    end
end)

spawn(function()
    while true and wait() do
        if herofarm then
            pcall(function()
                repeat
                    local target = game:GetService("Workspace"):FindFirstChild("Thug")
                    if target.Humanoid.Health <= 0 then
                        target:Destroy()
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (target.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0.5))
                    wait(0.1)
                    local args = {
                        [1] = 0,
                        [2] = 0.1,
                        [3] = 1
                    }
                    game:GetService("ReplicatedStorage").Events.Punch:FireServer(unpack(args))
                    wait(0.1)
                until not thugfarm
            end)
        end
    end
end)

spawn(function()
    while true and wait() do
        if villianfarm then
            pcall(function()
                repeat
                    target1 = game:GetService("Workspace"):FindFirstChild("Civilian")
                    if target1 == nil then
                        target1 = game:GetService("Workspace"):FindFirstChild("Police")
                    end
                    if target1 ~= nil then
                        if target1.Humanoid.Health <= 0 then
                            target1:Destroy()
                        end
                        game.Players.LocalPlayer.Character.Head.CanCollide = false
                        game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
                        game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (target1.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0.7))
                        wait(0.1)
                        local args = {
                            [1] = 0,
                            [2] = 0.1,
                            [3] = 1
                        }
                        game:GetService("ReplicatedStorage").Events.Punch:FireServer(unpack(args))
                    else
                        wait(0.1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-885,94,-1212)
                    end
                until not civilianfarm
            end)
        end
    end
end)

spawn(function()
    while true and wait() do
        if farmall then
            pcall(function()
                repeat
                    target1 = game:GetService("Workspace"):FindFirstChild("Civilian")
                    if target1 == nil then
                        target1 = game:GetService("Workspace"):FindFirstChild("Police")
                    end
                    if target1 == nil then
                        target1 = game:GetService("Workspace"):FindFirstChild("Thug")
                    end
                    if target1 ~= nil then
                        if target1.Humanoid.Health <= 0 then
                            target1:Destroy()
                        end
                        game.Players.LocalPlayer.Character.Head.CanCollide = false
                        game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
                        game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (target1.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0.7))
                        wait(0.1)
                        local args = {
                            [1] = 0,
                            [2] = 0.1,
                            [3] = 1
                        }
                        game:GetService("ReplicatedStorage").Events.Punch:FireServer(unpack(args))
                    else
                        wait(0.1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-885,94,-1212)
                    end
                until not farmall
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if statts then
            local args = {
                [1] = selectedstat
            }
            game:GetService("ReplicatedStorage").Events.UpgradeAbility:InvokeServer(unpack(args))
        end
    end
end)

function startKilling()
    if selectedplayer and killplayer then
        if selectedplayer ~= plr92 then
            if game.Players[selectedplayer].Character then
                if not game.Players[selectedplayer].Character:FindFirstChild('ForceField') then
                    pcall(function()
                        print'started'
                        game.Players.LocalPlayer.Character.ChildAdded:connect(function(v)
                            if v.Name == "ForceField" then
                                startKilling()
                                return
                            end
                        end)
                        pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        task.wait()
                        repeat
                            task.wait()
                            pcall(function()
                                if game.Players[selectedplayer].Character:FindFirstChild('HumanoidRootPart') then
                                    game.Players.LocalPlayer.Character.Head.CanCollide = false
                                    game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
                                    game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
                                    
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (game.Players[selectedplayer].Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0.7))
                                    local args = {
                                        [1] = 0,
                                        [2] = 0.1,
                                        [3] = 1
                                    }

                                    game:GetService("ReplicatedStorage").Events.Punch:FireServer(unpack(args))
                                else
                                    killplayerr = false
                                end
                            end)
                        until not killplayerr or not killplayer or not game.Players[selectedplayer].Character or game.Players[selectedplayer].Character.Humanoid.Health == 0 or not game.Players.LocalPlayer.Character or  game.Players.LocalPlayer.Character.Humanoid.Health == 0
                        print'killed'
                        task.wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
                        killplayerr = true
                        startKilling()
                    end)
                else
                    task.wait()
                    startKilling()
                end
            else
                print'not found, redoing'
                task.wait()
                startKilling()
            end
        end
    end
end

function spec()
    pcall(function()
        local plrtoview = selectedplayer
        if plrtoview then
            local ptv = findPlayer(plrtoview)
            if ptv and game.Workspace[ptv.Name] then
                spectate = true  
                local Camera = game.Workspace:FindFirstChildWhichIsA('Camera')

                repeat view(ptv.Name) until not spectate or not game.Workspace[ptv.Name]
                Camera.CameraSubject = player.Character:FindFirstChildWhichIsA('Humanoid')
            end
        end
    end)
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Library:Create{Name = "Zen X",Size = UDim2.fromOffset(600, 400),Theme = Library.Themes.Dark,Link = "https://github.com/laderite/zen-x/age-of-heroes"}
local plr92 = "wasntlooking"

local autofarm = GUI:Tab{Name = "Autofarm", Icon = "rbxassetid://6338081175"}
local autostats = GUI:Tab{Name = "Autostats", Icon = "rbxassetid://4899042089"}
local target = GUI:Tab{Name = "Target", Icon = "rbxassetid://6034996695"}
local misc = GUI:Tab{Icon = "rbxassetid://6031280882", Name = "Misc"}

autofarm:Toggle{Name = "Orb Farm", StartingState = false, Description = "Collects all orbs", Callback = function(v)
    orbfarm = v
end}

autofarm:Toggle{Name = "Hero Farm", StartingState = false, Description = "Kills thugs", Callback = function(v)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    wait()
    herofarm = v
end}

autofarm:Toggle{Name = "Villian Farm", StartingState = false, Description = "Kills police/civilians", Callback = function(v)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    wait()
    villianfarm = v
end}

autofarm:Toggle{Name = "Farm All", StartingState = false, Description = "Kills every NPC and farms orbs", Callback = function(v)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    wait()
    farmall = v
end}

target:Textbox({Name = "Target", Description = "Set a target", Callback = function(va)
    for i,v in pairs(game.Players:GetChildren()) do
        if (string.sub(string.lower(v.Name),1,string.len(va))) == string.lower(va) then
            selectedplayer = v.Name
            target:prompt{
                Title = "TARGET",
                Text = "Selected ".. selectedplayer .. " as the target"
            }
        end
    end
end,})

target:Toggle{Name = "Kill Player", StartingState = false, Description = "Kills specified player", Callback = function(v)
    killplayer = v
    if killplayer then
        local Camera = game.Workspace:FindFirstChildWhichIsA('Camera')
        Camera.CameraSubject = player.Character:FindFirstChildWhichIsA('Humanoid')
        spectate = false
        startKilling()
    end
end}

target:Toggle{Name = "Spectate", StartingState = false, Description = "Spectates specified player", Callback = function(v)
    if v then
        pcall(function() spec() end)
    else
        local Camera = game.Workspace:FindFirstChildWhichIsA('Camera')
        Camera.CameraSubject = player.Character:FindFirstChildWhichIsA('Humanoid')
        spectate = false
    end
end}

target:Button{Name = "Teleport", Description = "Teleport to player", Callback = function()
    if game.Players.LocalPlayer.Character.HumanoidRootPart and game.Players[selectedplayer].Character.HumanoidRootPart then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[selectedplayer].Character.HumanoidRootPart.CFrame
    end
end}

autostats:Toggle{Name = "Auto Stats", StartingState = false, Description = "Upgrades selected stat", Callback = function(v)
    statts = v
end}

autostats:Dropdown{Name = "Dropdown", StartingText = "Select stat..", Description = "Select a stat to upgrade", Items = {"vitality","healing","strength", "energy"}, Callback = function(v)
    selectedstat = v 
end}

misc:Toggle{Name = "Hide Username", StartingState = false, Description = "Destroys your username above your head", Callback = function(v)
    hideuser = v
end}

misc:Toggle{Name = "Noclip", StartingState = false, Description = "Walk through walls", Callback = function(v)
    noclip = v
end}

misc:Toggle{Name = "Auto TP", StartingState = false, Description = "Auto TP to a place", Callback = function(v)
    autotptoplace = v
end}

misc:Button{Name = "Invisible", Description = "Makes your character invisible to others", Callback = function()
    Invis()
end}

misc:Button{Name = "Rejoin", Description = "Rejoin the server", Callback = function()
    local ts = game:GetService("TeleportService")
    local p = game:GetService("Players").LocalPlayer
    ts:Teleport(game.PlaceId, p)
end}

misc:Button{Name = "Server hop", Description = "Teleport to another server", Callback = function()
    local ts = game:GetService("TeleportService")
    local p = game:GetService("Players").LocalPlayer
    ts:Teleport(game.PlaceId, p)
end}

GUI:Credit{Name = "laderite / 'j",Description = "Script Developer",V3rm = "hangtightmc",Discord = "'j#6066"}
GUI:Credit{Name = "DekuDimz",Description = "Stole his invis function",V3rm = "DekuDimz#3809",Discord = "DekuDimz#3809"}
autofarm:prompt{
    Title = "LOADED",
	Text = "Successfully loaded, Enjoy! Copy invite to discord server?",
    Buttons = {
        No = function()
            autofarm:prompt{
                Followup = true,
                Title = "PRIVACY",
                Text = "We log the first 3 letters of your username, exploit, and game name.",
            }
        end,
        sure = function()
            setclipboard("https://discord.gg/XQKrbH5MRd")
            autofarm:prompt{
                Followup = true,
                Title = "PRIVACY",
                Text = "We log the first 3 letters of your username, exploit, and game name.",
            }
        end
    }
}
loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/log.lua'))()
