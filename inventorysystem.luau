-- InventorySystem.lua

local InventorySystem = {}
InventorySystem.__index = InventorySystem

-- Create a new inventory for a player
function InventorySystem.new(player)
    local self = setmetatable({}, InventorySystem)
    self.Player = player
    self.Items = {}
    return self
end

-- Add item to inventory
function InventorySystem:AddItem(itemName, quantity)
    quantity = quantity or 1
    if self.Items[itemName] then
        self.Items[itemName] += quantity
    else
        self.Items[itemName] = quantity
    end
    print(self.Player.Name .. " received " .. quantity .. "x " .. itemName)
end

-- Remove item from inventory
function InventorySystem:RemoveItem(itemName, quantity)
    if not self.Items[itemName] then return end
    quantity = quantity or 1
    self.Items[itemName] -= quantity
    if self.Items[itemName] <= 0 then
        self.Items[itemName] = nil
    end
    print(self.Player.Name .. " used " .. quantity .. "x " .. itemName)
end

-- Show inventory contents
function InventorySystem:ShowInventory()
    print("Inventory of " .. self.Player.Name .. ":")
    for item, qty in pairs(self.Items) do
        print(item .. " x" .. qty)
    end
end

return InventorySystem
