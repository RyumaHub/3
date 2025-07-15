local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
   Name = "RESIDENCE MASSACRE RYUMA HUB",
   Icon = "file",
   LoadingTitle = "RYUMA",
   LoadingSubtitle = "By RYUMA",
   Theme = "DarkBlue",
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,
   ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "RMN1"
   },
   Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = true
   },
   KeySystem = false
})
local TabMain = Window:CreateTab("Main", "rewind")
local TabLocalPlayer = Window:CreateTab("LocalPlayer", "user")
local InfiniteStats = loadstring(game:HttpGet("https://raw.githubusercontent.com/RyumaHub/3/main/RYUMA-HUB/modules/infinite-stats.lua"))()
local AFKMode = loadstring(game:HttpGet("https://raw.githubusercontent.com/RyumaHub/3/main/RYUMA-HUB/modules/afk-mode.lua"))()
local LocalUtils = loadstring(game:HttpGet("https://raw.githubusercontent.com/RyumaHub/3/main/RYUMA-HUB/modules/localplayer-utils.lua"))()
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/RyumaHub/3/main/RYUMA-HUB/modules/esp-mutant.lua"))()
InfiniteStats(TabMain)
AFKMode(TabMain)
LocalUtils(TabLocalPlayer)
ESP(TabLocalPlayer)
Rayfield:LoadConfiguration()
