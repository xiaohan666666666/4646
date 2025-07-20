local WHITELIST = {
    [8515693093] = true, -- 作者ID
    [6039062907] = true,
    [8080735686] = true,
    [7079287947] = true, -- 新增白名单ID
    [3937432816] = true  -- 新增白名单ID
    -- 可继续添加白名单ID
}

-- 加载Orion库
local OrionLib
local success, err = pcall(function()
    OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/FUEx0f3G"))()
end)
if not success or not OrionLib then
    warn("Orion库加载失败: " .. (err or "未知错误"))
    return
end

-- 服务与变量初始化
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- 白名单验证
if not WHITELIST[player.UserId] then
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "未授权访问",
            Text = "您的ID不在白名单中",
            Duration = 5,
            Icon = "rbxassetid://9108657181"
        })
    end)
    local RestrictWindow = OrionLib:MakeWindow({
        Name = "访问受限",
        Theme = "Dark",
        Icon = "rbxassetid://9108657181"
    })
    local InfoTab = RestrictWindow:MakeTab({Name = "权限不足"})
    InfoTab:AddParagraph("提示", "请联系管理员添加白名单")
    InfoTab:AddParagraph("您的ID", tostring(player.UserId))
    OrionLib:Init()
    return
end

-- 工具函数：创建圆角
local function makeRound(obj, radius)
    if obj and obj:IsA("GuiObject") then
        local corner = Instance.new("UICorner")
        corner.CornerRadius = radius or UDim.new(0.5, 0)
        corner.Parent = obj
    end
end

-- 创建主窗口
local Window = OrionLib:MakeWindow({
    Name = "素辞脚本",
    SaveConfig = true,
    IntroText = "素辞 - 功能加载完成",
    Theme = "FlatBlue",
    Icon = "rbxassetid://4483345998"
})

-- 欢迎通知
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "素辞脚本",
        Text = "欢迎使用，功能已就绪",
        Duration = 4,
        Icon = "rbxassetid://4483345998"
    })
end)

-- 作者信息标签页
local AuthorTab = Window:MakeTab({Name = "作者信息", Icon = "rbxassetid://4483345998"})
AuthorTab:AddParagraph("作者", "素辞")
AuthorTab:AddParagraph("作者QQ", "1627515558")
AuthorTab:AddParagraph("QQ群", "1627515558")

-- 圆形按钮生成器
local function addRoundButton(tab, config)
    local btn = tab:AddButton(config)
    if btn.Instance and btn.Instance:IsA("GuiButton") then
        btn.Instance.Size = UDim2.new(0, 120, 0, 36)
        makeRound(btn.Instance)
        
        local hover = Instance.new("UIScale")
        hover.Scale = 1
        hover.Parent = btn.Instance
        
        local enterConn = btn.Instance.MouseEnter:Connect(function() hover.Scale = 1.05 end)
        local leaveConn = btn.Instance.MouseLeave:Connect(function() hover.Scale = 1 end)
        
        btn.Instance.AncestryChanged:Connect(function(_, parent)
            if not parent then
                enterConn:Disconnect()
                leaveConn:Disconnect()
            end
        end)
    end
    return btn
end

-- 作者信息页按钮
addRoundButton(AuthorTab, {
    Name = "复制作者QQ",
    Callback = function()
        if setclipboard then
            setclipboard("1627515558")
            OrionLib:MakeNotification({Name = "成功", Content = "QQ已复制", Time = 2})
        end
    end,
    Color = Color3.fromRGB(70, 130, 255)
})

addRoundButton(AuthorTab, {
    Name = "复制QQ群",
    Callback = function()
        if setclipboard then
            setclipboard("1627515558")
            OrionLib:MakeNotification({Name = "成功", Content = "QQ群已复制", Time = 2})
        end
    end,
    Color = Color3.fromRGB(100, 200, 100)
})

-- 玩家信息标签页
local PlayerTab = Window:MakeTab({Name = "玩家信息", Icon = "rbxassetid://4483345998"})
local executorName = "未知"
pcall(function() executorName = identifyexecutor() or "未知" end)

PlayerTab:AddParagraph("用户名", player.Name)
PlayerTab:AddParagraph("用户ID", tostring(player.UserId))
PlayerTab:AddParagraph("注入器", executorName)
PlayerTab:AddParagraph("服务器ID", tostring(game.GameId))
PlayerTab:AddParagraph("白名单状态", "<font color='green'>已授权</font>")

-- 玩家功能标签页
local FunctionTab = Window:MakeTab({Name = "拔剑功能", Icon = "rbxassetid://4483345998"})

-- 自动获取经验相关变量和逻辑
local isGainingExp = false
local expRemoteEvent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events"):WaitForChild("WinEvent") -- 替换为实际路径
local expArgs = {
    [1] = "50" -- 替换为实际参数
}
局部gainExpThread = nil

-- 开启自动获取经验函数
局部函数 startGainExp（）
如果是GainingExp，那么
OrionLib:MakeNotification（{Name =“提示”, 内容=“已经在自动获取经验中”, 时间=2）
返回
结束
isGainingExp = true
gainExpThread = spawn（function（）
当正在进行测试时
pcall（函数（）
expRemoteEvent:FireServer（解包（expArgs））
结束）
等待（1）——间隔时间，可调整
结束
结束）
OrionLib:MakeNotification（{Name =“开始”, 内容=“已开始自动获取经验”, 时间=2）
结束

-- 关闭自动获取经验函数
局部函数 stopGainExp（）
    if not isGainingExp then
OrionLib:MakeNotification（{Name =“提示”, 内容=“当前未在自动获取经验”, 时间=2）
    [8515693093]=真实，——作者身份
    [6039062907]= 真，
    [8080735686]= 真，
    [7079287947]=真实，—新增白名单
    [3937432816]=真实—新增白名单
    -- 可继续添加白名单标识
}
OrionLib:MakeNotification（{Name =“停止", 内容="已停止自动获取经验", 时间=2）
-- 加载猎户座（Orion）库

局部成功，错误=函数
OrionLib = loadstring（game:HttpGet（"https://pastebin.com/raw/FUEx0f3G"））（）
结束）
如果没有成功或没有奥利，那么
警告（"猎户座（猎户座）库加载失败:"..（错误或"未知错误"））
返回
结束
startGainExp（）
-- 服务与变量初始化
local Players = game:GetService（"Players"）
本地玩家=本地玩家
local ReplicatedStorage = game:GetService（"ReplicatedStorage"）
})

如果不是白名单[玩家。用户标识] 则
pcall（函数（）()
