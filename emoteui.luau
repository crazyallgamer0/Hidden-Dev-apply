-- EmoteGUI.lua

-- Create a ScreenGui with buttons for emotes
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local emotes = {"Wave", "Dance", "Laugh"}

-- Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EmoteGUI"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create buttons dynamically
for i, emote in ipairs(emotes) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 0, 40)
    button.Position = UDim2.new(0, 20, 0, 20 + (i-1)*50)
    button.Text = emote
    button.Parent = screenGui

    -- Button click event
    button.MouseButton1Click:Connect(function()
        print(player.Name .. " triggered emote: " .. emote)
        -- Example animation trigger
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:LoadAnimation(game.ReplicatedStorage.Emotes[emote]):Play()
        end
    end)
end
