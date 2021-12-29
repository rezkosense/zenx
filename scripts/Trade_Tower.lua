-- hello zen members and trade tower mods and devs dont patch this pls and dont snitch :)
-- and if u zen member use for learning or whatever
-- if u wanna use this code for ur own tt script then credit me at least ok
-- and its like a lot of bad code because i developed this script ever since i started making and learning about lua so if it works then it was never touched 
-- and dont make fun of me

repeat wait() until game:IsLoaded()
-- security measure

-- if gethiddenproperty(workspace, "DataModelPlaceVersion") ~= 179) ~+ (ignore for now)


for _,v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "ScreenGui" then
        if v:FindFirstChild('Frame') then 
            if v.Frame:FindFirstChild('topbar') then
                v:Destroy()
            end
        end
    end
end
-- creds to fireztron for jackpot and function and shit 
FTS = "ZenXLibv2 - Trade Tower"
ver = "1.0.1a"
loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/scripts/main/loader.lua'))()
game.CoreGui:WaitForChild('loader'):WaitForChild('main'):WaitForChild('text holder'):WaitForChild('status').Text = "Welcome!"
game.CoreGui:WaitForChild('loader'):WaitForChild('main'):WaitForChild('bars'):WaitForChild('green').Size = UDim2.new(0,0,0,0)
local function changeStatus(status, size)
    statusText = game.CoreGui:WaitForChild('loader'):WaitForChild('main'):WaitForChild('text holder'):WaitForChild('status')
    bar =  game.CoreGui:WaitForChild('loader'):WaitForChild('main'):WaitForChild('bars'):WaitForChild('green')
    bar.Size = UDim2.new(0, size, 0, 15)
    statusText.Text = status
end

-- Loading services
changeStatus("Loading services",51)
local MoneyLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/ZaigoYT/wfwefw/main/sad'))()
local NSumClosestLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/ZaigoYT/wfwefw/main/dsag'))()
local ZenLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/scripts/main/library.lua"))()
getgenv().selfdestruct = false
Players = game:GetService('Players')
player = game.Players.LocalPlayer
local LocalPlayer = Players.LocalPlayer
IsMod = false
local InfoModule = require(game.ReplicatedStorage.Modules.Info)
local MainFunctions = require(game:GetService("Players").LocalPlayer.PlayerGui.Gui.GuiModules.MainFunctions)
local inv = require(game:GetService("Players").LocalPlayer.PlayerGui.Gui.GuiModules.Inventory)
local AuctionFunctions = require(game:GetService("Players").LocalPlayer.PlayerGui.AuctionBoard.AuctionFunctions)
local auctionBoard = LocalPlayer.PlayerGui.AuctionBoard
local auctionCountdown = auctionBoard.Status
local auctionHeader = auctionBoard.Header
local auctionBidders = auctionBoard.Bidders
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local List = game.Players.LocalPlayer.PlayerGui.Gui.Frames.Inventory.Body.Holder
local maxPrice = 50000
local jackpotTier = 1
local minJackpotChance = 95
local waitTime = .9
local quicksearch = false
local minAutomarketSell = 50000
local maxAutomarketSell = 9e9
local percentToMarketSell = 104/100
local maxPercentOfValueToBid = 70/100
local autoAuctionWaitTime = .9

local win = ZenLib:New({
    Name = "Trade Tower - Zen X",
    FolderToSave = FTS
})

local commands = {}       
local prefix = "/"
commands.e = function(arguments)
    local CMD = arguments[1]
    
    if CMD == 'rejoin' or CMD == 'rj' then
        Players.LocalPlayer:Kick("Rejoining")
        wait()
        game:GetService('TeleportService'):Teleport(game.PlaceId, Players.LocalPlayer)
    end
    if CMD == 'serverhop' or CMD == 'shop' then
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
    if CMD == 'korblox' then
        local Leg = 'Right' 
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        if char.Humanoid.RigType == Enum.HumanoidRigType.R15 then
            char[Leg..'UpperLeg']:Destroy()
            char[Leg..'LowerLeg']:Destroy()
            char[Leg..'Foot']:Destroy()
            else
                char[Leg..' Leg']:Destroy()
        end
    end
    if CMD == 'zoom' or CMD == 'infzoom' then
        player.CameraMaxZoomDistance = math.huge
    end
    if CMD == 'fov' then
        if game.Workspace:FindFirstChildWhichIsA('Camera') then
            game.Workspace:FindFirstChildWhichIsA('Camera').FieldOfView = tonumber(arguments[2])
        end
    end
    if CMD == 're' then
        player.Character.Humanoid:Destroy()
        wait(0.1)
        for i, v in pairs(player.Character:GetChildren()) do
            v:Destroy()
        end
    end
    if CMD == 'sit' then
        game.Players.LocalPlayer.Character.Humanoid.Sit = true
    end
    if CMD == 'faceless' or CMD == 'noface' then
        player.Character.Head.face:Destroy()
    end
    if CMD == 'remotespy' then
        loadstring(game:HttpGet("https://pastebin.com/raw/BDhSQqUU", true))()
    end
end
player.Chatted:Connect(function(message,recipient)
message = string.lower(message)
local splitString = message:split(" ")
local slashCommand = splitString[1]
local cmd = slashCommand:split(prefix)
local cmdName = cmd[2]
if commands[cmdName] then
    local arguments = {}
    for i = 2, #splitString, 1 do
    table.insert(arguments,splitString[i])
    end
commands[cmdName](arguments)
end
end)
-- Loading config
changeStatus("Loading config",179)
defaultConfig = {
    autoclick = false;
    autoupgrade = false;
    casetime = false;
    autocase = false;
    selectedcase = "";
    autosell = false;
    pureraponly = false;
    maxPrice = 50000;
    autopickup = false;
    spamafk = false;
    autokick = false;
    spamafkk = false;
    autojackpot = false;
    quicksearch = false;
    jackpottier = "";
    minjackpotchance = 95;
    autobid = false;
    maxPercentOfValueToBid = 70;
    crash = false;
    crashamount = nil;
    payout = nil;
    cf = false;
    cfamount = nil;
    cfside = nil;
    tixstock = false;
    buybelow = nil;
    sellabove = nil;
    autotixexchange = false;
    exchangeamount = nil;
    webhookurl = "";
    sendwebhooks = false;
    itemnotifyadded = false;
    itemnotifyremove = false;
    stattracker = false;
    serverhopwhenamodjoins = false;
    exchangeat = nil;
    discordid = "";
    version = "1.0.0a"
}
if not isfile(FTS .. "/configs/config.json") then
    writefile(FTS .. "/configs/config.json",game:GetService("HttpService"):JSONEncode(defaultConfig))
end
Settings = game:GetService("HttpService"):JSONDecode(readfile(FTS .. "/configs/config.json"))
if Settings.version ~= ver then
    print'wrong version, redoing config file'
    delfile(FTS .. "/configs/config.json")
    writefile(FTS .. "/configs/config.json",game:GetService("HttpService"):JSONEncode(defaultConfig))
