local SUPPORTED_GAMES = {
    [18709784634] = "https://api.jnkie.com/api/v1/luascripts/public/470e11a07b4368d5a72c1d03189b1d01470b2e91bb81f8fb314a9f005646e526/download",
    [93491740450163] = "https://api.jnkie.com/api/v1/luascripts/public/19e0a719ee0b15cd4875d1f2125e233bd0740e1da7810f21133d9ae65833a0ee/download"
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

