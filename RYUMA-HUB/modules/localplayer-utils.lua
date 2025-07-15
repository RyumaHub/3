return function(tab)
   tab:CreateButton({
       Name = "Camera Mode Classic",
       Callback = function()
           game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.Classic
       end,
   })

   tab:CreateButton({
       Name = "Disable Temperature",
       Callback = function()
           local p = game.Players.LocalPlayer
           local g = p.Character or p.CharacterAdded:Wait()
           local gui = p:WaitForChild("PlayerGui"):WaitForChild("StatusUI")
           if gui:FindFirstChild("FrozenFX") then
               gui.FrozenFX.ImageTransparency = 1
           end
           local f = game.ReplicatedStorage:FindFirstChild("Remotes") and game.ReplicatedStorage.Remotes:FindFirstChild("Frostbite")
           if f then
               f.FireServer = function() end
           end
       end,
   })

   tab:CreateToggle({
       Name = "FullBright",
       CurrentValue = false,
       Callback = function(Value)
           getgenv().loopfb = Value
           local lighting = game:GetService("Lighting")
           if Value then
               getgenv().fbthread = task.spawn(function()
                   while getgenv().loopfb do
                       lighting.Brightness = 2
                       lighting.ClockTime = 14
                       lighting.FogEnd = 100000
                       lighting.GlobalShadows = false
                       lighting.OutdoorAmbient = Color3.new(1, 1, 1)
                       task.wait()
                   end
               end)
           else
               if getgenv().fbthread then task.cancel(getgenv().fbthread) end
               lighting.GlobalShadows = true
           end
       end,
   })
end