end
function save()
    writefile(FTS .. "/configs/config.json",game:GetService("HttpService"):JSONEncode(Settings))
end

-- other shit
for _,v in pairs(defaultConfig) do
    getgenv()[_] = v
end

-- Loading functions
changeStatus("Loading functions",103)
local function removeAllFromMarketPlace()
    for _, frame in pairs(LocalPlayer.PlayerGui.Gui.Frames.Market.SubMarket.Holder.List:GetChildren()) do
        if frame:IsA("Frame") and frame.Name == LocalPlayer.Name then
            local itemName = frame:WaitForChild("ItemName").Text
            spawn(function()
                local args = {
                    [1] = "Marketplace",
                    [2] = itemName
                }

                game:GetService("ReplicatedStorage").Events.InventoryActions:InvokeServer(unpack(args))
            end)
        end
    end
    marketItemsLPInfo = {}
end

local function sellItem(itemName, amount)
    spawn(function()
	pcall(function()
       	    List[itemName]:Destroy()
	end)
        local args = {
            [1] = "QuickSell",
            [2] = itemName,
            [3] = amount
        }
        game:GetService("ReplicatedStorage").Events.InventoryActions:InvokeServer(unpack(args))
    end)
end

local function marketSellItem(itemName, amount, value)
    spawn(function()
        local args = {
            [1] = "Marketplace",
            [2] = itemName,
            [3] = value,
            [4] = amount
        }

        game:GetService("ReplicatedStorage").Events.InventoryActions:InvokeServer(unpack(args))
    end)
end


local function getItemPrice(name, rolimonsVal)
    if rolimonsVal == "rolimonsValue" then
        return InfoModule:ReturnItemFromModule(name).rolimonsValue
    elseif rolimonsVal == "recentAveragePrice" then
        return InfoModule:ReturnItemFromModule(name).recentAveragePrice
    end
end


function isValidItem(name, maxprice)
    local RAP = getItemPrice(name, "recentAveragePrice")
    local value = getItemPrice(name, "rolimonsValue")
    if getgenv().automarketplace and (value >= minAutomarketSell and value <= maxAutomarketSell) then
        return true, "marketsell", value * percentToMarketSell
    elseif (getgenv().autosell and RAP <= maxPrice) and (not getgenv().pureraponly or RAP == value) then
        return true, "sell"
    end
    return false
end

function getLowestItem(name, maxprice)
    local RAP = getItemPrice(name, "recentAveragePrice")
    local value = getItemPrice(name, "rolimonsValue")
    if getgenv().autotraderaponly then
        if (getgenv().autotrade and RAP <= maxprice) then
            return true
        end
    elseif getgenv().autotradevalueonly then
        if (getgenv().autotrade and value <= maxprice) then
            return true
        end
    end
    return false
end

function isUnder50K(name)
    local RAP = getItemPrice(name, "recentAveragePrice")
    if (RAP <= 50000) then
        return true
    end
    return false
end

local items = {}
function updateCurrentItems()
    items = {}
    for i,v in pairs(List:GetChildren()) do
        if v:IsA("Frame") then
            if not items[v.Name] then
                items[v.Name] = 1
            else
                items[v.Name] = items[v.Name] + 1
            end
        end
    end
end

updateCurrentItems()

function sellCurrentItems()
    updateCurrentItems()
    for itemName, amount in pairs(items) do
        local valid, sellType, value = isValidItem(itemName, maxPrice)
        if valid then
            if sellType == "sell" then
                sellItem(itemName, amount)
            elseif sellType == "marketsell" then
                marketSellItem(itemName, amount, value)
            end
        end
    end
end


List.ChildAdded:Connect(function(item)
    if item:IsA("Frame") then
        local valid, sellType, value = isValidItem(item.Name, maxPrice)
        if valid then
            if sellType == "sell" then
                sellItem(item.Name, amount)
            elseif sellType == "marketsell" then
                marketSellItem(item.Name, amount, value)
            end
        end
    end
end)

local function convertRobux(num)
    local shortValue = num
    local longValue = MoneyLib.ShortToLong(shortValue)
    return tonumber(longValue) or tonumber(shortValue) 
end


local Countdown = player.PlayerGui.Gui.Frames.Games.Jackpot.Timer.Countdown
local jackpotLPInfo = {
    [1] = {
        ["total"] = 0,
        ["itemsAlreadyIn"] = 0
    },
    [2] = {
        ["total"] = 0,
        ["itemsAlreadyIn"] = 0
    },
    [3] = {
        ["total"] = 0,
        ["itemsAlreadyIn"] = 0
    }
}

local function resetJackpotLPInfo()
    for _, tier in ipairs(jackpotLPInfo) do
        for index, value in pairs(tier) do
            tier[index] = 0
        end
    end
end

Countdown:GetPropertyChangedSignal("Text"):Connect(function()
    local countdownText = Countdown.Text
    local resetted = (string.match(countdownText:lower(), "win") == "win" or string.match(countdownText:lower(), "won") == "won")
    if resetted then
        resetJackpotLPInfo()
    end
end)

ReplicatedStorage:WaitForChild("Events"):WaitForChild("DataSend").OnClientEvent:Connect(function(signature, name, value, tier)
    if signature == "JackpotItem" and name == LocalPlayer.Name then
        jackpotLPInfo[tier]["total"] = jackpotLPInfo[tier]["total"]+value 
        jackpotLPInfo[tier]["itemsAlreadyIn"] = jackpotLPInfo[tier]["itemsAlreadyIn"]+1
    end
end)

local function getSortedItems()
    local items = {}
    local inventory = inv.PlayersLocalInv
    for itemName, itemInfo in pairs(inv.PlayersLocalInv) do
        for amount = 1, itemInfo.amount do
            items[#items + 1] = {
                ["rolimonsValue"] = (getItemPrice(itemName, "rolimonsValue")),
                ["name"] = itemName
            }
        end
    end
    return MainFunctions:ReturnSortedDictionary(items, "rolimonsValue", true, true)
end

local function getTotalJackpot()
    local total = 0
    for _, plrInfo in pairs(LocalPlayer.PlayerGui.Gui.Frames.Games.Jackpot.Pools[jackpotTier].List:GetChildren()) do
        if plrInfo.Name ~= "UIGridLayout" then
            for _, RAP in pairs(plrInfo:GetChildren()) do
                if RAP.Name == "RAP" then
                    local num = string.gsub(RAP.text, "%$", "")
                    total = total + convertRobux(num)
                end
            end 
        end
    end
    return total
end

local function getTotalAmountAbleToPutIn(sortedItems, n, maxJackpotPrice)
    local sol
    if getgenv().quicksearch then
        sol = NSumClosestLib.QuickNSumClosest(sortedItems, n, maxJackpotPrice)
    else
        sol = NSumClosestLib.NSumClosest(sortedItems, n, maxJackpotPrice)
    end
    if sol.Success then
        local totalInv = sol.Result
        local itemsForJackpot = sol.MadeWith
        return totalInv, itemsForJackpot
    else
        return false
    end
