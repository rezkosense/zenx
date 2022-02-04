getgenv()["laderiteUtilities"] = {}
local Util = getgenv()["laderiteUtilities"]
Util = function getUserId(player)
    return game.Players[player].UserId
end

Util = function getPlayer(id)
    return game.Players:GetPlayerByUserId(id)
end

return Util
