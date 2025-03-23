local gameListURL = "https://raw.githubusercontent.com/YOUR_REPO/GameList.lua" -- Replace with your actual GameList URL

local function notify(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 5
    })
end

local success, response = pcall(function()
    return loadstring(game:HttpGet(gameListURL, true))()
end)

if success then
    notify("✅ Game List Loaded!", "Checking supported games...", 5)
else
    notify("❌ Failed to Load", "Could not load the game list!", 5)
    warn("❌ Failed to load game list!")
end
