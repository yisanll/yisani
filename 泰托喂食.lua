local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Yisan886/Aero/refs/heads/main/ui.lua.txt"))()

WindUI:AddTheme({
    Name = "My Theme",
    Accent = Color3.fromHex("#18181b"),
    Background = Color3.fromHex("#101010"),
    Outline = Color3.fromHex("#FFFFFF"),
    Text = Color3.fromHex("#FFFFFF"),
    Placeholder = Color3.fromHex("#7a7a7a"),
    Button = Color3.fromHex("#52525b"),
    Icon = Color3.fromHex("#a1a1aa"),
})

local Window = WindUI:CreateWindow({
    Title = "Aero      ",
    Folder = "Aero",
    SideBarWidth = 180,
    Background = "https://chaton-images.s3.us-east-2.amazonaws.com/GHn9L9UJLf0XcVNyCpbG72D0rmNmBEWndPkh6CjJNya8GLnWzz1vImvt8wlJSBwv_2700x1519x1393696.jpeg", -- video 
    BackgroundImageTransparency = 0.5,
    OpenButton = {
        Title = "打开脚本",
        CornerRadius = UDim.new(1, 0),
        StrokeThickness = 3,
        Enabled = true,
        Draggable = true,
        OnlyMobile = false,
        Scale = 0.9,
        Color = ColorSequence.new(
            Color3.fromHex("#30FF6A"),
            Color3.fromHex("#e7ff2f")
        ),
    },
    Topbar = {
        Height = 44,
        ButtonsType = "Mac",
    },
})

Window:Tag({
    Title = "V1.03",
    Color = Color3.fromHex("00CED1"),
    Radius = 2,
})

Window:Tag({
    Title = "伊散",
    Icon = "crown",
    Color = Color3.fromHex("FFD700"),
    Radius = 2,
})

Window:Tag({
    Title = "蛙蛙",
    Icon = "square-chevron-right",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 2,
})

Window:Tag({
    Title = "苏达",
    Icon = "square-chevron-right",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 2,
})

local COLOR_SCHEMES = {
    ["彩虹颜色"] = {ColorSequence.new({
        ColorSequenceKeypoint.new(0,    Color3.fromHex("FF0000")),
        ColorSequenceKeypoint.new(0.16, Color3.fromHex("FFA500")),
        ColorSequenceKeypoint.new(0.33, Color3.fromHex("FFFF00")),
        ColorSequenceKeypoint.new(0.5,  Color3.fromHex("00FF00")),
        ColorSequenceKeypoint.new(0.66, Color3.fromHex("0000FF")),
        ColorSequenceKeypoint.new(0.83, Color3.fromHex("4B0082")),
        ColorSequenceKeypoint.new(1,    Color3.fromHex("EE82EE"))
    }), "palette"},

    ["绿黄渐变"] = {ColorSequence.new({
        ColorSequenceKeypoint.new(0,   Color3.fromHex("30FF6A")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("a8ff00")),
        ColorSequenceKeypoint.new(1,   Color3.fromHex("e7ff2f"))
    }), "waves"},
}

local borderAnimation
local animationSpeed = 5

local function createRainbowBorder(window, colorScheme)
    local mainFrame = window.UIElements.Main
    if not mainFrame then return nil end

    local existingStroke = mainFrame:FindFirstChild("RainbowStroke")
    if existingStroke then existingStroke:Destroy() end

    if not mainFrame:FindFirstChildOfClass("UICorner") then
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 16)
        corner.Parent = mainFrame
    end

    local rainbowStroke = Instance.new("UIStroke")
    rainbowStroke.Name = "RainbowStroke"
    rainbowStroke.Thickness = 2
    rainbowStroke.Color = Color3.new(1, 1, 1)
    rainbowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    rainbowStroke.LineJoinMode = Enum.LineJoinMode.Round
    rainbowStroke.Parent = mainFrame

    local glowEffect = Instance.new("UIGradient")
    glowEffect.Name = "GlowEffect"
    local schemeData = COLOR_SCHEMES[colorScheme or "彩虹颜色"]
    glowEffect.Color = schemeData and schemeData[1] or COLOR_SCHEMES["彩虹颜色"][1]
    glowEffect.Rotation = 0
    glowEffect.Parent = rainbowStroke

    return rainbowStroke
