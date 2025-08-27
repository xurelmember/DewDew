local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "dew.wtf - Join discord.gg/ePfPyDmXEX",
   Icon = 0,
   LoadingTitle = "MTN DEW",
   LoadingSubtitle = "by Xurelmember",
   ShowText = "DEW", 
   Theme = "Amber Glow",

   ToggleUIKeybind = "P", 

   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true, 

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, 
      FileName = "SLR RAGE"
   },

   Discord = {
      Enabled = true, 
      Invite = "ePfPyDmXEX", 
      RememberJoins = true 
   },

   KeySystem = true, 
   KeySettings = {
      Title = "Dew.wtf",
      Subtitle = nil,
      Note = "Join discord to get key", 
      FileName = "Key",
      SaveKey = false, 
      GrabKeyFromSite = false, 
      Key = {"DewIsHere"} 
})


local MainTab = Window:CreateTab("Home", nil)
local MainSection = MainTab:CreateSection("Common Features")

local Button = MainTab:CreateButton({
   Name = "Silent Aim Legit",
   Callback = function()
           local players = game:GetService("Players")
local player = players.LocalPlayer or players.PlayerAdded:Wait()
local mouse = player:GetMouse()

local Config = {
   Enabled = true,
   TeamCheck = false,
   HitPart = "Head",
   Method = "Raycast",
   FieldOfView = {
      Enabled = true,
      Radius = 15
   }
}

local friend_check = {}

local ExpectedArguments = {
   FindPartOnRayWithIgnoreList = {
      ArgCountRequired = 3,
      Args = {
         "Instance", "Ray", "table", "boolean", "boolean"
      }
   },
   FindPartOnRayWithWhitelist = {
      ArgCountRequired = 3,
      Args = {
         "Instance", "Ray", "table", "boolean"
      }
   },
   FindPartOnRay = {
      ArgCountRequired = 2,
      Args = {
         "Instance", "Ray", "Instance", "boolean", "boolean"
      }
   },
   Raycast = {
      ArgCountRequired = 3,
      Args = {
         "Instance", "Vector3", "Vector3", "RaycastParams"
      }
   }
}

local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local GetChildren = game.GetChildren
local WorldToScreen = Camera.WorldToScreenPoint
local FindFirstChild = game.FindFirstChild

local function getPositionOnScreen(Vector)
   local Vec3, OnScreen = WorldToScreen(Camera, Vector)
   return Vector2.new(Vec3.X, Vec3.Y), OnScreen
end

local function ValidateArguments(Args, RayMethod)
   local Matches = 0
   if #Args < RayMethod.ArgCountRequired then
      return false
   end
   for Pos, Argument in next, Args do
      if typeof(Argument) == RayMethod.Args[Pos] then
         Matches = Matches + 1
      end
   end
   return Matches >= RayMethod.ArgCountRequired
end

local function getDirection(Origin, Position)
   return (Position - Origin).Unit * 1000
end

local function getMousePosition()
   return Vector2.new(Mouse.X, Mouse.Y)
end

local function getClosestPlayer()
   if not Config.HitPart then return end
   local Closest
   local DistanceToMouse
   for _, Player in next, GetChildren(Players) do
      if Player == LocalPlayer then continue end
      if Config.TeamCheck and Player.Team == LocalPlayer.Team then continue end

      local Character = Player.Character

      if not Character then continue end

      local HumanoidRootPart = FindFirstChild(Character, "HumanoidRootPart")
      local Humanoid = FindFirstChild(Character, "Humanoid")

      if not HumanoidRootPart or not Humanoid or Humanoid and Humanoid.Health <= 0 and not table.find(friend_check, Player.Name) then continue end

      local ScreenPosition, OnScreen = getPositionOnScreen(HumanoidRootPart.Position)

      if not OnScreen then continue end

      local Distance = (getMousePosition() - ScreenPosition).Magnitude
      if Distance <= (DistanceToMouse or (Config.FieldOfView.Enabled and Config.FieldOfView.Radius) or 2000) then
         Closest = Character[Config.HitPart]
         DistanceToMouse = Distance
      end
   end
   return Closest
end

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(...)
local Method = getnamecallmethod()
local Arguments = {...}
local self = Arguments[1]

if Config.Enabled and self == workspace then
   if Method == "FindPartOnRayWithIgnoreList" and Config.Method == Method then
      if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithIgnoreList) then
         local A_Ray = Arguments[2]

         local HitPart = getClosestPlayer()
         if HitPart then
            local Origin = A_Ray.Origin
            local Direction = getDirection(Origin, HitPart.Position)
            Arguments[2] = Ray.new(Origin, Direction)

            return oldNamecall(unpack(Arguments))
         end
      end
   elseif Method == "FindPartOnRayWithWhitelist" and Config.Method == Method then
      if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithWhitelist) then
         local A_Ray = Arguments[2]

         local HitPart = getClosestPlayer()
         if HitPart then
            local Origin = A_Ray.Origin
            local Direction = getDirection(Origin, HitPart.Position)
            Arguments[2] = Ray.new(Origin, Direction)

            return oldNamecall(unpack(Arguments))
         end
      end
   elseif (Method == "FindPartOnRay" or Method == "findPartOnRay") and Config.Method:lower() == Method:lower() then
      if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRay) then
         local A_Ray = Arguments[2]

         local HitPart = getClosestPlayer()
         if HitPart then
            local Origin = A_Ray.Origin
            local Direction = getDirection(Origin, HitPart.Position)
            Arguments[2] = Ray.new(Origin, Direction)

            return oldNamecall(unpack(Arguments))
         end
      end
   elseif Method == "Raycast" and Config.Method == Method then
      if ValidateArguments(Arguments, ExpectedArguments.Raycast) then
         local A_Origin = Arguments[2]

         local HitPart = getClosestPlayer()
         if HitPart then
            Arguments[3] = getDirection(A_Origin, HitPart.Position)

            return oldNamecall(unpack(Arguments))
         end
      end
   end
