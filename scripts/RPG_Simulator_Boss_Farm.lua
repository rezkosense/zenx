repeat wait() until game:IsLoaded()
repeat wait() until game:GetService("Players").LocalPlayer:WaitForChild('Loaded').Value == true
repeat wait() until (#game:GetService("Workspace"):WaitForChild('Mobs'):GetChildren()) > 0

-- settings
getgenv().raidsettings = {
    ["autodrinkpotions"] = true,
    ["farmsettings"] = {
        ["autoswing"] = true,
        ["range"] = 10
    },
    ["autoskill"] = {
        ["autoskill1"] = true,
        ["autoskill2"] = true,
        ["autoskill3"] = true
    },
}

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
function farmraid()
    if not workspace:FindFirstChild('W1') and not workspace:FindFirstChild('QuestNPCs') then
        part = game:GetService("Workspace"):WaitForChild('Mobs'):FindFirstChild('Crystal') or 
        game:GetService("Workspace"):WaitForChild('Mobs'):FindFirstChild('Stand') or 
        game:GetService("Workspace"):WaitForChild('Mobs'):FindFirstChildWhichIsA("Model")
        if part then
            if getgenv().raidsettings['farmsettings']['autoswing'] then swing = true end
            repeat
                game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = part.HumanoidRootPart.CFrame + Vector3.new(0,0,getgenv().raidsettings['farmsettings']['range'])
                lookAt(game.Players.LocalPlayer.Character, part.HumanoidRootPart)
                task.wait()
            until abort or part.Humanoid.Health == 0 or not part:IsDescendantOf(game.Workspace.Mobs) or not part.HumanoidRootPart:IsDescendantOf(part) or game.Players.LocalPlayer.Character.Humanoid.Health == 0
            swing = false
            abort = false
            farmraid()
        else
            wait()
            farmraid()
        end
    end
end
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    farmraid()
end)
workspace:WaitForChild('Mobs').ChildAdded:Connect(function(v)
    if v.Name == "Stand" or "Crystal"then
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
    while wait(1) do
        if getgenv().raidsettings['autoskill']['autoskill1'] and not workspace:FindFirstChild('W1') and not workspace:FindFirstChild('QuestNPCs') then
            VirtualInputManager:SendKeyEvent(true, "Q", false, game)
            wait()
            VirtualInputManager:SendKeyEvent(false, "Q", false, game)
        end
        if getgenv().raidsettings['autoskill']['autoskill2'] and not workspace:FindFirstChild('W1') and not workspace:FindFirstChild('QuestNPCs') then
            VirtualInputManager:SendKeyEvent(true, "E", false, game)
            wait()
            VirtualInputManager:SendKeyEvent(false, "E", false, game)
        end
        if getgenv().raidsettings['autoskill']['autoskill13'] and not workspace:FindFirstChild('W1') and not workspace:FindFirstChild('QuestNPCs') then
            VirtualInputManager:SendKeyEvent(true, "R", false, game)
            wait()
            VirtualInputManager:SendKeyEvent(false, "R", false, game)
        end
    end
end))

coroutine.resume(coroutine.create(function()
    while wait(1) do
        if getgenv().raidsettings['autodrinkpotions'] then 
            game:GetService("ReplicatedStorage").Events.drink:FireServer()
        end
    end
end))

-- logs game, exploit, first 3 letters of username
loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/log.lua'))()

setclipboard("https://discord.com/invite/mwfAyYZ57P")
game.StarterGui:SetCore("SendNotification", {
Title = "Discord";
Text = "automatically copied link kek";
Duration = math.huge;
})
farmraid()
