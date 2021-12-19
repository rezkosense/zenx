local url = "https://raw.githubusercontent.com/laderite/zenx/main/scripts"

local games = {
    [5023820864] = "Trade Tower",
    [4866692557] = "Age of Gays",
    [2788229376] = "Da Hood",
}

for i,v in next, games do
    games[i] = table.concat(v:split(' '), '_')
end

local name = games[game.PlaceId] or games[game.GameId]
if identifyexecutor() == "Fluxus" and name == "Trade_Tower" then loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/scripts/Trade%20Tower%20Fluxus.lua'))() -- Trade tower script for fluxus users
else loadstring(game:HttpGet(url.. "/"..(name or "Universal")..".lua"))() end
