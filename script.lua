local url = "https://raw.githubusercontent.com/laderite/zenx/main/scripts"

local games = {
    [5023820864] = "Trade Tower";
    [4866692557] = "Age of Gays";
    [2788229376] = "Da Hood";
    [6720959312] = "Loot Quest";
    [2990100290] = "RPG Simulator"; -- world 1
    [4628853904] = "RPG Simulator"; -- world 2
    [8328351891] = "Mega Mansion Tycoon";
}

for i,v in next, games do
    games[i] = table.concat(v:split(' '), '_')
end

local name = games[game.PlaceId] or games[game.GameId]
if identifyexecutor() == "Fluxus" and name == "Trade_Tower" then return loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/scripts/Trade%20Tower%20Fluxus.lua'))() end -- Trade tower script for fluxus users
return loadstring(game:HttpGet(url.. "/"..(name or "Universal")..".lua"))()