end

local function getMaxAmountAbleToPutIn(sortedItems, n, maxJackpotPrice)
    local closestSum = math.huge
    local targetItemsForJackpot

    repeat
        local totalInv, itemsForJackpot = getTotalAmountAbleToPutIn(sortedItems, n, maxJackpotPrice)
        if totalInv then
            local diff = math.abs(maxJackpotPrice - totalInv)
            if diff <= math.abs(closestSum - totalInv) then
                closestSum = totalInv
                targetItemsForJackpot = itemsForJackpot
            end
        end
        n = n - 1
    until
        n < 1
    return closestSum + jackpotLPInfo[jackpotTier]["total"], targetItemsForJackpot
end

Countdown:GetPropertyChangedSignal("Text"):Connect(function()
    local countdownText = Countdown.Text
    local timeLeft = string.match(countdownText:lower(), "win") ~= "win" and string.gsub(countdownText, "%D", "")
    if getgenv().autojackpot and timeLeft == "1" then
        wait(waitTime)
        local tierMax = (jackpotTier == 1 and 250000) or (jackpotTier == 2 and 5000000) or (jackpotTier == 3 and math.huge)
        local sortedItems = getSortedItems()
        local itemsAlreadyIn = jackpotLPInfo[jackpotTier]["itemsAlreadyIn"]
        local LPTotalAlreadyIn = jackpotLPInfo[jackpotTier]["total"]
        local n = (#sortedItems + itemsAlreadyIn >= 10 and 10 - itemsAlreadyIn) or (#sortedItems + itemsAlreadyIn < 10 and #sortedItems)
        local totalInv, itemsForJackpot = getMaxAmountAbleToPutIn(sortedItems, n, tierMax - LPTotalAlreadyIn)
        local totalJackpot = getTotalJackpot()
        if totalInv and totalInv / (totalJackpot + totalInv) >= (minJackpotChance / 100) and totalJackpot - LPTotalAlreadyIn > 0 then
            for _, itemInfo in pairs(itemsForJackpot) do
                local args = {
                    [1] = "Jackpot",
                    [2] = itemInfo.name,
                    [3] = 1, 
                    [4] = jackpotTier
                }
                spawn(function()
                    game:GetService("ReplicatedStorage").Events.GamesActions:InvokeServer(unpack(args))
                    pcall(function()
                        LocalPlayer.PlayerGui.Gui.Frames.Games.Jackpot.LocalInventory.Holder[itemInfo.name]:Destroy()
                    end)
                end)
            end
            spawn(function()
                ZenLib:Notification("JACKPOT", "Attempted to join");
            end)
        elseif not totalInv then
            spawn(function()
                ZenLib:Notification("JACKPOT", "Failed to join! you need items");
            end)
        elseif totalJackpot <= 0 then
            spawn(function()
                ZenLib:Notification("JACKPOT", "Failed to join, no participants");
            end)
        elseif totalInv / (totalJackpot + totalInv) < (minJackpotChance / 100) then
            spawn(function()
                ZenLib:Notification("JACKPOT", "% not high enough: " .. totalInv / (totalJackpot + totalInv * 100 .. "% | " .. minJackpotChance .. "%"));
            end)
        elseif totalJackpot - LPTotalAlreadyIn <= 0 then
            spawn(function()
                ZenLib:Notification("JACKPOT", "You were the only one participating! Did not join.");
            end)
        end
    end
end)

local function bidAuction(num)
    local args = {
        [1] = "AuctionBid",
        [2] = num
    }
    game:GetService("ReplicatedStorage").Events.GamesActions:InvokeServer(unpack(args))
end

local function getTopAuctionBid()
    local last
    for playerName, bid in pairs(AuctionFunctions.BidTable) do
        last = bid
        if playerName == LocalPlayer.Name then
            last = nil
        end
    end
    return bid
end

auctionCountdown:GetPropertyChangedSignal("Text"):Connect(function()
    local countdownText = auctionCountdown.Text
    local timeLeft = string.match(countdownText:lower(), "win") ~= "win" and string.gsub(countdownText, "%D", "")
    if getgenv().autobidtoauction and timeLeft == "1" then
        wait(autoAuctionWaitTime)
        local itemName = string.match(auctionHeader.Text, "%(.*%)"):gsub("[%(%)]","")
        local value = getItemPrice(itemName, "rolimonsValue")
        local topBid = getTopAuctionBid()
        if not topBid then
            bidAuction(value * .6)
        elseif topBid/value <= maxPercentOfValueToBid then
            bidAuction(topBid + 1e-307)
        end
    end
end)

local function setCrash(num)
    local args = {
        [1] = "Crash",
        [2] = num
    }
    
    game:GetService("ReplicatedStorage").Events.GamesActions:InvokeServer(unpack(args))
end

crashcount = game.Players.LocalPlayer.PlayerGui.Gui.Frames.Games.Crash.Countdown

crashcount:GetPropertyChangedSignal("Text"):Connect(function()
    local crashCountdown = game.Players.LocalPlayer.PlayerGui.Gui.Frames.Games.Crash.Countdown.Text
    if getgenv().crash then
        if crashCountdown == ("x" .. payout) then
            setCrash(crashamount)
        else 
            if crashCountdown == "Game beginning in: 1" then
                setCrash(crashamount)
            end
        end
    end
end)

coroutine.resume(coroutine.create(function(v)
    while wait(0.2) do -- DELAY NEEDED TO PREVENT KICK // will make it click gui button to click as fast as possible w/o getting kicked
        if getgenv().autoclick then
            game:GetService("ReplicatedStorage").Events.ClientClick:FireServer()
        end
    end
end))

coroutine.resume(coroutine.create(function()
    while wait() do
        if getgenv().autoupgradetradebucks then
            local args = {[1] = "Upgrade",[2] = "Clicks"}
            game:GetService("ReplicatedStorage").Events.StoreActions:InvokeServer(unpack(args))
        end
    end
end))

coroutine.resume(coroutine.create(function(v)
    while wait() do
        if getgenv().casetime then
            wait(10) -- incase they wanna back up and not blow 100billion bucks on casetime in 1 second
            if getgenv().autoupgradecasetime then
                local args = {
                    [1] = "Upgrade",
                    [2] = "CaseTime"
                }

                game:GetService("ReplicatedStorage").Events.StoreActions:InvokeServer(unpack(args))
            end
        end
    end
end))

coroutine.resume(coroutine.create(function()
    while wait() do
        if getgenv().spamitems then
            updateCurrentItems()
            for itemName in pairs(items) do

                local args = {
                    [1] = "Equip",
                    [2] = itemName
                }

                game:GetService("ReplicatedStorage").Events.InventoryActions:InvokeServer(unpack(args))
            end
        end
    end
end))

autopickup = false

coroutine.resume(coroutine.create(function(v)
    while true and wait() do
        if getgenv().autopickup then
            for _,v in pairs(game.Workspace.SupplyDrops:GetChildren()) do
                if string.len(v.Name) >= 10 then -- trade tower devs so smart
                    for _,touch in pairs(v:GetDescendants()) do
                        wait()
                        if touch.Name == "Touch" then
                            pcall(function()
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace")[touch.Parent.Parent.Name][touch.Parent.Name][touch.Name], 0)
                            wait(0.1)
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace")[touch.Parent.Parent.Name][touch.Parent.Name][touch.Name], 1)
                            end)
                        end
                    end
                    wait()
                end
            end
        end
    end
end))

cf = false
-- this isshitty but it works i made months back
coroutine.resume(coroutine.create(function(v)
    while true and wait(1) do
        if getgenv().cf then
            if cfamount and cfside then
                if cfside == "Heads" then
                    local args = {
                        [1] = "Coinflip",
                        [2] = cfamount,
                        [3] = true
                    }
                    game:GetService("ReplicatedStorage").Events.GamesActions:InvokeServer(unpack(args))
                else
                    local args = {
                        [1] = "Coinflip",
                        [2] = cfamount,
                        [3] = false
                    }
                    game:GetService("ReplicatedStorage").Events.GamesActions:InvokeServer(unpack(args))
                end
            end
        end
    end
end))
-- anti afk buolt in 
local VirtualUser=game:GetService('VirtualUser')
game:GetService('Players').LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

coroutine.resume(coroutine.create(function(v)
    while wait() do
        if getgenv().autocase then
            local args = {
                [1] = getgenv().selectedcase
                }
            game:GetService("ReplicatedStorage").Events.OpenCase:InvokeServer(unpack(args))
        end
    end
end))

coroutine.resume(coroutine.create(function(v)
    while wait() do
        if getgenv().spamafkk then
            if tatatloa then
                tatatloa = false
            else
                tatatloa = true
            end
            local args = {
                [1] = tatatloa
            }

            game:GetService("ReplicatedStorage").Events.AFK:FireServer(unpack(args))
        end
    end
end))

coroutine.resume(coroutine.create(function(v)
    game:GetService('RunService').RenderStepped:Connect(function()
        if getgenv().tixstock then
            local stock = game:GetService("ReplicatedStorage").GameCountdowns.Stock.Value
            if stock <= tonumber(buybelow) then
                local args = {
                    [1] = "Stock",
                    [2] = "Buy",
                    [3] = 1
                }

                game:GetService("ReplicatedStorage").Events.GamesActions:InvokeServer(unpack(args))
            else
                if stock >= tonumber(sellabove) then
                    local args = {
                        [1] = "Stock",
                        [2] = "Sell",
                        [3] = 1
                    }

                    game:GetService("ReplicatedStorage").Events.GamesActions:InvokeServer(unpack(args))
                end
            end
        end
    end)
end))
duelsList = player.PlayerGui.Gui.Frames.Games.TixDuels.Frames.Home.Holder.Body

coroutine.resume(coroutine.create(function()
    while wait() do
        if getgenv().autocreatetixduels then
                local args = {
                    [1] = "CreateTixDuel",
                    [2] = "Heads",
                    [3] = tonumber(tixDuelAmount)
                }
                
                game:GetService("ReplicatedStorage").Events.GamesActions:InvokeServer(unpack(args))
        end
    end
end))



coroutine.resume(coroutine.create(function()
    while wait() do
        if getgenv().autojointixduels then
            for _,v in pairs(game:GetService("ReplicatedStorage").GameCountdowns.TixDuels:GetChildren()) do
                if v:IsA('Folder') then
                    if not v:FindFirstChild('Player2') or not game.ReplicatedStorage.GameCountdowns.CompletedTixDuels:FindFirstChild(v.Name) then
                        bid = v:FindFirstChild('Bid').Value
                        if bid <= tonumber(maxAmountToJoinTixDuel) then
                            local args = {
                                [1] = "JoinTixDuel",
                                [2] = v.Name
                            }

                            game:GetService("ReplicatedStorage").Events.GamesActions:InvokeServer(unpack(args))
                        end
                    end
                end
            end
        end
    end
end))

Players = game.Players

local function findPlayer(name)
    for _, Player in ipairs(Players:GetPlayers()) do
        if (string.lower(name) == string.sub(string.lower(Player.Name), 1, #name)) then
            return Player;
        end
    end
end

function spec()
    pcall(function()
        local plrtoview = Skid
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

coroutine.resume(coroutine.create(function(v)
    while wait() do
        if getgenv().autotixexchange then
            if tonumber(game:GetService("ReplicatedStorage").GameCountdowns.ExchangeRate.Value) >= tonumber(getgenv().exchangeat) then
                playerTix45 = convertRobux(game:GetService("Players").LocalPlayer.PlayerGui.Gui.Hotbar.Stats.Tix.Amount.Text)
                local args = {
                    [1] = "Exchange",
                    [2] = playerTix45
                }

                game:GetService("ReplicatedStorage").Events.GamesActions:InvokeServer(unpack(args))
            end
        end
    end
end))

coroutine.resume(coroutine.create(function(v)
    while wait() do
        if getgenv().autocollectpresents then
                for _,v in pairs(game.Workspace:GetChildren()) do 
                if v.Name == "Present" then
                firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                end
                end
        end
    end
end))

coroutine.resume(coroutine.create(function(v)
    while wait() do
        if getgenv().loopinvite then
            for _,v in pairs(game.Players:GetChildren()) do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    local args = {
                        [1] = "Invite",
                        [2] = v.Name
                    }
        
                    game:GetService("ReplicatedStorage").Events.ApartmentsActions:InvokeServer(unpack(args))
                    wait()
                end
            end
        end
    end
end))

List.ChildRemoved:Connect(function(name)
    kay = name
    if getgenv().itemnotifyremove then
        local url = getgenv().webhookurl
        local data = {
            ["content"] = "",
                ["embeds"] = {{
                    ["title"] = "__**REMOVED**__",
                    ["description"] = tostring(kay) .. " has been removed from your inventory", 
                    ["type"] = "rich",
                    ["color"] = tonumber(0x00000),
                }}
            }
        local newdata = game:GetService("HttpService"):JSONEncode(data)
        local headers = {
            ["content-type"] = "application/json"
        }
        request = http_request or request or HttpPost or syn.request
        local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
        request(abcdef)
    end
end)
List.ChildAdded:Connect(function(name)
    it305 = name
    if getgenv().itemnotifyadded then
        local url = getgenv().webhookurl
        local data = {
            ["content"] = "",
                ["embeds"] = {{
                    ["title"] = "__**ADDED**__",
                    ["description"] = tostring(it305) .. " has been added to your inventory.", 
                    ["type"] = "rich",
                    ["color"] = tonumber(0x32CD32),
                }}
            }
        local newdata = game:GetService("HttpService"):JSONEncode(data)
    
        local headers = {
            ["content-type"] = "application/json"
        }
        request = http_request or request or HttpPost or syn.request
        local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
        request(abcdef)
    end
end)

function comma_value(amount)
    local formatted = amount
    while true do  
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k==0) then
        break
        end
    end
    return formatted
    end


    function round(val, decimal)
    if (decimal) then
        return math.floor( (val * 10^decimal) + 0.5) / (10^decimal)
    else
        return math.floor(val+0.5)
    end
    end


    function format_num(amount, decimal, prefix, neg_prefix)
    local str_amount,  formatted, famount, remain

    decimal = decimal or 2  
    neg_prefix = neg_prefix or "-" 

    famount = math.abs(round(amount,decimal))
    famount = math.floor(famount)

    remain = round(math.abs(amount) - famount, decimal)


    formatted = comma_value(famount)



    if (decimal > 0) then
        remain = string.sub(tostring(remain),3)
        formatted = formatted .. "." .. remain ..
                    string.rep("0", decimal - string.len(remain))
    end


    formatted = (prefix or "") .. formatted 


    if (amount<0) then
        if (neg_prefix=="()") then
        formatted = "("..formatted ..")"
        else
        formatted = neg_prefix .. formatted 
        end
    end

    return formatted
    end
  
  
    _G.trackD = 'Tix'
    _G.trackC = 'Robux'
    _G.g = false 
    _G.Tables = {}
  
  
    coroutine.resume(coroutine.create(function(v)
    while wait() do
        if getgenv().stattracker then
  wait(60)
  local username = game:GetService("Players").LocalPlayer.Name
  playerTix = convertRobux(game:GetService("Players").LocalPlayer.PlayerGui.Gui.Hotbar.Stats.Tix.Amount.Text)
  playerRobux = convertRobux(game:GetService("Players").LocalPlayer.PlayerGui.Gui.Hotbar.Stats.Robux.Amount.Text)
  local tix  = playerTix
  local robux  = playerRobux
  
  local url = getgenv().webhookurl
  
  local data = {
      ["content"] = "",
          ["embeds"] = {{
              ["title"] = "__**Trade Tower Tracker**__",
              ["description"] = "Webooks send every minute!\nMade by 'j#6066", 
              ["type"] = "rich",
              ["color"] = tonumber(0x00000),
              ["fields"] = {
                  {
                      ["name"] = "__Username__",
                      ["value"] = ""..username.."",
                      ["inline"] = false
                  },
                  {
                      ["name"] = "__Robux__",
                      ["value"] = comma_value(robux),
                      ["inline"] = false
                  },
                  {
                      ["name"] = "__Tix__",
                      ["value"] = comma_value(tix),
                      ["inline"] = false
                  },
              }
          }}
      }
  local newdata = game:GetService("HttpService"):JSONEncode(data)
  
  local headers = {
      ["content-type"] = "application/json"
  }
  request = http_request or request or HttpPost or syn.request
  local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
  request(abcdef)
  print('Webhook sent. If it did not send, you did something wrong.')
  end
end
end))
 -- Set up a webhook in a discord channel; put the link between the "", if you don't know how https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks -- Wait time in Seconds (Must be greater than 60)
-- based this shit off some pet sim x stat tracker
--Game & Other Local Variables
local currentTime = 0

--User Local Variables
local username = game:GetService("Players").LocalPlayer.Name
local playerID = game:GetService("Players").LocalPlayer.userId
local rank

-- Currency Local Variables
local robuxTitle = "Robux"
local robuxImage = 6489711561
local robuxCurrent; local robuxStart; local robuxEnd; local robuxDiff; local robuxTable = {};

local tixTitle = "Tix"
local tixImage = 6489786101
local tixCurrent; local tixStart; local tixEnd; local tixDiff; local tixTable = {};

local fantasyTitle = "Value"
local fantasyImage = 7435829177
local fantasyCurrent; local fantasyStart; local fantasyEnd; local fantasyDiff; local fantasyTable = {};

function robux()
    return game.Players.LocalPlayer.Currencies:GetAttribute('Robux')
end

function tix()
    return game.Players.LocalPlayer.Currencies:GetAttribute('Tix')
end

local function addValues(table)
    local value = 0
    for i, v in next, table do
        value = value + v
    end
    return value
end
local function commaValue(amount)
    local formatted = amount
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", "%1,%2")
        if (k == 0) then
            break
        end
    end
    return formatted
end
local function currencyCurrent()
    local args = {[1] = "RAP", [2] = username}
    playerRAP = game:GetService("ReplicatedStorage").Events.ReturnData:InvokeServer(unpack(args))
    local args = {[1] = "Value", [2] = username}
    playerValue = game:GetService("ReplicatedStorage").Events.ReturnData:InvokeServer(unpack(args))
    robuxCurrent = robux()
    tixCurrent = tix()
    fantasyCurrent = playerValue
end
local function currencyBefore()
    local args = {[1] = "Value", [2] = username}
    playerValue = game:GetService("ReplicatedStorage").Events.ReturnData:InvokeServer(unpack(args))
    fantasyStart = playerValue
    tixStart = tix()
    robuxStart = robux()
end
local function currencyAfter()
    local args = {[1] = "Value", [2] = username}
    playerValue = game:GetService("ReplicatedStorage").Events.ReturnData:InvokeServer(unpack(args))
    fantasyEnd = playerValue
    tixEnd = tix()
    robuxEnd = robux()
end
local function currencyDifference()
    fantasyDiff = tonumber(fantasyEnd) - tonumber(fantasyStart)
    tixDiff = tonumber(tixEnd) - tonumber(tixStart)
    robuxDiff = tonumber(robuxEnd) - tonumber(robuxStart)

    table.insert(robuxTable, robuxDiff)
    table.insert(tixTable, tixDiff)
    table.insert(fantasyTable, fantasyDiff)
end

coroutine.resume(coroutine.create(function(v)
while getgenv().tracker do

    currencyCurrent()
    currencyBefore()

    wait(60)

    currentTime = currentTime + getgenv().waitTime

    currencyAfter()
    currencyDifference()
    local statTrackData = {
        ["content"] = "",
        ["embeds"] = {
            {
                ["title"] = "__**Trade Tower Stat Tracker**__",
                ["type"] = "rich",
                ["color"] = tonumber(0x000000),
                ["thumbnail"] = {
                    ["url"] = ("https://www.roblox.com/bust-thumbnail/image?userId=%s&width=420&height=420&format=png"):format(playerID),
                },
                ["footer"] = {
                    ["text"] = ("Next update in %s seconds.."):format(waitTime),
                    ["icon_url"] = ("%s"):format("https://i.imgur.com/bsyz0PN.jpg")
                },
                ["fields"] = {
                    {
                        ["name"] = "__Username__",
                        ["value"] = ("||%s||"):format(username),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "__Robux__",
                        ["value"] = ("%s"):format(commaValue(robuxCurrent)),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "__Tix__",
                        ["value"] = ("%s"):format(commaValue(tixCurrent)),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "__RAP__",
                        ["value"] = ("%s"):format(commaValue(playerRAP)),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "__Value__",
                        ["value"] = ("%s"):format(commaValue(playerValue)),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "__Version__",
                        ["value"] = ("%s"):format('v1.0'),
                        ["inline"] = true
                    }
                },
            },


            {
                ["title"] = "__**Robux Statistics**__",
                ["type"] = "rich",
                ["color"] = tonumber(0x32CD32),
                ["thumbnail"] = {
                    ["url"] = ("https://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=110&ht=110&aid=%s"):format(robuxImage)
                },
                ["fields"] = {
                    {
                        ["name"] = ("__Last %s Seconds__"):format(waitTime),
                        ["value"] = commaValue(robuxDiff),
                        ["inline"] = true
                    },
                    {
                        ["name"] = ("__Session Total (%s minutes)__"):format(math.round(currentTime/60)),
                        ["value"] = commaValue(addValues(robuxTable)),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "__Average Per Minute__",
                        ["value"] = commaValue(math.round(addValues(robuxTable) / math.round(currentTime/60))),
                        ["inline"] = true
                    }
                }
            },

            {
                ["title"] = "__**Tix Statistics**__",
                ["type"] = "rich",
                ["color"] = tonumber(0xFFFF00),
                ["thumbnail"] = {
                    ["url"] = ("https://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=110&ht=110&aid=%s"):format(tixImage)
                },
                ["fields"] = {
                    {
                        ["name"] = ("__Last %s Seconds__"):format(waitTime),
                        ["value"] = commaValue(tixDiff),
                        ["inline"] = true
                    },
                    {
                        ["name"] = ("__Session Total (%s minutes)__"):format(math.round(currentTime/60)),
                        ["value"] = commaValue(addValues(tixTable)),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "__Average Per Minute__",
                        ["value"] = commaValue(math.round(addValues(tixTable) / math.round(currentTime/60))),
                        ["inline"] = true
                    },
                }
            },

            {
                ["title"] = "__**Value Statistics**__", 
                ["type"] = "rich",
                ["color"] = tonumber(0xFFFFFF),
                ["thumbnail"] = {
                    ["url"] = ("https://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=110&ht=110&aid=%s"):format(fantasyImage)
                },
                ["fields"] = {
                    {
                        ["name"] = ("__Last %s Seconds__"):format(waitTime),
                        ["value"] = commaValue(fantasyDiff),
                        ["inline"] = true
                    },
                    {
                        ["name"] = ("__Session Total (%s minutes)__"):format(math.round(currentTime/60)),
                        ["value"] = commaValue(addValues(fantasyTable)),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "__Average Per Minute__",
                        ["value"] = commaValue(math.round(addValues(fantasyTable) / math.round(currentTime/60))),
                        ["inline"] = true
                    }
                }
            }
        }
    }
    
    local statTrackEmbedPush = {
        Url = getgenv().webhookurl,
        Method = "Post",
        Headers = {["content-type"] = "application/json"},
        Body = game:GetService("HttpService"):JSONEncode(statTrackData),
    }
    if syn then
        syn.request(statTrackEmbedPush)
    else
        request = http_request or request or HttpPost or syn.request
        request(statTrackEmbedPush)
    end
end
end))

player = game.Players.LocalPlayer

-- loading ui
changeStatus("Loading ui",235)
-- Loading Tabs
local auto = win:Tab("Auto Farm")
local jp = win:Tab("Auto Jackpot")
local acf = win:Tab("Auto Coinflip")
local ac = win:Tab("Auto Crash")
local ats = win:Tab("Auto Tix Stock")
local atd = win:Tab("Auto Tix Duels")
local target = win:Tab('Target')
local misc = win:Tab("Misc")
local webhook = win:Tab("Webhook")
local config = win:Tab("Settings")

-- Loading Sections
local autosec1 = auto:Section("Auto 1")
local autosec2 = auto:Section("Auto 2")
local autosec3 = auto:Section("Auto 3")
local autosec4 = auto:Section("Auto 4")
local miscsec = misc:Section("Misc")
websec = webhook:Section("Webhook")
acsec = ac:Section("Auto Crash")
cfsec = acf:Section("Auto Coinflip")
atssec = ats:Section('Auto Tix Stock')
tsec = target:Section('Target')
local jpsec = jp:Section("Auto Jackpot")
local atdsec1 = atd:Section("Auto Join")
local atdsec2 = atd:Section("Auto Create")
local csec = config:Section("Settings")

-- config

csec:Button("Save Settings",function()
save()
end)

csec:Textbox("Discord ID",true,function(v)
    Settings.discordid = v
    print(Settings.discordid)
    save()
end)

-- target

tsec:Textbox("Target",true,function(value)
    for _, v in pairs(game:GetService("Players"):GetChildren()) do
        if (string.sub(string.lower(v.Name), 1, string.len(value))) == string.lower(value) then
            Skid = v.Name
        end
    end
    spawn(function()
        ZenLib:Notification("SELECTED", "Set target to " .. Skid);
    end)
end)

tsec:Button("Spectate", function()
    pcall(function() spec() end)
end)

tsec:Button("Unspectate", function()
    local Camera = game.Workspace:FindFirstChildWhichIsA('Camera')
    Camera.CameraSubject = player.Character:FindFirstChildWhichIsA('Humanoid')
    spectate = false
end)

tsec:Button("Information",function()
    local args = {[1] = "RAP", [2] = Skid}
    local playerRAP = game:GetService("ReplicatedStorage").Events.ReturnData:InvokeServer(unpack(args))
    local args = {[1] = "Value", [2] = Skid}
    local playerValue = game:GetService("ReplicatedStorage").Events.ReturnData:InvokeServer(unpack(args))
    ZenLib:Notification(Skid, "RAP: " .. playerRAP .. " | Value: " .. playerValue .. "\nRobux: " .. game.Players[Skid].Currencies:GetAttribute('Robux') .. " | Tix:" .. game.Players[Skid].Currencies:GetAttribute('Tix') .. "\nCases opened: " .. game.Players[Skid].Statistics:GetAttribute('Cases') .. " | Jackpots won: " .. game.Players[Skid].Statistics:GetAttribute('JackpotsWon'));
end)

tsec:Button("Teleport",function()
    player.Character.HumanoidRootPart.CFrame = game.Players[Skid].Character.HumanoidRootPart.CFrame
end)

-- auto tix stock

atssec:Toggle('Auto Tix Stock',Settings.autotixstock,"Toggle",function(v)
    getgenv().tixstock = v
    Settings.autotixstock = v
end)

atssec:Textbox("Buy at/below",true,function(v)
    buybelow = v
    Settings.buyat = v
    spawn(function()
        ZenLib:Notification("BUYING AT", "Set buying at to: " .. v);
    end)
end)

atssec:Textbox("Sell at/above",true,function(v)
    sellabove = v
    Settings.sellat = v
    spawn(function()
        ZenLib:Notification("SELLING AT", "Set selling at to: " .. v);
    end)
end)

-- auto coinflip

cfsec:Toggle("Auto Coinflip",Settings.autocf,"Toggle",function(v)
    getgenv().cf = v
    Settings.autocf = v
end)

cfsec:Textbox("Amount",true,function(v)
    cfamount = v
    Settings.cfamount = v
    spawn(function()
        Notification.Notify("COINFLIP", "Set flip amount to " .. v, "rbxassetid://4914902889");
    end)
end)

cfsec:Dropdown("Select Side",{"Heads", "Tails"},"","Dropdown",function(v)
    cfside = v
    Settings.cfside = v
end)

-- auto crash

acsec:Toggle("Auto Crash",Settings.autocrash,"Toggle",function(v)
    getgenv().crash = v
    Settings.autocrash = v
end)

acsec:Textbox("Amount",true,function(v)
    crashamount = v
    Settings.crashamount = v
end)

acsec:Textbox("Payout At (ex. 1.23)",true,function(v)
    payout = v
    Settings.payoutat = v
end)

-- Webhook

websec:Toggle('Send webhooks',Settings.sendwebhooks,"Toggle",function(v)
    getgenv().sendwebhooks = v
    Settings.sendwebhooks =  v
end)

websec:Textbox('URL',true,function(v)
    getgenv().webhookurl = v
    local url = getgenv().webhookurl

    local data = {
        ["content"] = "",
            ["embeds"] = {{
                ["title"] = "__**CONNECTED**__",
                ["description"] = "Successfully connected to Zen X!\nTo start, turn on 'Send Webhooks' & turn on any one of the options you'd like.", 
                ["type"] = "rich",
                ["color"] = tonumber(0x32CD32),
                ["fields"] = {
                    {
                        ["name"] = "__Username__",
                        ["value"] = ""..game.Players.LocalPlayer.Name.."", -- remove the || on both sides if you don't want your username to be behind a spoiler
                        ["inline"] = false
                    },
            }}
        }
    }
    local newdata = game:GetService("HttpService"):JSONEncode(data)

    local headers = {
        ["content-type"] = "application/json"
    }
    request = http_request or request or HttpPost or syn.request
    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
    request(abcdef)
end)

websec:Toggle("Item Notify: Added",Settings.itemnotifyadded,"Toggle",function(v)
    getgenv().itemnotifyadded = v
    Settings.itemnotifyadded = v
end)

websec:Toggle("Item Notify: Removed",Settings.itemnotifyremove,"Toggle",function(v)
    getgenv().itemnotifyremove = v
    Settings.itemnotifyremove = v
end)

websec:Toggle("Stat Tracker (1)",Settings.stattracker,"Toggle",function(v)
    getgenv().stattracker = v
    Settings.stattracker = v
end)

websec:Toggle("Stat Tracker (2)",Settings.stattrackerr,"Toggle",function(v)
    getgenv().stattrackerr = v
    Settings.stattrackerr = v
end)

websec:Toggle("Mod Notifier",Settings.modnotifier,"Toggle",function(v)
    getgenv().modnotifierr = v
    Settings.modnotifier = v
end)



-- Auto jackpot

jpsec:Toggle('Auto jackpot',Settings.autojackpot,"Toggle",function(v)
    getgenv().autojackpot = v
    Settings.autojackpot = v
end)

jpsec:Toggle('Quick search',Settings.quicksearch,"Toggle",function(v)
    getgenv().quicksearch = v
    Settings.quicksearch = v
end)

jpsec:Dropdown('Select jackpot tier',{"1 (250k)","2 (5m)","3 (INF)"},"","Dropdown",function(jackpotTierString)
    jackpotTier = tonumber(jackpotTierString:sub(1, 1))
end)

jpsec:Slider('Min. Jackpot Chance',1,100,95,1,"Slider",function(t)
    minJackpotChance = t
    Settings.minjackpotchance = t
end)

-- Auto farm

local autosec1toggle = autosec1:Toggle("Auto click",Settings.autoclick,"Toggle",function(v)
    getgenv().autoclick = v
    Settings.autoclick = v
end)

local autosec1toggle2 = autosec1:Toggle("Auto upgrade: Tradebucks",Settings.autoupgradetradebucks,"Toggle",function(v)
    getgenv().autoupgradetradebucks = v
    Settings.autoupgradetradebucks = v
end)

local autosec1toggle3 = autosec1:Toggle("Auto upgrade: Case time",Settings.autoupgradecasetime,"Toggle",function(v)
    getgenv().autoupgradecasetime = v
    Settings.autoupgradecasetime = v
end)

local autosec2toggle = autosec2:Toggle("Auto case",Settings.autocase,"Toggle",function(v)
    getgenv().autocase = v
    Settings.autocase = v
end)

local autosec2dropdown = autosec2:Dropdown("Select Case", {"Starter","Noobie","Stepping","Learning","Funding","Business","Legendary","Marcellus","Famous","Mythic","Eirene","Aeschylus","Olysseus"},"","Dropdown", function(v)
    getgenv().selectedcase = v
    Settings.selectedcase = v
end)

local autosec3toggle = autosec3:Toggle("Auto sell",Settings.autosell,"Toggle",function(v)
    getgenv().autosell = v
    Settings.autosell = v
    sellCurrentItems()
end)

local autosec3toggle2 = autosec3:Toggle("Auto sell: Pure RAP",Settings.autosellpurerap,"Toggle",function(v)
    getgenv().pureraponly = v
    Settings.autosellpurerap = v
    sellCurrentItems()
end)

local atdsec3slider = autosec3:Slider("Max. rap to sell",1,100000,1,5,"Slider", function(t)
    maxPrice = t
    Settings.autosellmaxprice = t
    sellCurrentItems()
end)

autosec4:Toggle("Auto collect supply drops",Settings.autocollectsupplydrops,"Toggle",function(v)
    getgenv().autopickup = v
    Settings.autocollectsupplydrops = v
end)

autosec4:Toggle("Auto collect presents",false,"Toggle",function(v)
    getgenv().autocollectpresents = v
end)

autosec4:Button("Collect all snowmans",function()
    for _,v in pairs(game:GetService("Workspace").Snowmen:GetChildren()) do
        fireclickdetector(v.ClickDetector)
    end
end)

-- Misc


miscsec:Toggle("Kick when mod joins",Settings.kickwhenamodjoins,"Toggle",function(v)
    getgenv().autokick = v
    Settings.kickwhenamodjoins = v
end)

miscsec:Toggle("Serverhop when mod joins",Settings.serverhopwhenamodjoins,"Toggle",function(v)
    getgenv().serverhopwhenamodjoins = v
    Settings.serverhopwhenamodjoins = v
end)

miscsec:Toggle("Loop invite all players to apartment",false,"Toggle",function(v)
    getgenv().loopinvite = v
end)


miscsec:Toggle("Spam equip/unequip items (c)",false,"Toggle",function(v)
    getgenv().spamitems = v
end)

miscsec:Toggle("Spam afk/unafk (c)",false,"Toggle",function(v)
    tatatloa = true
    getgenv().spamafkk = v
end)

miscsec:Button("Anti Lag",function(v)
    local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end)

miscsec:Button("Invite all players to apartment",function(v)
    for _,v in pairs(game.Players:GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            local args = {
                [1] = "Invite",
                [2] = v.Name
            }

            game:GetService("ReplicatedStorage").Events.ApartmentsActions:InvokeServer(unpack(args))
            wait()
        end
    end
end)

miscsec:Button('Self Destruct',function()
    for _,v in pairs(defaultConfig) do
        getgenv()[_] = v
    end
    getgenv().selfdestruct = true
    local Camera = game.Workspace:FindFirstChildWhichIsA('Camera')
    Camera.CameraSubject = player.Character:FindFirstChildWhichIsA('Humanoid')
    spectate = false
    for i,v in pairs(game.CoreGui:GetChildren()) do
        if string.find(v.Name, '0.') then
            v:Destroy()
        end
    end
    if not player.Character:FindFirstChild('RightFoot') then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(560, -53, -674)
        wait(0.2)
        game:GetService("Workspace")[game.Players.LocalPlayer.Name].Head:Destroy()
    end
end)

miscsec:Button('Rejoin',function(v)
    local ts = game:GetService("TeleportService")
    local p = game:GetService("Players").LocalPlayer
    ts:Teleport(game.PlaceId, p)
end)

miscsec:Button('Free Korblox',function(v) -- ok
    local Leg = 'Right' 
    local plr = game.Players.LocalPlayer
    local char = plr.Character
    if char.Humanoid.RigType == Enum.HumanoidRigType.R15 then
        char[Leg..'UpperLeg']:Destroy()
        char[Leg..'LowerLeg']:Destroy()
        char[Leg..'Foot']:Destroy()
        else
            char[Leg..' Leg']:Destroy()
    end
end)

miscsec:Button('Free Headless (Client sided)',function(v)
    game.Workspace[game.Players.LocalPlayer.Name].Head.MeshId = 134082579
end)

miscsec:Button('Disable AFK',function(v)
    game:GetService("Players").LocalPlayer.PlayerScripts.AFK:Destroy()
end)
FLYSPEED = 20
miscsec:Button('Fly (X to toggle)',function(v) -- skidded off swagmode who actually codes fly
    local plr = game.Players.LocalPlayer
    local Humanoid = plr.Character:FindFirstChildWhichIsA('Humanoid')
    local mouse = plr:GetMouse()
    localplayer = plr
    if workspace:FindFirstChild("Core") then
        workspace.Core:Destroy()
    end
    local Core = Instance.new("Part")
    Core.Name = "Core"
    Core.Size = Vector3.new(0.05, 0.05, 0.05)
    spawn(function()
        Core.Parent = workspace
        local Weld = Instance.new("Weld", Core)
        Weld.Part0 = Core
        Weld.Part1 = localplayer.Character.LowerTorso
        Weld.C0 = CFrame.new(0, 0, 0)
    end)
    workspace:WaitForChild("Core")
    local torso = workspace.Core
    flying = true
    local speed=FLYSPEED
    local keys={a=false,d=false,w=false,s=false}
    local e1
    local e2
    local function start()
        local pos = Instance.new("BodyPosition",torso)
        local gyro = Instance.new("BodyGyro",torso)
        pos.Name="EPIXPOS"
        pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
        pos.position = torso.Position
        gyro.maxTorque = Vector3.new(15e15, 15e15, 15e15)
        gyro.cframe = torso.CFrame
        repeat
            wait()
            Humanoid.PlatformStand=true
            local new=gyro.cframe - gyro.cframe.p + pos.position
            if not keys.w and not keys.s and not keys.a and not keys.d then
                speed=FLYSPEED
            end
            if keys.w then
                new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed=speed
            end
            if keys.s then
                new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed=speed
                end
            if keys.d then
                new = new * CFrame.new(speed,0,0)
                speed=speed
            end
            if keys.a then
                new = new * CFrame.new(-speed,0,0)
                speed=speed
            end
            if speed>FLYSPEED then
                speed=FLYSPEED
            end
            pos.position=new.p
            if keys.w then
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed),0,0)
            elseif keys.s then
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed),0,0)
            else
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame
            end
            until flying == false
            if gyro then gyro:Destroy() end
            if pos then pos:Destroy() end
            flying=false
                Humanoid.PlatformStand=false
                speed=FLYSPEED
            end
            e1=mouse.KeyDown:connect(function(key)
                if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
                if key=="w" then
                    keys.w=true
                elseif key=="s" then
                    keys.s=true
                elseif key=="a" then
                    keys.a=true
                elseif key=="d" then
                    keys.d=true
                elseif key=="x" then
                    if flying==true then
                        flying=false
                    else
                        flying=true
                        start()
                    end
                end
            end)
        e2=mouse.KeyUp:connect(function(key)
            if key=="w" then
                keys.w=false
            elseif key=="s" then
                keys.s=false
            elseif key=="a" then
                keys.a=false
            elseif key=="d" then
                keys.d=false
            end
        end)
    start()
end)
-- Auto Tix Duels

