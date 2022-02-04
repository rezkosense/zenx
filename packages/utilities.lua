getgenv()["laderiteUtilities"] = {}
local Util = getgenv()["laderiteUtilities"]
function Util:getUserId(player)
    return game.Players[player].UserId
end

function Util:getPlayer()
    return game.Players:GetPlayerByUserId(id)
end

return Util