end
return oldNamecall(...)
end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Silent Aim - Semi rage",
   Callback = function()
   local players = game:GetService("Players")
local player = players.LocalPlayer or players.PlayerAdded:Wait()
local mouse = player:GetMouse()

local Config = {
   Enabled = true,
   TeamCheck = false,
   HitPart = "Head",
   Method = "Raycast",
   FieldOfView = {
      Enabled = true,
      Radius = 25
   }
}

local friend_check = {}

local ExpectedArguments = {
   FindPartOnRayWithIgnoreList = {
      ArgCountRequired = 3,
      Args = {
         "Instance", "Ray", "table", "boolean", "boolean"
      }
   },
   FindPartOnRayWithWhitelist = {
      ArgCountRequired = 3,
      Args = {
         "Instance", "Ray", "table", "boolean"
      }
   },
   FindPartOnRay = {
      ArgCountRequired = 2,
      Args = {
         "Instance", "Ray", "Instance", "boolean", "boolean"
      }
   },
   Raycast = {
      ArgCountRequired = 3,
      Args = {
         "Instance", "Vector3", "Vector3", "RaycastParams"
      }
   }
}

local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local GetChildren = game.GetChildren
local WorldToScreen = Camera.WorldToScreenPoint
local FindFirstChild = game.FindFirstChild

local function getPositionOnScreen(Vector)
   local Vec3, OnScreen = WorldToScreen(Camera, Vector)
   return Vector2.new(Vec3.X, Vec3.Y), OnScreen
end

local function ValidateArguments(Args, RayMethod)
   local Matches = 0
   if #Args < RayMethod.ArgCountRequired then
      return false
   end
   for Pos, Argument in next, Args do
      if typeof(Argument) == RayMethod.Args[Pos] then
         Matches = Matches + 1
      end
   end
   return Matches >= RayMethod.ArgCountRequired
end

local function getDirection(Origin, Position)
   return (Position - Origin).Unit * 1000
end

local function getMousePosition()
   return Vector2.new(Mouse.X, Mouse.Y)
end

local function getClosestPlayer()
   if not Config.HitPart then return end
   local Closest
   local DistanceToMouse
   for _, Player in next, GetChildren(Players) do
      if Player == LocalPlayer then continue end
      if Config.TeamCheck and Player.Team == LocalPlayer.Team then continue end

      local Character = Player.Character

      if not Character then continue end

      local HumanoidRootPart = FindFirstChild(Character, "HumanoidRootPart")
      local Humanoid = FindFirstChild(Character, "Humanoid")

      if not HumanoidRootPart or not Humanoid or Humanoid and Humanoid.Health <= 0 and not table.find(friend_check, Player.Name) then continue end

      local ScreenPosition, OnScreen = getPositionOnScreen(HumanoidRootPart.Position)

      if not OnScreen then continue end

      local Distance = (getMousePosition() - ScreenPosition).Magnitude
      if Distance <= (DistanceToMouse or (Config.FieldOfView.Enabled and Config.FieldOfView.Radius) or 2000) then
         Closest = Character[Config.HitPart]
         DistanceToMouse = Distance
      end
   end
   return Closest
