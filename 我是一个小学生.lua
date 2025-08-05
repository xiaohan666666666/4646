-- 加载Rayfield UI库
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 白名单设置
local WHITELIST = {
    [8515693093] = true, -- 作者ID
    [6039062907] = true,
    [42845731584] = true,
    [5074612207] = true, -- 新增白名单ID
    [7551743913] = true,
    [4439016466] = true,
    [8961509910] = true,
    [2751568065] = true,
    [8350612892] = true,
    [9073886221] = true,
    [5731171913] = true,
    [3937432816] = true,  -- 新增白名单ID
}


-- 服务与变量初始化
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

-- 白名单验证
if not WHITELIST[player.UserId] then
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "未授权访问",
            Text = "您的ID不在白名单中",
            Duration = 5,
            Icon = "rbxassetid://9108657181"
        })
    end)
    
    -- 创建未授权窗口
    local UnauthWindow = Rayfield:CreateWindow({
        Name = "访问受限",
        LoadingTitle = "权限不足",
        LoadingSubtitle = "请联系管理员添加白名单",
        ConfigurationSaving = {Enabled = false},
        KeySystem = false
    })
    
    local UnauthTab = UnauthWindow:CreateTab("未授权", nil)
    UnauthTab:CreateSection("您的ID: " .. tostring(player.UserId))
    UnauthTab:CreateLabel("请联系管理员添加白名单后使用")
    
    Rayfield:Notify({
        Title = "未授权",
        Content = "您的ID不在白名单中",
        Duration = 5,
        Image = 9108657181
    })
    
    return
end

-- 创建主窗口
local Window = Rayfield:CreateWindow({
    Name = "素辞脚本",
    LoadingTitle = "素辞 - 功能加载中",
    LoadingSubtitle = "白名单已验证",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "素辞脚本",
        FileName = "配置"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false -- 已通过白名单验证，关闭密钥系统
})

-- 欢迎通知
Rayfield:Notify({
    Title = "素辞脚本",
    Content = "欢迎使用，功能已就绪",
    Duration = 4,
    Image = 4483345998
})

-- 作者信息标签页
local AuthorTab = Window:CreateTab("作者信息", 4483345998)
AuthorTab:CreateSection("作者信息")
AuthorTab:CreateLabel("作者: 素辞")
AuthorTab:CreateLabel("作者QQ: 1627515558")
AuthorTab:CreateLabel("QQ群: 1627515558")

AuthorTab:CreateSection("快捷操作")
AuthorTab:CreateButton({
    Name = "复制作者QQ",
    Callback = function()
        if setclipboard then
            setclipboard("1627515558")
            Rayfield:Notify({Name = "成功", Content = "QQ已复制", Duration = 2})
        end
    end
})

AuthorTab:CreateButton({
    Name = "复制QQ群",
    Callback = function()
        if setclipboard then
            setclipboard("1627515558")
            Rayfield:Notify({Name = "成功", Content = "QQ群已复制", Duration = 2})
        end
    end
})

-- 玩家信息标签页
local PlayerTab = Window:CreateTab("玩家信息", 4483345998)
PlayerTab:CreateSection("基础信息")

local executorName = "未知"
pcall(function() executorName = identifyexecutor() or "未知" end)

PlayerTab:CreateLabel("用户名: " .. player.Name)
PlayerTab:CreateLabel("用户ID: " .. tostring(player.UserId))
PlayerTab:CreateLabel("注入器: " .. executorName)
PlayerTab:CreateLabel("服务器ID: " .. tostring(game.GameId))
PlayerTab:CreateLabel("白名单状态: 已授权")

-- 玩家功能标签页
local FunctionTab = Window:CreateTab("玩家功能", 4483345998)

-- 自动获取经验相关变量和逻辑
local isGainingExp = false
local gainExpThread = nil
local defaultWaitTime = 1
local currentWaitTime = defaultWaitTime

-- 开启自动获取经验函数
local function startGainExp()
    if isGainingExp then
        Rayfield:Notify({Name = "提示", Content = "已经在自动获取经验中", Duration = 2})
        return
    end
    isGainingExp = true
    gainExpThread = spawn(function()
        while isGainingExp do
            local args = {[1] = "Boss10"}
            local success, err = pcall(function()
                game:GetService("ReplicatedStorage").Remotes.Events.WinBossEvent:FireServer(unpack(args))
            end)
            if not success then
                Rayfield:Notify({Name = "错误", Content = "触发失败: ".. tostring(err), Duration = 2})
            end
            wait(currentWaitTime)
        end
    end)
    Rayfield:Notify({Name = "开始", Content = "已开始自动获取经验", Duration = 2})
