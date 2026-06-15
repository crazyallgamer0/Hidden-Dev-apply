-- DungeonSettings.lua
-- Simple settings GUI for dungeon game

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Settings options
local settings = {
    Difficulty = {"Easy", "Normal", "Hard"},
    Music = {"On", "Off"},
    Lighting = {"Bright", "Dark"}
}

-- Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DungeonSettings"
screenGui.Parent = player:WaitForChild("PlayerGui")

local yPos = 20

for settingName, options in pairs(settings) do
    -- Label
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 200, 0, 30)
    label.Position = UDim2.new(0, 20, 0, yPos)
    label.Text = settingName .. ": " .. options[1]
    label.Parent = screenGui

    -- Toggle button
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 0, 30)
    button.Position = UDim2.new(0, 240, 0, yPos)
    button.Text = "Change"
    button.Parent = screenGui

    local currentIndex = 1

    button.MouseButton1Click:Connect(function()
        currentIndex += 1
        if currentIndex > #options then
            currentIndex = 1
        end
        label.Text = settingName .. ": " .. options[currentIndex]
        print(player.Name .. " set " .. settingName .. " to " .. options[currentIndex])
    end)

    yPos += 50
end
