return function(tab)
   local RunService = game:GetService("RunService")
   local Players = game:GetService("Players")
   local LocalPlayer = Players.LocalPlayer
   local afkConnection

   tab:CreateToggle({
       Name = "Mode AFK",
       CurrentValue = false,
       Callback = function(Value)
           getgenv().afkLoop = Value
           if afkConnection then
               afkConnection:Disconnect()
               afkConnection = nil
           end
           if Value then
               afkConnection = RunService.Heartbeat:Connect(function()
                   local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                   if hrp then
                       hrp.CFrame = CFrame.new(-16.5848007, 23.7999802, -53.7517624)
                   end
               end)
           end
       end,
   })
end