end

-- 关闭自动获取经验函数
local function stopGainExp()
    if not isGainingExp then
        Rayfield:Notify({Name = "提示", Content = "当前未在自动获取经验", Duration = 2})
        return
    end
    isGainingExp = false
    if gainExpThread then
        coroutine.close(gainExpThread)
        gainExpThread = nil
    end
    Rayfield:Notify({Name = "停止", Content = "已停止自动获取经验", Duration = 2})
end

-- 自动获取经验区域
FunctionTab:CreateSection("自动获取经验")
FunctionTab:CreateToggle({
    Name = "自动获取经验",
    CurrentValue = false,
    Flag = "AutoExpToggle",
    Callback = function(Value)
        if Value then
            startGainExp()
        else
            stopGainExp()
        end
    end
})

FunctionTab:CreateInput({
    Name = "设置刷经验等待时间 (秒)",
    PlaceholderText = "默认1秒",
    CurrentValue = tostring(defaultWaitTime),
    Callback = function(Text)
        local num = tonumber(Text)
        if num and num > 0 then
            currentWaitTime = num
            Rayfield:Notify({Name = "成功", Content = "等待时间已设置为 ".. num, Duration = 2})
        else
            Rayfield:Notify({Name = "错误", Content = "请输入有效的正数", Duration = 2})
        end
    end
})

-- 通用功能按钮
FunctionTab:CreateSection("通用功能")
FunctionTab:CreateButton({
    Name = "开启",
    Callback = function()
        local args = {[1] = 1}
        local success, err = pcall(function()
            game:GetService("ReplicatedStorage").Remotes.Events.RemoveC:FireServer(unpack(args))
        end)
        if success then
            Rayfield:Notify({Name = "成功", Content = "开启功能执行成功", Duration = 2})
        else
            Rayfield:Notify({Name = "错误", Content = "开启功能执行失败: ".. tostring(err), Duration = 2})
        end
    end
})

FunctionTab:CreateButton({
    Name = "关闭",
    Callback = function()
        local args = {[1] = 0}
        local success, err = pcall(function()
            game:GetService("ReplicatedStorage").Remotes.Events.RemoveC:FireServer(unpack(args))
        end)
        if success then
            Rayfield:Notify({Name = "成功", Content = "关闭功能执行成功", Duration = 2})
        else
            Rayfield:Notify({Name = "错误", Content = "关闭功能执行失败: ".. tostring(err), Duration = 2})
        end
    end
})

-- 自动PVP相关逻辑
local selectedOpponent = nil
local isAutoPVPRunning = false
local victoryInterval = 5 
local pvpArgs = {
    [1] = "Vincent12345qw",
    [2] = true,
    [3] = false
}

-- PVP功能区域
FunctionTab:CreateSection("自动PVP")
FunctionTab:CreateButton({
    Name = "开始自动PVP",
    Callback = function()
        if isAutoPVPRunning then
            Rayfield:Notify({Name = "提示", Content = "自动PVP已经在运行", Duration = 2})
            return
        end
        
        isAutoPVPRunning = true
        Rayfield:Notify({Name = "成功", Content = "自动PVP已启动", Duration = 2})
        
        spawn(function()
            while isAutoPVPRunning do
                local success, err = pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.Events.WinEvent_PVP:FireServer(unpack(pvpArgs))
                end)
                if success then
                    Rayfield:Notify({Name = "胜利", Content = "成功触发PVP事件", Duration = 2})
                else
                    Rayfield:Notify({Name = "失败", Content = "PVP交互失败: ".. tostring(err), Duration = 2})
                end
                wait(victoryInterval)
            end
        end)
    end
})

FunctionTab:CreateButton({
    Name = "停止自动PVP",
    Callback = function()
        if not isAutoPVPRunning then
            Rayfield:Notify({Name = "提示", Content = "自动PVP未运行", Duration = 2})
            return
        end
        local args = {[1] = 0}
        local success, err = pcall(function()
            game:GetService("ReplicatedStorage").Remotes.Events.RemoveC:FireServer(unpack(args))
        end)
        if success then
            isAutoPVPRunning = false
            Rayfield:Notify({Name = "成功", Content = "自动PVP已停止", Duration = 2})
        else
            Rayfield:Notify({Name = "错误", Content = "停止失败: ".. tostring(err), Duration = 2})
        end
    end
})