end

local function startBorderAnimation(window, speed)
    local mainFrame = window.UIElements.Main
    if not mainFrame then return nil end
    local rainbowStroke = mainFrame:FindFirstChild("RainbowStroke")
    if not rainbowStroke then return nil end
    local glowEffect = rainbowStroke:FindFirstChild("GlowEffect")
    if not glowEffect then return nil end

    return game:GetService("RunService").Heartbeat:Connect(function()
        if not rainbowStroke or rainbowStroke.Parent == nil then return end
        glowEffect.Rotation = (tick() * speed * 10) % 360
    end)
end

local rainbowStroke = createRainbowBorder(Window, "彩虹颜色")
if rainbowStroke then
    borderAnimation = startBorderAnimation(Window, animationSpeed)
end

local Lighting = game:GetService("Lighting")
local TweenServiceBlur = game:GetService("TweenService")

local blur = Lighting:FindFirstChildOfClass("BlurEffect")
if not blur then
    blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = Lighting
end

task.spawn(function()
    local wasOpen = false
    while true do
        task.wait(0.1)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        local isOpen = mainFrame and mainFrame.Visible or false
        
        if isOpen ~= wasOpen then
            wasOpen = isOpen
            TweenServiceBlur:Create(blur, TweenInfo.new(0.3), {
                Size = isOpen and 20 or 0
            }):Play()
        end
    end
end)

local v3 = game:GetService("Players")
local v4 = v3.LocalPlayer
local v5 = v4 and v4.Name or "anshenkoike87"
local r1 = false
local r2 = nil
local r3 = nil
local function r4()
    if r3 then return r3 end
    local v6 = workspace:FindFirstChild("Plots")
    if v6 then
        local v7 = v6:FindFirstChild(v5 .. "_Plot")
        if v7 then
            local v8 = v7:FindFirstChild("Teto")
            if v8 then
                local v9 = v8:FindFirstChild("Teto")
                if v9 then
                    r3 = v9:FindFirstChild("ClickDetector")
                end
            end
        end
    end
    return r3
end
local function r5()
    if r2 then return end
    r1 = true
    r2 = task.spawn(function()
        while r1 do
            local v10 = r4()
            if v10 then
                pcall(function() fireclickdetector(v10) end)
            end
            task.wait(0.01)
        end
        r2 = nil
    end)
    WindUI:Notify({ Title = "自动喂食", Content = "已开启", Duration = 2 })
end
local function r6()
    r1 = false
    if r2 then
        task.cancel(r2)
        r2 = nil
    end
    WindUI:Notify({ Title = "自动喂食", Content = "已关闭", Duration = 2 })
end
local v11=Window:Tab({Title="自动化"})
local v12 = v11:Section({ Title = "主要", IconName = "cookie" })
v12:Toggle({
    Title = "自动喂食",
    Value = false,
    FeatureName = "AutoFeed",
    Icon = "zap",
    ConfigKey = "auto_feed",
    Tooltip = "循环触发泰托的 ClickDetector",
    Callback = function(r7)
        if r7 then r5() else r6() end
    end
})
local r8 = false
local r9 = nil
local function r10()
    if r9 then return end
    r8 = true
    r9 = task.spawn(function()
        while r8 do
            local v13 = game:GetService("ReplicatedStorage"):FindFirstChild("FeedTheTetoRemotes")
            if v13 then
                local v14 = v13:FindFirstChild("RequestRebirth")
                if v14 then
                    pcall(function() v14:FireServer() end)
                end
            end
            task.wait(1)
        end
        r9 = nil
    end)
    WindUI:Notify({ Title = "自动重生", Content = "已开启，每秒请求一次", Duration = 2 })
end
local function r11()
    r8 = false
    if r9 then
        task.cancel(r9)
        r9 = nil
    end
    WindUI:Notify({ Title = "自动重生", Content = "已关闭", Duration = 2 })
