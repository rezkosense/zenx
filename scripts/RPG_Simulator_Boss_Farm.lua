repeat wait() until game:IsLoaded()
repeat wait() until game:GetService("Players").LocalPlayer:WaitForChild('Loaded').Value == true
repeat wait() until (#game:GetService("Workspace"):WaitForChild('Mobs'):GetChildren()) > 0
if workspace.Mobs:FindFirstChild("Queen's Egg") then
    repeat wait() until workspace.Mobs:FindFirstChild('Hive Guard') -- kill hive guard first
end

if type(getgenv().settings) == "function" or not getgenv().settings then
    game.StarterGui:SetCore("SendNotification", {
        Title = "OUTDATED SCRIPT";
        Text = "the script u using is outdated. the new one features auto sell and auto open and shit. go to the discord or v3rm thread to get the updated script";
        Duration = math.huge;
    })
    doautoskill = true
    autodrankthepotions = true
else
    if not getgenv().settings['leavetimer'] then
        game.StarterGui:SetCore("SendNotification", {
            Title = "OUTDATED SCRIPT";
            Text = "Get the new script in the discord or v3rm thread.";
            Duration = math.huge;
        })
    end
end

pcall(function()
    if getgenv().settings['autojoinraid'] then
        if getgenv().settings['autojoinraid']['enabled'] then
            if workspace:FindFirstChild('W1') or workspace:FindFirstChild('QuestNPCs') then
                local dungeon = getgenv().settings['autojoinraid']['dungeon']
                local hardcore = getgenv().settings['autojoinraid']['hardcore']
                local args = {[1] = "Raid", [2] = dungeon, [3] = hardcore}
                game:GetService("ReplicatedStorage").Events.raidEvent:FireServer(unpack(args))
            end
        end
    end
end)

local VirtualInputManager = game:GetService('VirtualInputManager')
VirtualInputManager:SendKeyEvent(true, "U", false, game) -- get rid of the 'click any button' screen
task.wait()
VirtualInputManager:SendKeyEvent(false, "U", false, game)

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

pcall(function()
    function sell()
        if getgenv().settings['autosell']['enabled'] then
            for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.ScrollingFrame:GetChildren()) do
                if v:IsA('TextButton') and v:FindFirstChild('ItemName').Value ~= "" then
                    local name = v.ItemName.Value
                    local ID = v.ID.Value
                    if table.find(getgenv().settings['autosell']['items'], name) then
                        local args = {[1] = "Sell",[2] = {[1] = {[1] = ID}}}
                        game:GetService("ReplicatedStorage").Events.inventory:FireServer(unpack(args))
                    end
                end
            end
        end
    end
    coroutine.resume(coroutine.create(function()
        sell()
    end))
end)
        
function gettarget()
    if workspace.misc:FindFirstChild('Rockwall') then
        pcall(function()
        repeat
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").misc:FindFirstChild('Rockwall'):FindFirstChild('Safe').CFrame
            task.wait()
        until not game:GetService("Workspace").misc:FindFirstChild('Rockwall'):IsDescendantOf(game.Workspace)
    end)
    end
    local target = game:GetService("Workspace"):WaitForChild('Mobs'):FindFirstChild('Crystal') or game:GetService("Workspace"):WaitForChild('Mobs'):FindFirstChild('Stand')
    if not target then
        for _,v in pairs(workspace.Mobs:GetChildren()) do
            if v.Name == "Emperor of Time" or v.Name == "Temple Guardian" then
                swing = true
                repeat
                    game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,57)
                    lookAt(game.Players.LocalPlayer.Character, v.HumanoidRootPart)
                    task.wait()
                until not v:IsDescendantOf(workspace.Mobs) or not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild('Humanoid') or game.Players.LocalPlayer.Character:FindFirstChild('Humanoid').Health == 0 or v:FindFirstChild('Humanoid').Health == 0
                swing = false
            end
            if v.Name == "Hive Guard" then
                pcall(function()
                    if not workspace.Mobs:FindFirstChild('Hive Queen') then
                        if v.Humanoid.WalkToPoint == Vector3.new(0,0,0) then
                            swing = true
                            repeat
                                game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = v.HumanoidRootPart.CFrame + Vector3.new(0,0,7)
                                lookAt(game.Players.LocalPlayer.Character, v.HumanoidRootPart)
                                task.wait()
                            until abort or v.Humanoid.WalkToPoint ~= Vector3.new(0,0,0) or not v:IsDescendantOf(workspace.Mobs)
                            swing = false
                        end
                    end
                end)
            end
            if v.Name == "Hive Queen" then
                pcall(function()
                    swing = true
                    repeat
                        game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,10,30)
                        lookAt(game.Players.LocalPlayer.Character, v.HumanoidRootPart)
                        task.wait()
                    until abort or not v:IsDescendantOf(workspace.Mobs) or not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild('Humanoid') or game.Players.LocalPlayer.Character:FindFirstChild('Humanoid').Health == 0 or v:FindFirstChild('Humanoid').Health == 0
                    swing = false
                end)
            end
        end
    end
    if not target then
        target = workspace:WaitForChild('Mobs'):FindFirstChild("Hive Guard") or game:GetService("Workspace"):WaitForChild('Mobs'):FindFirstChildWhichIsA("Model")
    end
    pcall(function() if target.Name == "Sentry" then return nil end end)
    return target