-- 躲鬼标签页
local HideGhostTab = Window:CreateTab("躲鬼功能", 4483345998)

-- 躲鬼功能变量
local isAutoScoring = false
local scoreInterval = 1
local scoreAmount = 1
local scoreValue

-- 初始化积分对象
local function initScoreObject()
    if not scoreValue then
        scoreValue = player:FindFirstChild("stats") and player.stats:FindFirstChild("score")
        if not scoreValue then
            Rayfield:Notify({Name = "错误", Content = "未找到积分对象", Duration = 3})
            return false
        end
    end
    return true
end

-- 自动获取积分逻辑
local function startAutoScore()
    if isAutoScoring then
        Rayfield:Notify({Name = "提示", Content = "已开启自动积分", Duration = 2})
        return
    end
    if not initScoreObject() then return end
    
    isAutoScoring = true
    Rayfield:Notify({Name = "开始", Content = "自动获取积分已启动", Duration = 2})
    
    spawn(function()
        while isAutoScoring do
            pcall(function()
                scoreValue.Value = scoreValue.Value + scoreAmount
            end)
            wait(scoreInterval)
        end
    end)
end

local function stopAutoScore()
    if not isAutoScoring then
        Rayfield:Notify({Name = "提示", Content = "未开启自动积分", Duration = 2})
        return
    end
    isAutoScoring = false
    Rayfield:Notify({Name = "停止", Content = "自动获取积分已关闭", Duration = 2})
end

-- 传送到安全点
local function teleportToSafePoint()
    pcall(function()
        game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("player"):WaitForChild("char"):WaitForChild("respawnchar"):FireServer()
        Rayfield:Notify({Name = "成功", Content = "已传送至安全点", Duration = 2})
    end)
end

-- 躲鬼功能UI
HideGhostTab:CreateSection("自动积分")
HideGhostTab:CreateToggle({
    Name = "自动获取积分",
    CurrentValue = false,
    Flag = "AutoScoreToggle",
    Callback = function(Value)
        if Value then
            startAutoScore()
        else
            stopAutoScore()
        end
    end
})

HideGhostTab:CreateInput({
    Name = "设置积分间隔（秒）",
    PlaceholderText = "默认1秒",
    CurrentValue = tostring(scoreInterval),
    Callback = function(Text)
        local num = tonumber(Text)
        if num and num > 0 then
            scoreInterval = num
            Rayfield:Notify({Name = "成功", Content = "间隔已设置为 ".. num .." 秒", Duration = 2})
        else
            Rayfield:Notify({Name = "错误", Content = "请输入有效数字", Duration = 2})
        end
    end
})

HideGhostTab:CreateInput({
    Name = "设置每次积分增量",
    PlaceholderText = "默认1分",
    CurrentValue = tostring(scoreAmount),
    Callback = function(Text)
        local num = tonumber(Text)
        if num and num > 0 then
            scoreAmount = num
            Rayfield:Notify({Name = "成功", Content = "每次增加 ".. num .." 积分", Duration = 2})
        else
            Rayfield:Notify({Name = "错误", Content = "请输入有效数字", Duration = 2})
        end
    end
})

HideGhostTab:CreateSection("安全功能")
HideGhostTab:CreateButton({
    Name = "传送到安全点",
    Callback = teleportToSafePoint
})

-- 选择PVP对手标签页
local OpponentTab = Window:CreateTab("选择PVP对手", 4483345998)
OpponentTab:CreateSection("在线玩家")

local function updateOpponents()
    -- 清空现有按钮（如果需要动态更新）
    -- 这里简化处理，只加载一次
    local otherPlayers = Players:GetPlayers()
    for _, opp in pairs(otherPlayers) do
        if opp ~= player then
            OpponentTab:CreateButton({
                Name = opp.Name,
                Callback = function() 
                    selectedOpponent = opp
                    Rayfield:Notify({Name = "选择成功", Content = "已选择 ".. opp.Name, Duration = 2})
                end
            })
        end
    end
end

-- 初始化对手列表
updateOpponents()

