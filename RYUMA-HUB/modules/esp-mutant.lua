return function(tab)
   local RunService = game:GetService("RunService")
   local Players = game:GetService("Players")
   local Camera = workspace.CurrentCamera
   local LocalPlayer = Players.LocalPlayer

   local quad = Drawing.new("Quad")
   local text = Drawing.new("Text")

   quad.Visible = false
   quad.Color = Color3.fromRGB(255, 0, 0)
   quad.Thickness = 2
   quad.Transparency = 1
   quad.Filled = false

   text.Visible = false
   text.Center = true
   text.Size = 18
   text.Color = Color3.fromRGB(255, 0, 0)
   text.Outline = true
   text.Font = 2

   getgenv().espLoop = false

   RunService.RenderStepped:Connect(function()
       if not getgenv().espLoop then
           quad.Visible = false
           text.Visible = false
           return
       end

       local mutant = workspace:FindFirstChild("Mutant")
       local char = LocalPlayer.Character
       local hrp = char and char:FindFirstChild("HumanoidRootPart")

       if mutant and mutant:FindFirstChild("HumanoidRootPart") and hrp then
           local part = mutant.HumanoidRootPart
           local cf = part.CFrame
           local size = mutant:GetExtentsSize()
           size = Vector3.new(size.X, size.Y, 0)

           local tl = Camera:WorldToViewportPoint((cf * CFrame.new(-size.X/2, size.Y/2, 0)).Position)
           local tr = Camera:WorldToViewportPoint((cf * CFrame.new(size.X/2, size.Y/2, 0)).Position)
           local br = Camera:WorldToViewportPoint((cf * CFrame.new(size.X/2, -size.Y/2, 0)).Position)
           local bl = Camera:WorldToViewportPoint((cf * CFrame.new(-size.X/2, -size.Y/2, 0)).Position)

           if tl.Z > 0 and tr.Z > 0 and br.Z > 0 and bl.Z > 0 then
               quad.PointA = Vector2.new(tl.X, tl.Y)
               quad.PointB = Vector2.new(tr.X, tr.Y)
               quad.PointC = Vector2.new(br.X, br.Y)
               quad.PointD = Vector2.new(bl.X, bl.Y)
               quad.Visible = true

               local distance = math.floor((hrp.Position - part.Position).Magnitude)
               text.Text = "MUTANT [" .. distance .. "m]"
               text.Position = Vector2.new((tl.X + br.X)/2, tl.Y - 20)
               text.Visible = true
           else
               quad.Visible = false
               text.Visible = false
           end
       else
           quad.Visible = false
           text.Visible = false
       end
   end)

   tab:CreateToggle({
       Name = "ESP Mutant",
       CurrentValue = false,
       Callback = function(Value)
           getgenv().espLoop = Value
       end,
   })
end
