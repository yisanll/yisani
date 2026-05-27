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

local lp = game.Players.LocalPlayer
local killActive, killVersion = false, "V1"
local speedEnabled, currentSpeed = false, 16
local rs = game:GetService("ReplicatedStorage")
local purchaseHealthRemote, purchaseWeaponRemote, zombieDamageRemote, gunHitRemote, skipVoteRemote

pcall(function()
    purchaseHealthRemote = rs.UpgradeRemotes.PurchaseHealthUpgrade
    purchaseWeaponRemote = rs.UpgradeRemotes.PurchaseWeaponUpgrade
    zombieDamageRemote = rs.ZombieRemotes.ZombieDamage
    gunHitRemote = rs.GunRemotes.GunHit
    skipVoteRemote = rs.WaveRemotes.SkipVote
end)

local function getZombies()
    local zs = {}
    local folder = workspace:FindFirstChild("Zombies_Local")
    if not folder then return zs end
    for _, z in ipairs(folder:GetChildren()) do
        if z:IsA("Model") and z.PrimaryPart then
            local id = string.match(z.Name, "(%d+)$")
            table.insert(zs, {id = tonumber(id) or 0, pos = z.PrimaryPart.Position, model = z})
        end
    end
    return zs
end

local function killLoop()
    while killActive do
        local targets = getZombies()
        for _, target in ipairs(targets) do
            if not killActive then break end
            if killVersion == "V1" then
                pcall(function() zombieDamageRemote:FireServer(target.id, 999999) end)
            else
                pcall(function() gunHitRemote:FireServer("Pistol", target.id, target.pos) end)
            end
            task.wait(0.01)
        end
        task.wait(0.2)
    end
end

local TabBasic = Window:Tab({ Title = "基础功能", Icon = "settings" })
TabBasic:Toggle({
    Title = "加速行走",
    Callback = function(state)
        speedEnabled = state
        if lp.Character and lp.Character:FindFirstChild("Humanoid") then
            lp.Character.Humanoid.WalkSpeed = state and currentSpeed or 16
        end
    end
})
TabBasic:Slider({
    Title = "速度数值",
    Step = 1,
    Value = { Min = 16, Max = 200, Default = 50 },
    Callback = function(val)
        currentSpeed = val
        if speedEnabled and lp.Character:FindFirstChild("Humanoid") then
            lp.Character.Humanoid.WalkSpeed = val
        end
    end
})

local TabFeature = Window:Tab({ Title = "特色功能", Icon = "zap" })
TabFeature:Toggle({
    Title = "全图杀戮",
    Callback = function(state)
        killActive = state
        if state then task.spawn(killLoop) end
    end
})

TabFeature:Dropdown({
    Title = "杀戮模式",
    Values = { "V1", "V2" },
    Value = "V1", 
    Callback = function(val)
        killVersion = (type(val) == "table" and val[1] or val) or "V1"
    end
})

TabFeature:Toggle({
    Title = "自动购买生命",
    Callback = function(state)
        task.spawn(function()
            while state do
                if purchaseHealthRemote then purchaseHealthRemote:FireServer() end
                task.wait(1)
            end
        end)
    end
})

local TabAuto = Window:Tab({ Title = "自动功能", Icon = "cpu" })
TabAuto:Toggle({
    Title = "自动跳过回合",
    Callback = function(state)
        task.spawn(function()
            while state do
                if skipVoteRemote then skipVoteRemote:FireServer(true) end
                task.wait(5)
            end
        end)
    end
})

TabAuto:Toggle({
    Title = "自动吸水晶",
    Callback = function(state)
        task.spawn(function()
            while state do
                local folder = workspace:FindFirstChild("VoidShards")
                local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
                if folder and hrp then
                    for _, c in ipairs(folder:GetChildren()) do
                        pcall(function() c:PivotTo(hrp.CFrame) end)
                    end
                end
                task.wait(1)
            end
        end)
    end
})

local TabFun = Window:Tab({ Title = "娱乐", Icon = "gamepad" })
TabFun:Button({
    Title = "一键秒杀全图怪物 (不可逆)",
    Callback = function()
        local rifle = workspace:FindFirstChild("Galactic Rifle (vers 1)")
        local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
        if rifle and hrp then
            hrp.CFrame = rifle:GetPivot() + Vector3.new(0, 3, 0)
            local p = Instance.new("Part", workspace)
            p.Size, p.Position, p.Anchored = Vector3.new(20, 1, 20), hrp.Position - Vector3.new(0, 3, 0), true
        end
    end
})

lp.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid")
    if speedEnabled then hum.WalkSpeed = currentSpeed end
end)