-- 越狱标签页模块（可直接嵌入主窗口Window中）
local JailbreakTab = Window:CreateTab("越狱", 4483345998)

-- 核心变量
local isRunning = false  -- 循环开关状态
local character, rootPart  -- 角色及根部件引用
local finishPart  -- 终点部件
local cashObj  -- 现金数值对象
local loopCoroutine  -- 主循环协程

-- 1. 查找现金对象
local function findCashObject()
    cashObj = nil
    local cashNames = {"Cash", "cash", "Money", "money", "Coins", "coins"}
    -- 检查常见数值容器
    for _, name in ipairs(cashNames) do
        local obj = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild(name)
        if not obj then obj = player:FindFirstChild("stats") and player.stats:FindFirstChild(name) end
        if not obj then obj = player:FindFirstChild(name) end
        -- 验证是否为有效数值类型
        if obj and (obj:IsA("IntValue") or obj:IsA("NumberValue")) then
            cashObj = obj
            Rayfield:Notify({Content = "找到现金对象："..obj:GetFullName(), Duration = 2})
            return
        end
    end
    Rayfield:Notify({Content = "未找到现金（不影响刷取）", Duration = 5})
end

-- 2. 查找终点部件（大小写不敏感）
local function findFinish()
    finishPart = nil
    -- 构建匹配模式（支持大小写）
    local finishPattern = string.gsub("Finish", "%a", function(c)
        return "["..c:upper()..c:lower().."]"
    end)
    
    -- 遍历场景查找符合条件的部件
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name:match(finishPattern) and obj:IsA("BasePart") then
            finishPart = obj
            Rayfield:Notify({Content = "找到终点："..finishPart.Name, Duration = 2})
            return
        end
    end
    Rayfield:Notify({Content = "未找到终点！请刷新重试", Duration = 5})
end

-- 3. 防落水传送逻辑
local function teleportTo(targetPart)
    -- 向下射线检测地面（避免落水）
    local downRay = Ray.new(targetPart.Position, Vector3.new(0, -100, 0))
    local hitPart, hitPos = workspace:FindPartOnRay(downRay, targetPart)
    local safePos = targetPart.Position + Vector3.new(0, 3, 0)  -- 保底高度
    
    -- 检测到有效地面时调整位置
    if hitPart and hitPart.Transparency < 1 and not hitPart:IsA("Terrain") then
        safePos = hitPos + Vector3.new(0, 1, 0)  -- 地面上方1格
    end
    
    rootPart.CFrame = CFrame.new(safePos)
    Rayfield:Notify({Content = "已传送至"..targetPart.Name, Duration = 1})
end

-- 4. 主循环逻辑
local function autoLoop()
    while isRunning do
        -- 终点缺失时自动重试查找
        if not finishPart then
            findFinish()
            wait(3)
            if not finishPart then continue end
        end
        
        -- 执行传送
        teleportTo(finishPart)
        wait(2)  -- 等待结算
        
        -- 显示现金变动（如果找到现金对象）
        if cashObj then
            Rayfield:Notify({Content = "现金："..cashObj.Value, Duration = 1})
        end
        
        wait(1)  -- 循环间隔
    end
end

-- 5. UI组件
JailbreakTab:CreateSection("核心功能")
-- 启动/停止循环开关
JailbreakTab:CreateToggle({
    Name = "启动终点循环",
    CurrentValue = false,
    Callback = function(state)
        isRunning = state
        if state then
            -- 初始化角色
            character = player.Character or player.CharacterAdded:Wait()
            rootPart = character:WaitForChild("HumanoidRootPart")
            
            -- 初始化数据
            findCashObject()
            findFinish()
            
            -- 启动循环
            loopCoroutine = coroutine.create(autoLoop)
            coroutine.resume(loopCoroutine)
        else
            -- 停止循环
            if loopCoroutine then
                coroutine.close(loopCoroutine)
                loopCoroutine = nil
            end
            isRunning = false
            Rayfield:Notify({Content = "已强制停止", Duration = 2})
        end
    end
})

JailbreakTab:CreateSection("辅助操作")
-- 手动刷新按钮
JailbreakTab:CreateButton({
    Name = "强制刷新（现金+终点）",
    Callback = function()
        findCashObject()
        findFinish()
    end
})

-- 功能说明
JailbreakTab:CreateLabel("功能说明：自动循环传送至终点触发结算，包含防落水设计")