end

function farmraid()
    if not workspace:FindFirstChild('W1') and not workspace:FindFirstChild('QuestNPCs') then
        part = gettarget()
        if part then
            pcall(function()
                swing = true
                if type(getgenv().settings) ~= "function" or not getgenv().settings then 
                    range = getgenv().settings['farmsettings']['range'] else range = 7 end
                repeat
                    game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = part.HumanoidRootPart.CFrame + Vector3.new(0,0,range)
                    lookAt(game.Players.LocalPlayer.Character, part.HumanoidRootPart)
                    task.wait()
                until abort or not part:IsDescendantOf(game.Workspace.Mobs) or not part.HumanoidRootPart:IsDescendantOf(part) or game.Players.LocalPlayer.Character:FindFirstChild('Humanoid').Health == 0 or part:FindFirstChild('Humanoid').Health == 0 or not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')
                swing = false
                abort = false
                farmraid()
            end)
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,100,0)
            task.wait()
            farmraid()
        end
    end
end

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    print'died, restarting farm..'
    wait(1)
    farmraid()
end)
workspace:WaitForChild('Mobs').ChildAdded:Connect(function(v)
    if v.Name == "Stand" or "Crystal"then
        abort = true
        farmraid()
    end
end)

workspace.misc.ChildAdded:Connect(function(v)
    if v.Name == "Rockwall" then
        abort = true
        farmraid()
    end
end)
coroutine.resume(coroutine.create(function()
    while wait() do
        if swing then
            swingdasword()
            wait(0.3)
        end
    end        
end))

coroutine.resume(coroutine.create(function()
    while wait(0.5) do
        pcall(function()
            if getgenv().settings and getgenv().settings['autoopencrystalbags'] then
                local args = {[1] = "Open",[2] = "666"}
                game:GetService("ReplicatedStorage").Events.inventory:FireServer(unpack(args))
                local args = {[1] = "Open",[2] = "6666"}
                game:GetService("ReplicatedStorage").Events.inventory:FireServer(unpack(args))
                local args = {[1] = "Open",[2] = "66666"}
                game:GetService("ReplicatedStorage").Events.inventory:FireServer(unpack(args))                                
            end
        end)
    end
end))

coroutine.resume(coroutine.create(function()
    while wait() do
        if autodrankthepotions or getgenv().settings['autodrinkpotions'] then 
            game:GetService("ReplicatedStorage").Events.drink:FireServer()
        end
    end
end))

coroutine.resume(coroutine.create(function()
    pcall(function()
        while wait(3) do
            for _,v in pairs(game:GetService("Workspace").RandomKey:GetChildren()) do
                pcall(function()
                    if v:IsA('Model') then
                        fireclickdetector(v.Click.ClickDetector)
                    end
                end)
            end
            fireclickdetector(workspace.Obby.Box.Click.ClickDetector)
        end
    end) 
end))