end

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(...)
local Method = getnamecallmethod()
local Arguments = {...}
local self = Arguments[1]

if Config.Enabled and self == workspace then
   if Method == "FindPartOnRayWithIgnoreList" and Config.Method == Method then
      if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithIgnoreList) then
         local A_Ray = Arguments[2]

         local HitPart = getClosestPlayer()
         if HitPart then
            local Origin = A_Ray.Origin
            local Direction = getDirection(Origin, HitPart.Position)
            Arguments[2] = Ray.new(Origin, Direction)

            return oldNamecall(unpack(Arguments))
         end
      end
   elseif Method == "FindPartOnRayWithWhitelist" and Config.Method == Method then
      if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithWhitelist) then
         local A_Ray = Arguments[2]

         local HitPart = getClosestPlayer()
         if HitPart then
            local Origin = A_Ray.Origin
            local Direction = getDirection(Origin, HitPart.Position)
            Arguments[2] = Ray.new(Origin, Direction)

            return oldNamecall(unpack(Arguments))
         end
      end
   elseif (Method == "FindPartOnRay" or Method == "findPartOnRay") and Config.Method:lower() == Method:lower() then
      if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRay) then
         local A_Ray = Arguments[2]

         local HitPart = getClosestPlayer()
         if HitPart then
            local Origin = A_Ray.Origin
            local Direction = getDirection(Origin, HitPart.Position)
            Arguments[2] = Ray.new(Origin, Direction)

            return oldNamecall(unpack(Arguments))
         end
      end
   elseif Method == "Raycast" and Config.Method == Method then
      if ValidateArguments(Arguments, ExpectedArguments.Raycast) then
         local A_Origin = Arguments[2]

         local HitPart = getClosestPlayer()
         if HitPart then
            Arguments[3] = getDirection(A_Origin, HitPart.Position)

            return oldNamecall(unpack(Arguments))
         end
      end
   end
end
return oldNamecall(...)
end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Silent Aim - RAGE",
   Callback = function()
   local players = game:GetService("Players")
local player = players.LocalPlayer or players.PlayerAdded:Wait()
local mouse = player:GetMouse()

local Config = {
   Enabled = true,
   TeamCheck = false,
   HitPart = "Head",
   Method = "Raycast",
   FieldOfView = {
      Enabled = true,
      Radius = 150
   }
}

local friend_check = {}

local ExpectedArguments = {
   FindPartOnRayWithIgnoreList = {
      ArgCountRequired = 3,
      Args = {
         "Instance", "Ray", "table", "boolean", "boolean"
      }
   },
   FindPartOnRayWithWhitelist = {
      ArgCountRequired = 3,
      Args = {
         "Instance", "Ray", "table", "boolean"
      }
   },
   FindPartOnRay = {
      ArgCountRequired = 2,
      Args = {
         "Instance", "Ray", "Instance", "boolean", "boolean"
      }
   },
   Raycast = {
      ArgCountRequired = 3,
      Args = {
         "Instance", "Vector3", "Vector3", "RaycastParams"
      }
   }
}

local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local GetChildren = game.GetChildren
local WorldToScreen = Camera.WorldToScreenPoint
local FindFirstChild = game.FindFirstChild

local function getPositionOnScreen(Vector)
   local Vec3, OnScreen = WorldToScreen(Camera, Vector)
   return Vector2.new(Vec3.X, Vec3.Y), OnScreen
end

local function ValidateArguments(Args, RayMethod)
   local Matches = 0
   if #Args < RayMethod.ArgCountRequired then
      return false
   end
   for Pos, Argument in next, Args do
      if typeof(Argument) == RayMethod.Args[Pos] then
         Matches = Matches + 1
      end
   end
   return Matches >= RayMethod.ArgCountRequired
end

local function getDirection(Origin, Position)
   return (Position - Origin).Unit * 1000
