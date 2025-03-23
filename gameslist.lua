local gameScripts = {
    [1234567890] = "https://raw.githubusercontent.com/lumeCraftors/Project/refs/heads/main/Supported%20Game/TestScript.lua", -- Replace with actual game IDs & scripts
    [9876543210] = "https://raw.githubusercontent.com/YOUR_REPO/Script2.lua"
}

local placeId = game.PlaceId

if gameScripts[placeId] then
    local scriptURL = gameScripts[placeId]
    loadstring(game:HttpGet(scriptURL, true))()
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "❌ Unsupported Game",
        Text = "This game is not supported.",
        Duration = 5
    })
end
