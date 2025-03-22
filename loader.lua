-- ✅ CONFIGURATION
local keySystemURL = "https://raw.githubusercontent.com/lumeCraftors/Project/refs/heads/main/keysystem.lua" -- Replace with actual URL
local gameListURL = "https://raw.githubusercontent.com/lumeCraftors/Project/refs/heads/main/gameslist.lua" -- Replace with actual URL

-- ✅ NOTIFICATION FUNCTION
local function notify(title, text)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 5
        })
    end)
end

-- ✅ LOAD KEY SYSTEM FIRST
local function loadKeySystem()
    local success, response = pcall(function()
        return loadstring(game:HttpGet(keySystemURL, true))()
    end)

    if success then
        notify("✅ Key System Loaded!", "Please enter your key.")
    else
        notify("❌ Failed to Load Key System", "Retrying in 5 seconds...")
        warn("❌ Failed to load key system! Retrying...")
        wait(5)
        loadKeySystem() -- Retry loading
    end
end

notify("🔄 Loading Key System...", "Please wait.")
loadKeySystem()