end

local function getMousePosition()
   return Vector2.new(Mouse.X, Mouse.Y)
end

local function getClosestPlayer()
   if not Config.HitPart then return end
   local Closest
   local DistanceToMouse
   for _, Player in next, GetChildren(Players) do
      if Player == LocalPlayer then continue end
      if Config.TeamCheck and Player.Team == LocalPlayer.Team then continue end

      local Character = Player.Character

      if not Character then continue end

      local HumanoidRootPart = FindFirstChild(Character, "HumanoidRootPart")
      local Humanoid = FindFirstChild(Character, "Humanoid")

      if not HumanoidRootPart or not Humanoid or Humanoid and Humanoid.Health <= 0 and not table.find(friend_check, Player.Name) then continue end

      local ScreenPosition, OnScreen = getPositionOnScreen(HumanoidRootPart.Position)

      if not OnScreen then continue end

      local Distance = (getMousePosition() - ScreenPosition).Magnitude
      if Distance <= (DistanceToMouse or (Config.FieldOfView.Enabled and Config.FieldOfView.Radius) or 2000) then
         Closest = Character[Config.HitPart]
         DistanceToMouse = Distance
      end
   end
   return Closest
end

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(...)
local Method = getnamecallmethod()
local Arguments = {...}
local self = Arguments[1]

if Config.Enabled and self == workspace then
   if Method == "FindPartOnRayWithIgnoreList" and Config.Method == Method then
      if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithIgnoreList) then
         local A_Ray = Arguments[2]

         local HitPart = getClosestPlayer()
         if HitPart then
            local Origin = A_Ray.Origin
            local Direction = getDirection(Origin, HitPart.Position)
            Arguments[2] = Ray.new(Origin, Direction)

            return oldNamecall(unpack(Arguments))
         end
      end
   elseif Method == "FindPartOnRayWithWhitelist" and Config.Method == Method then
      if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithWhitelist) then
         local A_Ray = Arguments[2]

         local HitPart = getClosestPlayer()
         if HitPart then
            local Origin = A_Ray.Origin
            local Direction = getDirection(Origin, HitPart.Position)
            Arguments[2] = Ray.new(Origin, Direction)

            return oldNamecall(unpack(Arguments))
         end
      end
   elseif (Method == "FindPartOnRay" or Method == "findPartOnRay") and Config.Method:lower() == Method:lower() then
      if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRay) then
         local A_Ray = Arguments[2]

         local HitPart = getClosestPlayer()
         if HitPart then
            local Origin = A_Ray.Origin
            local Direction = getDirection(Origin, HitPart.Position)
            Arguments[2] = Ray.new(Origin, Direction)

            return oldNamecall(unpack(Arguments))
         end
      end
   elseif Method == "Raycast" and Config.Method == Method then
      if ValidateArguments(Arguments, ExpectedArguments.Raycast) then
         local A_Origin = Arguments[2]

         local HitPart = getClosestPlayer()
         if HitPart then
            Arguments[3] = getDirection(A_Origin, HitPart.Position)

            return oldNamecall(unpack(Arguments))
         end
      end
   end
end
return oldNamecall(...)
end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Inf stamina",
   Callback = function()
while task.wait() do
    game:GetService("Players").LocalPlayer.Valuestats.Stamina.Value = 100000
end
   end,
})



local Toggle = MainTab:CreateToggle({
   Name = "Noah777",
   CurrentValue = false,
   Flag = "Toggle1", 
   Callback = function(Value)
   local TextChatService = cloneref(game:GetService("TextChatService"))
local Players = cloneref(game:GetService("Players"))

local TextChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

local function SendAsync(Message: string)
  TextChannel:SendAsync(Message)
end

task.spawn(SendAsync, "/e shoot")
   end,
})

local Button = MainTab:CreateButton({
   Name = "15k inf cash - on shoes//guns only",
   Callback = function()
while task.wait()do
    game:GetService("Players").LocalPlayer.Valuestats.Wallet.Value = 15000
end
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Walkspeed Slider",
   Range = {0, 45},
   Increment = 1,
   Suffix = "Walk",
   CurrentValue = 16,
   Flag = "Slider1", 
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value  
   end,
})

local MainTab = Window:CreateTab("Just ESP", nil) 
local MainSection = MainTab:CreateSection("Esp Visuals")

