local url = "https://raw.githubusercontent.com/laderite/zenx/main"

local games = {
    [5023820864] = "Trade Tower",
    [4866692557] = "Age of Gays",
    [2788229376] = "Da Hood",
}

for i,v in next, games do
    games[i] = table.concat(v:split(' '), '_')
end

local name = games[game.GameId]
return loadstring(game:HttpGet(url.. "/"..(name or "Universal")..".lua", true))()
