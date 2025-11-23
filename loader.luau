local SUPPORTED_GAMES = {
    [18709784634] = "https://raw.githubusercontent.com/marstraveler01/luauarch/refs/heads/main/script/ob_almg.luau",
    [93491740450163] = "https://raw.githubusercontent.com/marstraveler01/luauarch/refs/heads/main/script/ob_za.luau"
}

local CurrentPlaceId = game.PlaceId
local ScriptURL = SUPPORTED_GAMES[CurrentPlaceId]
local StarterGui = game:GetService("StarterGui")

-- Function to handle HTTP fetching
local function load_remote_script(url)
    if game.HttpGet then
        return game:HttpGet(url)
    elseif game:GetService("HttpService") then
        return game:GetService("HttpService"):GetAsync(url)
    end
    return nil
end

-- Check if the current game is supported
if ScriptURL then
    local script_source = load_remote_script(ScriptURL)
    
    if script_source then
        -- Load and run the external script
        loadstring(script_source)()
    end
else
    -- Display the simplified notification for unsupported games
    StarterGui:SetCore("SendNotification", { 
        Title = "luauarch | Loader", 
        Text = "Loader failed. This game is not supported.", 
        Duration = 15 
    })
end