local Button = MainTab:CreateButton({
   Name = "ESP",
   Callback = function()
   local Settings = {
    Box_Color = Color3.fromRGB(255, 0, 0),
    Tracer_Color = Color3.fromRGB(255, 0, 0),
    Tracer_Thickness = 1,
    Box_Thickness = 1,
    Tracer_Origin = "Bottom", 
    Tracer_FollowMouse = false,
    Tracers = true
}
local Team_Check = {
    TeamCheck = false, 
    Green = Color3.fromRGB(0, 255, 0),
    Red = Color3.fromRGB(255, 0, 0)
}
local TeamColor = true

--// SEPARATION
local player = game:GetService("Players").LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local mouse = player:GetMouse()

local function NewQuad(thickness, color)
    local quad = Drawing.new("Quad")
    quad.Visible = false
    quad.PointA = Vector2.new(0,0)
    quad.PointB = Vector2.new(0,0)
    quad.PointC = Vector2.new(0,0)
    quad.PointD = Vector2.new(0,0)
    quad.Color = color
    quad.Filled = false
    quad.Thickness = thickness
    quad.Transparency = 1
    return quad
end

local function NewLine(thickness, color)
    local line = Drawing.new("Line")
    line.Visible = false
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(0, 0)
    line.Color = color 
    line.Thickness = thickness
    line.Transparency = 1
    return line
end

local function Visibility(state, lib)
    for u, x in pairs(lib) do
        x.Visible = state
    end
end

local function ToColor3(col) 
    local r = col.r 
    local g = col.g 
    local b = col.b 
    return Color3.new(r,g,b);
end

local black = Color3.fromRGB(0, 0 ,0)
local function ESP(plr)
    local library = {
        
        blacktracer = NewLine(Settings.Tracer_Thickness*2, black),
        tracer = NewLine(Settings.Tracer_Thickness, Settings.Tracer_Color),
        
        black = NewQuad(Settings.Box_Thickness*2, black),
        box = NewQuad(Settings.Box_Thickness, Settings.Box_Color),
       
        healthbar = NewLine(3, black),
        greenhealth = NewLine(1.5, black)
    }

    local function Colorize(color)
        for u, x in pairs(library) do
            if x ~= library.healthbar and x ~= library.greenhealth and x ~= library.blacktracer and x ~= library.black then
                x.Color = color
            end
        end
    end

    local function Updater()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("Head") ~= nil then
                local HumPos, OnScreen = camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                if OnScreen then
                    local head = camera:WorldToViewportPoint(plr.Character.Head.Position)
                    local DistanceY = math.clamp((Vector2.new(head.X, head.Y) - Vector2.new(HumPos.X, HumPos.Y)).magnitude, 2, math.huge)
                    
                    local function Size(item)
                        item.PointA = Vector2.new(HumPos.X + DistanceY, HumPos.Y - DistanceY*2)
                        item.PointB = Vector2.new(HumPos.X - DistanceY, HumPos.Y - DistanceY*2)
                        item.PointC = Vector2.new(HumPos.X - DistanceY, HumPos.Y + DistanceY*2)
                        item.PointD = Vector2.new(HumPos.X + DistanceY, HumPos.Y + DistanceY*2)
                    end
                    Size(library.box)
                    Size(library.black)

                    --//Tracer 
                    if Settings.Tracers then
                        if Settings.Tracer_Origin == "Middle" then
                            library.tracer.From = camera.ViewportSize*0.5
                            library.blacktracer.From = camera.ViewportSize*0.5
                        elseif Settings.Tracer_Origin == "Bottom" then
                            library.tracer.From = Vector2.new(camera.ViewportSize.X*0.5, camera.ViewportSize.Y) 
                            library.blacktracer.From = Vector2.new(camera.ViewportSize.X*0.5, camera.ViewportSize.Y)
                        end
                        if Settings.Tracer_FollowMouse then
                            library.tracer.From = Vector2.new(mouse.X, mouse.Y+36)
                            library.blacktracer.From = Vector2.new(mouse.X, mouse.Y+36)
                        end
                        library.tracer.To = Vector2.new(HumPos.X, HumPos.Y + DistanceY*2)
                        library.blacktracer.To = Vector2.new(HumPos.X, HumPos.Y + DistanceY*2)
                    else 
                        library.tracer.From = Vector2.new(0, 0)
                        library.blacktracer.From = Vector2.new(0, 0)
                        library.tracer.To = Vector2.new(0, 0)
                        library.blacktracer.To = Vector2.new(0, 02)
                    end

                  
                    local d = (Vector2.new(HumPos.X - DistanceY, HumPos.Y - DistanceY*2) - Vector2.new(HumPos.X - DistanceY, HumPos.Y + DistanceY*2)).magnitude 
                    local healthoffset = plr.Character.Humanoid.Health/plr.Character.Humanoid.MaxHealth * d

                    library.greenhealth.From = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY*2)
                    library.greenhealth.To = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY*2 - healthoffset)

                    library.healthbar.From = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY*2)
                    library.healthbar.To = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y - DistanceY*2)

                    local green = Color3.fromRGB(0, 255, 0)
                    local red = Color3.fromRGB(255, 0, 0)

                    library.greenhealth.Color = red:lerp(green, plr.Character.Humanoid.Health/plr.Character.Humanoid.MaxHealth);

                    if Team_Check.TeamCheck then
                        if plr.TeamColor == player.TeamColor then
                            Colorize(Team_Check.Green)
                        else 
                            Colorize(Team_Check.Red)
                        end
                    else 
                        library.tracer.Color = Settings.Tracer_Color
                        library.box.Color = Settings.Box_Color
                    end
                    if TeamColor == true then
                        Colorize(plr.TeamColor.Color)
                    end
                    Visibility(true, library)
                else 
                    Visibility(false, library)
                end
            else 
                Visibility(false, library)
                if game.Players:FindFirstChild(plr.Name) == nil then
                    connection:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(Updater)()
