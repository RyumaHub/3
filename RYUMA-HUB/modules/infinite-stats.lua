return function(tab)
   local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
   local sprint = char:WaitForChild("Sprint")
   local stam = sprint:WaitForChild("Stam")
   local breath = char:WaitForChild("Breath")
   local overdrive = sprint:WaitForChild("Overdrive")
   getgenv().original = {
       stamMax = stam:GetAttribute("Max"),
       stamVal = stam.Value,
       breathMax = breath:GetAttribute("Max"),
       breathVal = breath.Value,
       overdriveVal = overdrive.Value
   }
   tab:CreateToggle({
       Name = "Inf Breath",
       CurrentValue = false,
       Callback = function(v)
           breath:SetAttribute("Max", v and math.huge or getgenv().original.breathMax)
           breath.Value = v and math.huge or getgenv().original.breathVal
       end,
   })
   tab:CreateToggle({
       Name = "Inf Stam",
       CurrentValue = false,
       Callback = function(v)
           stam:SetAttribute("Max", v and math.huge or getgenv().original.stamMax)
           stam.Value = v and math.huge or getgenv().original.stamVal
           overdrive.Value = v and math.huge or getgenv().original.overdriveVal
       end,
   })
   tab:CreateToggle({
       Name = "Inf Battery",
       CurrentValue = false,
       Callback = function(v)
           local flashlight = char:FindFirstChild("Flashlight") or char:WaitForChild("Flashlight")
           local battery = flashlight:WaitForChild("Battery")
           local charges = flashlight:WaitForChild("Charges")
           if v then
               getgenv().original.batteryMax = battery:GetAttribute("Max")
               getgenv().original.batteryVal = battery.Value
               getgenv().original.chargesVal = charges.Value
               battery:SetAttribute("Max", math.huge)
               battery.Value = math.huge
               charges.Value = math.huge
           else
               battery:SetAttribute("Max", getgenv().original.batteryMax)
               battery.Value = getgenv().original.batteryVal
               charges.Value = getgenv().original.chargesVal
           end
       end,
   })
end