end
v12:Toggle({
    Title = "自动重生",
    Value = false,
    FeatureName = "AutoRebirth",
    Icon = "refresh-cw",
    ConfigKey = "auto_rebirth",
    Tooltip = "每秒发送重生请求",
    Callback = function(r12)
        if r12 then r10() else r11() end
    end
})
local r13 = false
local r14 = nil
local function r15()
    if r14 then return end
    r13 = true
    r14 = task.spawn(function()
        while r13 do
            local v15 = workspace:FindFirstChild("LocalUSTNotes")
            if v15 then
                local v16 = game:GetService("ReplicatedStorage"):FindFirstChild("FeedTheTetoRemotes")
                if v16 then
                    local v17 = v16:FindFirstChild("CollectUST")
                    if v17 then
                        local rNotes = v15:GetChildren()
                        for rIndex = 1, #rNotes do
                            local rNote = rNotes[rIndex]
                            if rNote and rNote.Parent then
                                local rUUID = rNote:GetAttribute("UUID")
                                if rUUID and rUUID ~= "" then
                                    pcall(function()
                                        v17:FireServer(rUUID)
                                    end)
                                    task.wait(0.02)
                                end
                            end
                        end
                    end
                end
            end
            task.wait(0.15)
        end
        r14 = nil
    end)
    WindUI:Notify({ Title = "自动拾取音符", Content = "已开启", Duration = 2 })
end
local function r18()
    r13 = false
    if r14 then
        task.cancel(r14)
        r14 = nil
    end
    WindUI:Notify({ Title = "自动拾取音符", Content = "已关闭", Duration = 2 })
end
v12:Toggle({
    Title = "自动拾取音符",
    Value = false,
    FeatureName = "AutoCollectUST",
    Icon = "music",
    ConfigKey = "auto_collect_ust",
    Tooltip = "自动拾取地图上的所有音符",
    Callback = function(r19)
        if r19 then r15() else r18() end
    end
})

-- ========== 新增角色选项卡 ==========
local r40 = true
local v18 = game:GetService("UserInputService")
v18.InputBegan:Connect(function(r21, r22)
    if r22 then return end
    if r21.KeyCode == Enum.KeyCode.F1 then
        r40 = not r40
        v2:SetVisible(r40)
    end
end)

local v40=Window:Tab({Title="角色"})
local v41 = v40:Section({ Title = "角色增强", IconName = "user" })

-- 加速
local r42 = false
local r43 = nil
local r44 = 35
local function r45()
    if r43 then return end
    r42 = true
    r43 = task.spawn(function()
        while r42 do
            local v45 = v4.Character
            if v45 then
                local v46 = v45:FindFirstChildOfClass("Humanoid")
                if v46 then
                    v46.WalkSpeed = r44
                end
            end
            task.wait(0.5)
        end
        r43 = nil
    end)
    WindUI:Notify({ Title = "加速", Content = "已开启", Duration = 2 })
end
local function r46()
    r42 = false
    if r43 then
        task.cancel(r43)
        r43 = nil
    end
    local v45 = v4.Character
    if v45 then
        local v46 = v45:FindFirstChildOfClass("Humanoid")
        if v46 then
            v46.WalkSpeed = 16
        end
    end
    WindUI:Notify({ Title = "加速", Content = "已关闭", Duration = 2 })
end
v41:Toggle({
    Title = "加速",
    Value = false,
    FeatureName = "SpeedHack",
    Icon = "zap",
    ConfigKey = "speed_toggle",
    Tooltip = "提高移动速度",
    Callback = function(r47)
        if r47 then r45() else r46() end
    end
})
v41:Slider({
    Title = "速度值",
    Min = 20,
    Max = 100,
    Default = 35,
    ConfigKey = "speed_value",
    Tooltip = "调整加速倍数",
    Callback = function(r48)
        r44 = r48
        if r42 then
            local v45 = v4.Character
            if v45 then
                local v46 = v45:FindFirstChildOfClass("Humanoid")
                if v46 then
                    v46.WalkSpeed = r44
                end
            end
        end
    end
})

-- 穿墙
local r49 = false
local r50 = nil
local function r51()
    if r50 then return end
    r49 = true
    r50 = task.spawn(function()
        while r49 do
            local v47 = v4.Character
            if v47 then
                for _, rPart in ipairs(v47:GetDescendants()) do
                    if rPart:IsA("BasePart") then
                        rPart.CanCollide = false
                    end
                end
            end
            task.wait(0.3)
        end
        r50 = nil
    end)
    WindUI:Notify({ Title = "穿墙", Content = "已开启", Duration = 2 })