end

for i, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name ~= player.Name then
        coroutine.wrap(ESP)(v)
    end
end

game.Players.PlayerAdded:Connect(function(newplr)
    if newplr.Name ~= player.Name then
        coroutine.wrap(ESP)(newplr)
    end
end)
   end,
})

local TeleportsTab = Window:CreateTab("Main Teleports", nil) 

local Section = TeleportsTab:CreateSection("Places")

local Button = TeleportsTab:CreateButton({
   Name = "Ultimate Drip",
   Callback = function()
   local TextChatService = cloneref(game:GetService("TextChatService"))
local Players = cloneref(game:GetService("Players"))

local TextChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

local function SendAsync(Message: string)
  TextChannel:SendAsync(Message)
end

task.spawn(SendAsync, "/respawn") 
Players.LocalPlayer.CharacterAdded:Wait() 

local LocalPrimaryPart = Players.LocalPlayer.Character.PrimaryPart or Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

LocalPrimaryPart.CFrame = game:GetService("ReplicatedStorage").TrackQuestLocations.UltimateDrip.CFrame
   end,
})

local Button = TeleportsTab:CreateButton({
   Name = "Bank Of SouthLondon",
   Callback = function()
    local TextChatService = cloneref(game:GetService("TextChatService"))
local Players = cloneref(game:GetService("Players"))

local TextChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

local function SendAsync(Message: string)
  TextChannel:SendAsync(Message)
end

task.spawn(SendAsync, "/respawn") 
Players.LocalPlayer.CharacterAdded:Wait() 
local LocalPrimaryPart = Players.LocalPlayer.Character.PrimaryPart or Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

LocalPrimaryPart.CFrame = workspace.Teleports["Bank Of South London"]["Bank Of South London"].CFrame
   end,
})

local Button = TeleportsTab:CreateButton({
   Name = "Sports Clothing",
   Callback = function()
   local TextChatService = cloneref(game:GetService("TextChatService"))
local Players = cloneref(game:GetService("Players"))

local TextChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

local function SendAsync(Message: string)
  TextChannel:SendAsync(Message)
end

task.spawn(SendAsync, "/respawn") 
Players.LocalPlayer.CharacterAdded:Wait() 

local LocalPrimaryPart = Players.LocalPlayer.Character.PrimaryPart or Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

LocalPrimaryPart.CFrame = workspace.TeleportsBack["Sports Shop"].CFrame
   end,
})

