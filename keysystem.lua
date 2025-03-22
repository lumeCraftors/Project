-- ✅ CONFIGURATION
local keyCheckURL = "https://redirect-api.work.ink/tokenValid/"
local keyID = "64581" -- Replace with actual key system ID
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

-- ✅ UI LIBRARY (Rayfield)
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
    Name = "🔑 Shadowbyte - Key System",
    Theme = "Dark"
})

local MainTab = Window:CreateTab("Key System")
local Section = MainTab:CreateSection("🔑 Enter Your Key")

-- ✅ COPY KEY BUTTON
MainTab:CreateButton({
    Name = "📋 Copy Key Link",
    Callback = function()
        setclipboard("https://workink.net/1Ywp/09vquh7b") -- Replace with actual key link
        notify("✅ Key Link Copied!", "Paste it in your browser to get the key.")
    end
})

-- ✅ INPUT FIELD FOR KEY
local KeyInput = MainTab:CreateInput({
    Name = "Enter Key",
    Placeholder = "Paste key here...",
    Callback = function(txt)
        _G.Key = txt
    end
})

-- ✅ CHECK KEY BUTTON
MainTab:CreateButton({
    Name = "✅ Check Key",
    Callback = function()
        if not _G.Key or _G.Key == "" then
            notify("❌ Error", "Please enter a key!")
            return
        end
        
        local success, response = pcall(function()
            return game:HttpGet(keyCheckURL .. _G.Key .. "?linkId=" .. keyID)
        end)

        if success and response == "True" then
            notify("✅ Key Verified", "Loading game script...")
            wait(2)
            Rayfield:Destroy() -- Close UI

            -- ✅ LOAD THE GAME LIST
            local gameSuccess, gameResponse = pcall(function()
                return game:HttpGet(gameListURL, true)
            end)

            if gameSuccess then
                local supportedGames = loadstring(gameResponse)()
                local scriptURL = supportedGames[game.PlaceId]

                if scriptURL then
                    notify("✅ Loading Script", "Please wait...")
                    wait(2)
                    loadstring(game:HttpGet(scriptURL, true))()
                else
                    notify("❌ Unsupported Game", "No script available for this game.")
                end
            else
                notify("❌ Failed to Load", "Could not retrieve game list.")
            end
        else
            notify("❌ Invalid Key", "Please enter a valid key.")
        end
    end
})