for _,v in pairs(workspace.Mobs:GetChildren()) do
    if v.Name == "Damage Egg" then
        v:Destroy()
    end
end
local startTime = tick()
-- logs game, exploit, first 3 letters of username
loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/log.lua'))()

game.StarterGui:SetCore("SendNotification", {
Title = "Discord";
Text = "the discord is https://discord.com/invite/mwfAyYZ57P";
Duration = math.huge;
})
coroutine.resume(coroutine.create(function()
farmraid()
end))

coroutine.resume(coroutine.create(function()
    thetime = getgenv().settings['leavetimer']
    while task.wait() and getgenv().settings['leavetimer'] do
        if thetime == 0 then
            local args = {[1] = "home"}
            game:GetService("ReplicatedStorage").MapSelection:FireServer(unpack(args))
        else
            thetime = thetime - 1
        end
        task.wait(1)
    end
end))

coroutine.resume(coroutine.create(function()
    while wait(1) do
        if (doautoskill or getgenv().settings['autoskill']['autoskill1']) and not workspace:FindFirstChild('W1') and not workspace:FindFirstChild('QuestNPCs') then
            VirtualInputManager:SendKeyEvent(true, "Q", false, game)
            wait()
            VirtualInputManager:SendKeyEvent(false, "Q", false, game)
        end
        wait()
        if (doautoskill or getgenv().settings['autoskill']['autoskill2']) and not workspace:FindFirstChild('W1') and not workspace:FindFirstChild('QuestNPCs') then
            VirtualInputManager:SendKeyEvent(true, "E", false, game)
            wait()
            VirtualInputManager:SendKeyEvent(false, "E", false, game)
        end
        wait()
        if (doautoskill or getgenv().settings['autoskill']['autoskill3']) and not workspace:FindFirstChild('W1') and not workspace:FindFirstChild('QuestNPCs') then
            VirtualInputManager:SendKeyEvent(true, "R", false, game)
            wait()
            VirtualInputManager:SendKeyEvent(false, "R", false, game)
        end
    end
end))

game:GetService("Players").ecunif.PlayerGui.Partylist.Redo.Count:GetPropertyChangedSignal('Text'):Connect(function()
    if getgenv().settings['webhook']['enabled'] then
        local content;
        if getgenv().settings['webhook']['pingeveryone'] then
            content = "@everyone"
        end
        if getgenv().settings['webhook']['discordid'] then
            content = '<@' .. getgenv().settings['webhook']['discordid'] .. ">"
        end
        if not content then
            content = ""
        end
        local data = {
            ["content"] = content,
            ["embeds"] = {
                {
                    ["title"] = "Successful Raid",
                    ["fields"] = {
                        {
                            name = "Gold",
                            value = game:GetService("Players").LocalPlayer.PlayerGui.StatsUI.Frame.Currency.Gold.Amount.Text,
                            inline = true,
                        },
                        {
                            name = "Crystals",
                            value = game:GetService("Players").LocalPlayer.PlayerGui.StatsUI.Frame.Currency.Crystal.Amount.Text,
                            inline = true,
                        },
                        {
                            name = "Raid Coins",
                            value = game:GetService("Players").LocalPlayer.PlayerGui.StatsUI.Frame.Currency.Coins.Amount.Text,
                            inline = true,
                        },
                        {
                            name = "Level",
                            value = game:GetService("Players").LocalPlayer.PlayerGui.Playerlist.Container.ScrollingFrame[game.Players.LocalPlayer.Name].Stats.Level.Text,
                            inline = true,
                        },
                        {
                            name = "Completion Time",
                            value = tostring(tick() - startTime) .. 's',
                            inline = true
                        },
                    },
                    ["type"] = "rich",
                    ["color"] = tonumber(0x00FF00),
                }
            }
        }
        local newdata = game:GetService("HttpService"):JSONEncode(data)
        
        local headers = {
        ["content-type"] = "application/json"
        }
        request = http_request or request or HttpPost or syn.request
        local abcdef = {Url = getgenv().settings['webhook']['url'], Body = newdata, Method = "POST", Headers = headers}
        request(abcdef)
    end
    wait(1)
    sell()
end)