local Button = TeleportsTab:CreateButton({
   Name = "GunStore Main",
   Callback = function()
   local TextChatService = cloneref(game:GetService("TextChatService"))
local Players = cloneref(game:GetService("Players"))

local TextChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

local function SendAsync(Message: string)
  TextChannel:SendAsync(Message)
end

task.spawn(SendAsync, "/respawn") 
Players.LocalPlayer.CharacterAdded:Wait() 

local LocalPrimaryPart = Players.LocalPlayer.Character.PrimaryPart or Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

LocalPrimaryPart.CFrame = game:GetService("ReplicatedStorage").TrackQuestLocations.Gunstore.CFrame
   end,
})

local Button = TeleportsTab:CreateButton({
   Name = "Gunstore 2",
   Callback = function()
   local TextChatService = cloneref(game:GetService("TextChatService"))
local Players = cloneref(game:GetService("Players"))

local TextChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

local function SendAsync(Message: string)
  TextChannel:SendAsync(Message)
end

task.spawn(SendAsync, "/respawn") 
Players.LocalPlayer.CharacterAdded:Wait() 
local LocalPrimaryPart = Players.LocalPlayer.Character.PrimaryPart or Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

LocalPrimaryPart.CFrame = game:GetService("ReplicatedStorage").TrackQuestLocations.Gunstore2.CFrame
   end,
})

local Button = TeleportsTab:CreateButton({
   Name = "Apt 1",
   Callback = function()
   local TextChatService = cloneref(game:GetService("TextChatService"))
local Players = cloneref(game:GetService("Players"))

local TextChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

local function SendAsync(Message: string)
  TextChannel:SendAsync(Message)
end

task.spawn(SendAsync, "/respawn") 
Players.LocalPlayer.CharacterAdded:Wait() 

local LocalPrimaryPart = Players.LocalPlayer.Character.PrimaryPart or Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

LocalPrimaryPart.CFrame = game:GetService("ReplicatedStorage").TutorialCams.APT2.CFrame
   end,
})

local Button = TeleportsTab:CreateButton({
   Name = "Apt 3",
   Callback = function()
   local TextChatService = cloneref(game:GetService("TextChatService"))
local Players = cloneref(game:GetService("Players"))

local TextChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

local function SendAsync(Message: string)
  TextChannel:SendAsync(Message)
end

task.spawn(SendAsync, "/respawn") 
Players.LocalPlayer.CharacterAdded:Wait() 

local LocalPrimaryPart = Players.LocalPlayer.Character.PrimaryPart or Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

LocalPrimaryPart.CFrame = game:GetService("ReplicatedStorage").TutorialCams.APT1.CFrame
   end,
})

local Button = TeleportsTab:CreateButton({
   Name = "Apt 2 ",
   Callback = function()
   local TextChatService = cloneref(game:GetService("TextChatService"))
local Players = cloneref(game:GetService("Players"))

local TextChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

local function SendAsync(Message: string)
  TextChannel:SendAsync(Message)
end

task.spawn(SendAsync, "/respawn")
Players.LocalPlayer.CharacterAdded:Wait() 

local LocalPrimaryPart = Players.LocalPlayer.Character.PrimaryPart or Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

LocalPrimaryPart.CFrame = game:GetService("ReplicatedStorage").TutorialCams.APT3.CFrame
   end,
})

local Button = TeleportsTab:CreateButton({
   Name = "Casino",
   Callback = function()
   local TextChatService = cloneref(game:GetService("TextChatService"))
local Players = cloneref(game:GetService("Players"))

local TextChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

local function SendAsync(Message: string)
  TextChannel:SendAsync(Message)
end

task.spawn(SendAsync, "/respawn") 
Players.LocalPlayer.CharacterAdded:Wait()

local LocalPrimaryPart = Players.LocalPlayer.Character.PrimaryPart or Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

LocalPrimaryPart.CFrame = game:GetService("ReplicatedStorage").TrackQuestLocations.Casino.CFrame
   end,
})

local Button = TeleportsTab:CreateButton({
   Name = "PoliceStation",
   Callback = function()
   local TextChatService = cloneref(game:GetService("TextChatService"))
local Players = cloneref(game:GetService("Players"))

local TextChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

local function SendAsync(Message: string)
  TextChannel:SendAsync(Message)
end

task.spawn(SendAsync, "/respawn") 
Players.LocalPlayer.CharacterAdded:Wait() 

local LocalPrimaryPart = Players.LocalPlayer.Character.PrimaryPart or Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

LocalPrimaryPart.CFrame = workspace.Teleports["Police Station"].CFrame
   end,
})