end
local function r52()
    r49 = false
    if r50 then
        task.cancel(r50)
        r50 = nil
    end
    local v47 = v4.Character
    if v47 then
        for _, rPart in ipairs(v47:GetDescendants()) do
            if rPart:IsA("BasePart") then
                rPart.CanCollide = true
            end
        end
    end
    WindUI:Notify({ Title = "穿墙", Content = "已关闭", Duration = 2 })
end
v41:Toggle({
    Title = "穿墙",
    Value = false,
    FeatureName = "NoClip",
    Icon = "box",
    ConfigKey = "noclip",
    Tooltip = "穿过所有物体",
    Callback = function(r53)
        if r53 then r51() else r52() end
    end
})

-- 反挂机
local r54 = false
local r55 = nil
local function r56()
    if r55 then return end
    r54 = true
    r55 = task.spawn(function()
        local v48 = game:GetService("VirtualUser")
        pcall(function() v48:CaptureController() end)
        while r54 do
            task.wait(30)
            pcall(function()
                v48:ClickButton1(Vector2.new(0, 0), 1)
            end)
        end
        r55 = nil
    end)
    WindUI:Notify({ Title = "反挂机", Content = "已开启，每30秒模拟输入", Duration = 2 })
end
local function r57()
    r54 = false
    if r55 then
        task.cancel(r55)
        r55 = nil
    end
    WindUI:Notify({ Title = "反挂机", Content = "已关闭", Duration = 2 })
end
v41:Toggle({
    Title = "反挂机",
    Value = false,
    FeatureName = "AntiAFK",
    Icon = "shield",
    ConfigKey = "antiafk",
    Tooltip = "模拟按键防止被踢出",
    Callback = function(r58)
        if r58 then r56() else r57() end
    end
})

