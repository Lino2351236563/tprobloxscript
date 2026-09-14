local Rayfield = loadstring(game:HttpGet('https://sirius.menu'))()
local Window = Rayfield:CreateWindow({
   Name = "TSB Teleport Menu",
   LoadingTitle = "Загрузка скрипта...",
   LoadingSubtitle = "by Lino",
   ConfigurationSaving = { Enabled = false }
})

local MainTab = Window:CreateTab("Функции", 4483363487)
MainTab:CreateButton({
   Name = "Телепорт к случайному челу",
   Callback = function()
      local players = game:GetService("Players"):GetPlayers()
      local localPlayer = game:GetService("Players").LocalPlayer
      local targets = {}

      for _, p in ipairs(players) do
         if p ~= localPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(targets, p)
         end
      end

      if #targets > 0 then
         local randomPlayer = targets[math.random(1, #targets)]
         if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            localPlayer.Character.HumanoidRootPart.CFrame = randomPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
            Rayfield:Notify({Title = "Успех!", Content = "Телепортирован к: " .. randomPlayer.Name, Duration = 3})
         end
      else
         Rayfield:Notify({Title = "Ошибка", Content = "Не к кому телепортироваться!", Duration = 3})
      end
   end,
})