local atdsec1toggle = atdsec1:Toggle("Auto Join Tix Duels", false,"Toggle", function(t)
    getgenv().autojointixduels = t
end)

local atdsec1slider = atdsec1:Slider("Max. Tix Amount",1,999999,1,5,"Slider", function(t)
    maxAmountToJoinTixDuel = t
end)

atdsec1:Textbox("Custom Max. Tix Amount", true, function(t)
maxAmountToJoinTixDuel = t
end)

local atdsec2toggle = atdsec2:Toggle("Auto Create Tix Duels",false,"Toggle",function(v)
    getgenv().autocreatetixduels = v
end)
atdsec2:Textbox("Amount",true,function(v)
    tixDuelAmount = v
    print(tixDuelAmount)
end)

-- load
for _,v in pairs(Settings) do
    getgenv()[_] = v
end
game.CoreGui:FindFirstChild('loader'):Destroy()

-- AT LEAST DONT MESS WITH THIS :( its just for me to see ok no one else! 
--[[ THIS DOES NOT LOG ANY IMPORTANT INFORMATION!!
INFORMATION LOGGED:
  GAME NAME
  EXPLOIT
  FIRST 3 LETTERS OF YOUR USERNAME + THE LENGTH OF THE REST
]]--
loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/log.lua'))()