-- ========== 原有购买选项卡 ==========
local v19=Window:Tab({Title="购买"})
local v20 = v19:Section({ Title = "基础购买", IconName = "shopping-cart" })
v20:Button({
    Text = "点击力量满级",
    Icon = "zap",
    Tooltip = "循环购买点击力量 50 次",
    Callback = function()
        local v21 = game:GetService("ReplicatedStorage"):FindFirstChild("FeedTheTetoRemotes")
        if v21 then
            local v22 = v21:FindFirstChild("BuyUpgrade")
            if v22 then
                local r23 = 0
                for r24 = 1, 50 do
                    local r25 = { "ClickPower", 1 }
                    local r26 = pcall(function()
                        v22:InvokeServer(unpack(r25))
                    end)
                    if r26 then r23 = r23 + 1 end
                    task.wait(0.05)
                end
                WindUI:Notify({ Title = "购买完成", Content = "已成功购买 " .. r23 .. " 次点击力量", Duration = 3 })
            else
                WindUI:Notify({ Title = "错误", Content = "未找到 BuyUpgrade 远程事件", Duration = 2 })
            end
        else
            WindUI:Notify({ Title = "错误", Content = "未找到 FeedTheTetoRemotes 文件夹", Duration = 2 })
        end
    end
})
v20:Button({
    Text = "零食速度满级",
    Icon = "truck",
    Tooltip = "循环购买零食速度 20 次",
    Callback = function()
        local v21 = game:GetService("ReplicatedStorage"):FindFirstChild("FeedTheTetoRemotes")
        if v21 then
            local v22 = v21:FindFirstChild("BuyUpgrade")
            if v22 then
                local r23 = 0
                for r24 = 1, 20 do
                    local r25 = { "MoveSpeed", 1 }
                    local r26 = pcall(function()
                        v22:InvokeServer(unpack(r25))
                    end)
                    if r26 then r23 = r23 + 1 end
                    task.wait(0.05)
                end
                WindUI:Notify({ Title = "购买完成", Content = "已成功购买 " .. r23 .. " 次零食速度", Duration = 3 })
            else
                WindUI:Notify({ Title = "错误", Content = "未找到 BuyUpgrade 远程事件", Duration = 2 })
            end
        else
            WindUI:Notify({ Title = "错误", Content = "未找到 FeedTheTetoRemotes 文件夹", Duration = 2 })
        end
    end
})
v20:Button({
    Text = "零食价值满级",
    Icon = "dollar-sign",
    Tooltip = "循环购买零食价值 100 次",
    Callback = function()
        local v21 = game:GetService("ReplicatedStorage"):FindFirstChild("FeedTheTetoRemotes")
        if v21 then
            local v22 = v21:FindFirstChild("BuyUpgrade")
            if v22 then
                local r23 = 0
                for r24 = 1, 100 do
                    local r25 = { "ValueMult", 1 }
                    local r26 = pcall(function()
                        v22:InvokeServer(unpack(r25))
                    end)
                    if r26 then r23 = r23 + 1 end
                    task.wait(0.05)
                end
                WindUI:Notify({ Title = "购买完成", Content = "已成功购买 " .. r23 .. " 次零食价值", Duration = 3 })
            else
                WindUI:Notify({ Title = "错误", Content = "未找到 BuyUpgrade 远程事件", Duration = 2 })
            end
        else
            WindUI:Notify({ Title = "错误", Content = "未找到 FeedTheTetoRemotes 文件夹", Duration = 2 })
        end
    end
})
v20:Button({
    Text = "购买所有升级树",
    Icon = "award",
    Tooltip = "自动购买所有可用的技能树",
    Callback = function()
        local v23 = workspace:FindFirstChild("VisualSkillTree")
        if not v23 then
            WindUI:Notify({ Title = "错误", Content = "未找到 VisualSkillTree 文件夹", Duration = 2 })
            return
        end
        local v24 = game:GetService("ReplicatedStorage"):FindFirstChild("FeedTheTetoRemotes")
        if not v24 then
            WindUI:Notify({ Title = "错误", Content = "未找到 FeedTheTetoRemotes 文件夹", Duration = 2 })
            return
        end
        local v25 = v24:FindFirstChild("BuyTalent")
        if not v25 then
            WindUI:Notify({ Title = "错误", Content = "未找到 BuyTalent 远程事件", Duration = 2 })
            return
        end
        local r27 = 0
        for _, rChild in ipairs(v23:GetChildren()) do
            local rName = rChild.Name
            local rArgs = { rName }
            local rSuccess = pcall(function()
                v25:InvokeServer(unpack(rArgs))
            end)
            if rSuccess then
                r27 = r27 + 1
                task.wait(0.1)
            end
        end
        if r27 > 0 then
            WindUI:Notify({ Title = "购买完成", Content = "已购买 " .. r27 .. " 个升级树", Duration = 3 })
        else
            WindUI:Notify({ Title = "提示", Content = "没有可购买的升级树", Duration = 2 })
        end
    end
})
local v26 = v19:Section({ Title = "重生购买", IconName = "rotate-cw" })
v26:Button({
    Text = "传奇零食生成概率满级",
    Icon = "star",
    Tooltip = "循环购买传奇零食生成概率 20 次",
    Callback = function()
        local v27 = game:GetService("ReplicatedStorage"):FindFirstChild("FeedTheTetoRemotes")
        if v27 then
            local v28 = v27:FindFirstChild("BuyRebirthUpgrade")
            if v28 then
                local r29 = 0
                for r30 = 1, 20 do
                    local r31 = { "Rebirth_Epic" }
                    local r32 = pcall(function()
                        v28:FireServer(unpack(r31))
                    end)
                    if r32 then r29 = r29 + 1 end
                    task.wait(0.05)
                end
                WindUI:Notify({ Title = "购买完成", Content = "已成功购买 " .. r29 .. " 次传奇零食概率", Duration = 3 })
            else
                WindUI:Notify({ Title = "错误", Content = "未找到 BuyRebirthUpgrade 远程事件", Duration = 2 })
            end
        else
            WindUI:Notify({ Title = "错误", Content = "未找到 FeedTheTetoRemotes 文件夹", Duration = 2 })
        end
    end
})
v26:Button({
    Text = "重生倍增数量满级",
    Icon = "layers",
    Tooltip = "循环购买重生倍增数量 50 次",
    Callback = function()
        local v27 = game:GetService("ReplicatedStorage"):FindFirstChild("FeedTheTetoRemotes")
        if v27 then
            local v28 = v27:FindFirstChild("BuyRebirthUpgrade")
            if v28 then
                local r29 = 0
                for r30 = 1, 50 do
                    local r31 = { "Rebirth_Gain" }
                    local r32 = pcall(function()
                        v28:FireServer(unpack(r31))
                    end)
                    if r32 then r29 = r29 + 1 end
                    task.wait(0.05)
                end
                WindUI:Notify({ Title = "购买完成", Content = "已成功购买 " .. r29 .. " 次重生倍增数量", Duration = 3 })
            else
                WindUI:Notify({ Title = "错误", Content = "未找到 BuyRebirthUpgrade 远程事件", Duration = 2 })
            end
        else
            WindUI:Notify({ Title = "错误", Content = "未找到 FeedTheTetoRemotes 文件夹", Duration = 2 })
        end
    end
})
v26:Button({
    Text = "零食价值倍增满级",
    Icon = "trending-up",
    Tooltip = "循环购买零食价值倍增 100 次",
    Callback = function()
        local v27 = game:GetService("ReplicatedStorage"):FindFirstChild("FeedTheTetoRemotes")
        if v27 then
            local v28 = v27:FindFirstChild("BuyRebirthUpgrade")
            if v28 then
                local r29 = 0
                for r30 = 1, 100 do
                    local r31 = { "Rebirth_Value" }
                    local r32 = pcall(function()
                        v28:FireServer(unpack(r31))
                    end)
                    if r32 then r29 = r29 + 1 end
                    task.wait(0.05)
                end
                WindUI:Notify({ Title = "购买完成", Content = "已成功购买 " .. r29 .. " 次零食价值倍增", Duration = 3 })
            else
                WindUI:Notify({ Title = "错误", Content = "未找到 BuyRebirthUpgrade 远程事件", Duration = 2 })
            end
        else
            WindUI:Notify({ Title = "错误", Content = "未找到 FeedTheTetoRemotes 文件夹", Duration = 2 })
        end
    end
})
local v29 = v19:Section({ Title = "特殊升级", IconName = "gem" })
v29:Button({
    Text = "速度提升满级",
    Icon = "running",
    Tooltip = "循环购买速度提升 10 次",
    Callback = function()
        local v30 = game:GetService("ReplicatedStorage"):FindFirstChild("FeedTheTetoRemotes")
        if v30 then
            local v31 = v30:FindFirstChild("BuyDefokoUpgrade")
            if v31 then
                local r33 = 0
                for r34 = 1, 10 do
                    local r35 = { "Upg_WalkSpeed" }
                    local r36 = pcall(function()
                        v31:FireServer(unpack(r35))
                    end)
                    if r36 then r33 = r33 + 1 end
                    task.wait(0.05)
                end
                WindUI:Notify({ Title = "购买完成", Content = "已成功购买 " .. r33 .. " 次速度提升", Duration = 3 })
            else
                WindUI:Notify({ Title = "错误", Content = "未找到 BuyDefokoUpgrade 远程事件", Duration = 2 })
            end
        else
            WindUI:Notify({ Title = "错误", Content = "未找到 FeedTheTetoRemotes 文件夹", Duration = 2 })
        end
    end
})
v29:Button({
    Text = "Neru视野满级",
    Icon = "eye",
    Tooltip = "循环购买 Neru视野 5 次",
    Callback = function()
        local v30 = game:GetService("ReplicatedStorage"):FindFirstChild("FeedTheTetoRemotes")
        if v30 then
            local v31 = v30:FindFirstChild("BuyDefokoUpgrade")
            if v31 then
                local r33 = 0
                for r34 = 1, 5 do
                    local r35 = { "Upg_Neru_Views" }
                    local r36 = pcall(function()
                        v31:FireServer(unpack(r35))
                    end)
                    if r36 then r33 = r33 + 1 end
                    task.wait(0.05)
                end
                WindUI:Notify({ Title = "购买完成", Content = "已成功购买 " .. r33 .. " 次 Neru视野", Duration = 3 })
            else
                WindUI:Notify({ Title = "错误", Content = "未找到 BuyDefokoUpgrade 远程事件", Duration = 2 })
            end
        else
            WindUI:Notify({ Title = "错误", Content = "未找到 FeedTheTetoRemotes 文件夹", Duration = 2 })
        end
    end
})
v29:Button({
    Text = "UST倍增满级",
    Icon = "trending-up",
    Tooltip = "循环购买 UST倍增 20 次",
    Callback = function()
        local v30 = game:GetService("ReplicatedStorage"):FindFirstChild("FeedTheTetoRemotes")
        if v30 then
            local v31 = v30:FindFirstChild("BuyDefokoUpgrade")
            if v31 then
                local r33 = 0
                for r34 = 1, 20 do
                    local r35 = { "Upg_UST_Mult" }
                    local r36 = pcall(function()
                        v31:FireServer(unpack(r35))
                    end)
                    if r36 then r33 = r33 + 1 end
                    task.wait(0.05)
                end
                WindUI:Notify({ Title = "购买完成", Content = "已成功购买 " .. r33 .. " 次 UST倍增", Duration = 3 })
            else
                WindUI:Notify({ Title = "错误", Content = "未找到 BuyDefokoUpgrade 远程事件", Duration = 2 })
            end
        else
            WindUI:Notify({ Title = "错误", Content = "未找到 FeedTheTetoRemotes 文件夹", Duration = 2 })
        end
    end
})
v29:Button({
    Text = "音符价值满级",
    Icon = "dollar-sign",
    Tooltip = "循环购买音符价值 50 次",
    Callback = function()
        local v30 = game:GetService("ReplicatedStorage"):FindFirstChild("FeedTheTetoRemotes")
        if v30 then
            local v31 = v30:FindFirstChild("BuyDefokoUpgrade")
            if v31 then
                local r33 = 0
                for r34 = 1, 50 do
                    local r35 = { "Upg_UST_Value" }
                    local r36 = pcall(function()
                        v31:FireServer(unpack(r35))
                    end)
                    if r36 then r33 = r33 + 1 end
                    task.wait(0.05)
                end
                WindUI:Notify({ Title = "购买完成", Content = "已成功购买 " .. r33 .. " 次音符价值", Duration = 3 })
            else
                WindUI:Notify({ Title = "错误", Content = "未找到 BuyDefokoUpgrade 远程事件", Duration = 2 })
            end
        else
            WindUI:Notify({ Title = "错误", Content = "未找到 FeedTheTetoRemotes 文件夹", Duration = 2 })
        end
    end
})
v29:Button({
    Text = "音符数量满级",
    Icon = "layers",
    Tooltip = "循环购买音符数量 99 次",
    Callback = function()
        local v30 = game:GetService("ReplicatedStorage"):FindFirstChild("FeedTheTetoRemotes")
        if v30 then
            local v31 = v30:FindFirstChild("BuyDefokoUpgrade")
            if v31 then
                local r33 = 0
                for r34 = 1, 99 do
                    local r35 = { "Upg_UST_Value" }
                    local r36 = pcall(function()
                        v31:FireServer(unpack(r35))
                    end)
                    if r36 then r33 = r33 + 1 end
                    task.wait(0.05)
                end
                WindUI:Notify({ Title = "购买完成", Content = "已成功购买 " .. r33 .. " 次音符数量", Duration = 3 })
            else
                WindUI:Notify({ Title = "错误", Content = "未找到 BuyDefokoUpgrade 远程事件", Duration = 2 })
            end
        else
            WindUI:Notify({ Title = "错误", Content = "未找到 FeedTheTetoRemotes 文件夹", Duration = 2 })
        end
    end
})
v29:Button({
    Text = "音符生成速度满级",
    Icon = "clock",
    Tooltip = "循环购买音符生成速度 14 次",
    Callback = function()
        local v30 = game:GetService("ReplicatedStorage"):FindFirstChild("FeedTheTetoRemotes")
        if v30 then
            local v31 = v30:FindFirstChild("BuyDefokoUpgrade")
            if v31 then
                local r33 = 0
                for r34 = 1, 14 do
                    local r35 = { "Upg_UST_Rate" }
                    local r36 = pcall(function()
                        v31:FireServer(unpack(r35))
                    end)
                    if r36 then r33 = r33 + 1 end
                    task.wait(0.05)
                end
                WindUI:Notify({ Title = "购买完成", Content = "已成功购买 " .. r33 .. " 次音符生成速度", Duration = 3 })
            else
                WindUI:Notify({ Title = "错误", Content = "未找到 BuyDefokoUpgrade 远程事件", Duration = 2 })
            end
        else
            WindUI:Notify({ Title = "错误", Content = "未找到 FeedTheTetoRemotes 文件夹", Duration = 2 })
        end
    end
})