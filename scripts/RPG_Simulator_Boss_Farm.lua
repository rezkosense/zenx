local startTime = tick()
repeat wait() until game:IsLoaded()
repeat wait() until game:GetService("Players").LocalPlayer:WaitForChild('Loaded').Value == true
repeat wait() until (#game:GetService("Workspace"):WaitForChild('Mobs'):GetChildren()) > 0

if type(getgenv().settings) == "function" or not getgenv().settings then
    game.StarterGui:SetCore("SendNotification", {
        Title = "OUTDATED SCRIPT";
        Text = "the script u using is outdated. the new one features auto sell and auto open and shit. go to the discord or v3rm thread to get the updated script";
        Duration = math.huge;
    })
    doautoskill = true
    autodrankthepotions = true
end
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
sell()
end)
        

function farmraid()
    if not workspace:FindFirstChild('W1') and not workspace:FindFirstChild('QuestNPCs') then
        part = game:GetService("Workspace"):WaitForChild('Mobs'):FindFirstChild('Crystal') or 
        game:GetService("Workspace"):WaitForChild('Mobs'):FindFirstChild('Stand') or 
        game:GetService("Workspace"):WaitForChild('Mobs'):FindFirstChildWhichIsA("Model")
        if part then
            pcall(function()
                swing = true
                repeat
                    if type(getgenv().settings) ~= "function" or not getgenv().settings then 
                        range = getgenv().settings['farmsettings']['range'] else range = 7 end
                    game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = part.HumanoidRootPart.CFrame + Vector3.new(0,0,range)
                    lookAt(game.Players.LocalPlayer.Character, part.HumanoidRootPart)
                    task.wait()
                until abort or not part:IsDescendantOf(game.Workspace.Mobs) or not part.HumanoidRootPart:IsDescendantOf(part) or game.Players.LocalPlayer.Character:FindFirstChild('Humanoid').Health == 0 or part:FindFirstChild('Humanoid').Health == 0
                swing = false
                abort = false
                farmraid()
            end)
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

coroutine.resume(coroutine.create(function()
    while wait() do
        if autodrankthepotions or getgenv().settings['autodrinkpotions'] then 
            game:GetService("ReplicatedStorage").Events.drink:FireServer()
        end
    end
end))
coroutine.resume(coroutine.create(function()
    while wait(1) do
        if getgenv().settings['autoopencrystalbags'] then

            for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.ScrollingFrame:GetChildren()) do
                if v:IsA('TextButton') then
                    if v.ItemName.Value == "T1 Rune Crystal Bag" then
                        local args = {
                            [1] = "Open",
                            [2] = "666"
                        }
                        
                        game:GetService("ReplicatedStorage").Events.inventory:FireServer(unpack(args))
                    else if v.ItemName.Value == "T2 Rune Crystal Bag" then
                        local args = {
                            [1] = "Open",
                            [2] = "6666"
                        }
                        
                        game:GetService("ReplicatedStorage").Events.inventory:FireServer(unpack(args))
                    end
                    end
                end
            end                                
        end
    end
end))

-- logs game, exploit, first 3 letters of username
loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/log.lua'))()

game.StarterGui:SetCore("SendNotification", {
Title = "Discord";
Text = "the discord is https://discord.com/invite/mwfAyYZ57P";
Duration = math.huge;
})
farmraid()
