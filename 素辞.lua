当地的本地白名单 = {
    [8515693093]=真实，——作者身份8515693093] = 真实的, -- 作者身份证
    [6039062907]= 真，6039062907] = 真实的,6039062907]= 真，6039062907] = 真实的,6039062907]= 真，6039062907] = 真实的,6039062907]= 真，6039062907] = 真实的,
    [8080735686]= 真，8080735686] = 真实的,8080735686]= 真，8080735686] = 真实的,8080735686]= 真，8080735686] = 真实的,8080735686]= 真，8080735686] = 真实的,
    [5074612207]=真实，—新增白名单7079287947] = 真实的，——新增白名单=真实，—新增白名单7079287947] = 真实的，——新增白名单[[5074612207]]=真实，—新增白名单7079287947] = 真实的，——新增白名单[[5074612207]=真实，—新增白名单7079287947] = 真实的，——新增白名单[[5074612207]]=真实，—新增白名单7079287947] = 真实的, -- 新增白名单ID
    [3937432816]=真实—新增白名单3937432816] = 真实的  3937432816]=真实—新增白名单3937432816] = 真实的  3937432816]=真实—新增白名单3937432816] = 真实的  3937432816]=真实—新增白名单3937432816] = 真实的  -- 新增白名单ID
    -- 可继续添加白名单标识-- 可继续添加白名单标识-- 可继续添加白名单标识-- 可继续添加白名单标识
}

-- 加载猎户座（Orion）库
当地的本地猎户座
当地的局部成功，err=pcall（功能（）功能（）
OrionLib = loadstring（game:HttpGet（"https://pastebin.com/raw/FUEx0f3G"））（）"https://pastebin.com/raw/FUEx0f3G"))()"https://pastebin.com/raw/FUEx0f3G"））（）"https://pastebin.com/raw/FUEx0f3G"))()"https://pastebin.com/raw/FUEx0f3G"））（）"https://pastebin.com/raw/FUEx0f3G"))()"https://pastebin.com/raw/FUEx0f3G"））（）"https://pastebin.com/raw/FUEx0f3G"))()
结束结束）
如果不成功或不OrionLib然后
警告（"猎户座（猎户座）库加载失败:"..（错误或"未知错误"））"猎户座（猎户座）库加载失败:"..（错误或 "未知错误"未知错误"))"猎户座（猎户座）库加载失败:"..（错误或"未知错误"））"猎户座（猎户座）库加载失败:"..（错误或 "未知错误"未知错误"))"猎户座（猎户座）库加载失败:"..（错误或"未知错误"））"猎户座（猎户座）库加载失败:"..（错误或 "未知错误"未知错误"))"猎户座（猎户座）库加载失败:"..（错误或"未知错误"））"猎户座（猎户座）库加载失败:"..（错误或 "未知错误"未知错误"))
    返回
结束

-- 服务与变量初始化
当地的当地的玩家=游戏：获得服务（"玩家"）"玩家")"玩家")"玩家"）"玩家")"玩家")
当地的本地玩家=玩家。
当地的"复制存储"）"复制存储")"复制存储"）"复制存储")"）"复制存储")"复制存储"）"复制存储")

-- 白名单验证
如果不白名单【玩家.用户标识】然后
函数（）功能（）
游戏：获得服务（"启动界面"）：设置核心（"发送通知"，{"启动界面"）：设置核心（"发送通知"，{"启动界面""）：设置核心（"发送通知"，{"启动界面"）:设置核心（"发送通知", {"启动界面"）：设置核心（"发送通知"，{"启动界面"）:设置核心（"发送通知", {"StarterGui"）:设置核心（"发送通知"， {"StarterGui"）:设置核心（"发送通知", {
标题="未授权访问","未授权访问","未授权访问","未授权访问","未授权访问","未授权访问","未授权访问","未授权访问",
文本 ="您的身份证不在白名单中","您的身份证不在白名单中","您的身份证不在白名单中","您的身份证不在白名单中","您的身份证不在白名单中","您的身份证不在白名单中","您的身份证不在白名单中","您的身份证不在白名单中",
持续时间=5，5,5，5,5，5,5，5,
图标=“rbxassetid://9108657181""rbxassetid://9108657181""rbxassetid://9108657181""rbxassetid://9108657181"9108657181""rbxassetid://9108657181""rbxassetid://9108657181""rbxassetid://9108657181"
        })
    结束)
    当地的限制窗口=东方利布：制造窗口（{
名称="访问受限","访问受限","访问受限","访问受限","访问受限","访问受限","访问受限","访问受限","访问受限","访问受限",
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
local FunctionTab = Window:MakeTab({Name = "玩家功能", Icon = "rbxassetid://4483345998"})

-- 自动获取经验相关变量和逻辑
local isGainingExp = false
local gainExpThread = nil
local defaultWaitTime = 1
local currentWaitTime = defaultWaitTime

-- 开启自动获取经验函数
local function startGainExp()
    if isGainingExp then
        OrionLib:MakeNotification({Name = "提示", Content = "已经在自动获取经验中", Time = 2})
        return
    end
    isGainingExp = true
    gainExpThread = spawn(function()
        while isGainingExp do
            local args = {
                [1] = "Boss10"
            }
            local success, err = pcall(function()
                game:GetService("ReplicatedStorage").Remotes.Events.WinBossEvent:FireServer(unpack(args))
            end)
            if success then
                -- 以下这行是原来的成功通知，删除或注释掉即可去掉对应的弹窗
                -- OrionLib:MakeNotification({Name = "成功", Content = "成功触发击败Boss10事件", Time = 2})
            else
                OrionLib:MakeNotification({Name = "错误", Content = "触发击败Boss10事件失败: ".. tostring(err), Time = 2})
            end
            wait(currentWaitTime)
        end
    end)
    OrionLib:MakeNotification({Name = "开始", Content = "已开始自动获取经验", Time = 2})
end

-- 关闭自动获取经验函数
local function stopGainExp()
    if not isGainingExp then
        OrionLib:MakeNotification({Name = "提示", Content = "当前未在自动获取经验", Time = 2})
        return
    end
    isGainingExp = false
    if gainExpThread then
        coroutine.close(gainExpThread)
        gainExpThread = nil
    end
    OrionLib:MakeNotification({Name = "停止", Content = "已停止自动获取经验", Time = 2})
end

-- 添加自动获取经验的开关按钮
FunctionTab:AddToggle({
    Name = "自动获取经验",
    Description = "开启后自动循环触发击败Boss10获取经验，无需手动操作",
    Default = false,
    Callback = function(Value)
        if Value then
            startGainExp()
        else
            stopGainExp()
        end
    end
})

-- 添加修改等待时间的文本框
local function setWaitTime(newTime)
    local num = tonumber(newTime)
    if num and num > 0 then
        currentWaitTime = num
        OrionLib:MakeNotification({Name = "成功", Content = "刷经验等待时间已设置为 ".. num, Time = 2})
    else
        OrionLib:MakeNotification({Name = "错误", Content = "请输入有效的正数", Time = 2})
    end
end

FunctionTab:AddTextbox({
    Name = "设置刷经验等待时间 (秒)",
    PlaceholderText = "输入等待时间",
    Default = tostring(defaultWaitTime),
    Callback = setWaitTime
})

-- “开启”功能相关逻辑
local function executeOpenFunction()
    local args = {
        [1] = 1
    }
    local success, err = pcall(function()
        game:GetService("ReplicatedStorage").Remotes.Events.RemoveC:FireServer(unpack(args))
    end)
    if success then
        OrionLib:MakeNotification({Name = "成功", Content = "开启功能执行成功", Time = 2})
    else
        OrionLib:MakeNotification({Name = "错误", Content = "开启功能执行失败: ".. tostring(err), Time = 2})
    end
end

addRoundButton(FunctionTab, {
    Name = "开启",
    Callback = executeOpenFunction,
    Color = Color3.fromRGB(100, 200, 100)
})

-- “关闭”功能相关逻辑
local function executeCloseFunction()
    local args = {
        [1] = 0
    }
    local success, err = pcall(function()
        game:GetService("ReplicatedStorage").Remotes.Events.RemoveC:FireServer(unpack(args))
    end)
    if success then
        OrionLib:MakeNotification({Name = "成功", Content = "关闭功能执行成功", Time = 2})
    else
        OrionLib:MakeNotification({Name = "错误", Content = "关闭功能执行失败: ".. tostring(err), Time = 2})
    end
end

addRoundButton(FunctionTab, {
    Name = "关闭",
    Callback = executeCloseFunction,
    Color = Color3.fromRGB(200, 100, 100)
})

-- 新增自动PVP相关内容
local function getOtherPlayers()
    local otherPlayers = {}
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= player then
            table.insert(otherPlayers, plr)
        end
    end
    return otherPlayers
end

local selectedOpponent = nil
local isAutoPVPRunning = false
local victoryInterval = 5 -- 尝试宣告胜利的间隔时间（秒）

-- 选择对手函数
local function selectOpponent(player)
    selectedOpponent = player
    OrionLib:MakeNotification({Name = "选择成功", Content = "已选择 ".. player.Name.. " 作为对手", Time = 2})
end

-- 开始自动PVP函数
local function startAutoPVP()
    if isAutoPVPRunning then
        OrionLib:MakeNotification({Name = "提示", Content = "自动PVP已经在运行", Time = 2})
        return
    end
    if not selectedOpponent then
        OrionLib:MakeNotification({Name = "提示", Content = "请先选择对手", Time = 2})
        return
    end
    local args = {
        [1] = "qwththh",
        [2] = true,
        [3] = false
    }
    isAutoPVPRunning = true
    OrionLib:MakeNotification({Name = "成功", Content = "自动PVP已启动", Time = 2})
    local function autoPVP()
        while isAutoPVPRunning do
            local success, err = pcall(function()
                game:GetService("ReplicatedStorage").Remotes.Events.WinEvent_PVP:FireServer(unpack(args))
            end)
            if success then
                OrionLib:MakeNotification({Name = "胜利", Content = "成功宣告胜利", Time = 2})
            else
                OrionLib:MakeNotification({Name = "失败", Content = "宣告胜利失败: ".. tostring(err), Time = 2})
            end
            wait(victoryInterval)
        end
    end
    spawn(autoPVP)
end

-- 停止自动PVP函数
local function stopAutoPVP()
    if not isAutoPVPRunning then
        OrionLib:MakeNotification({Name = "提示", Content = "自动PVP未运行", Time = 2})
        return
    end
    local args = {
        [1] = 0
    }
    local success, err = pcall(function()
        game:GetService("ReplicatedStorage").Remotes.Events.RemoveC:FireServer(unpack(args))
    end)
    if success then
        isAutoPVPRunning = false
        OrionLib:MakeNotification({Name = "成功", Content = "自动PVP已停止", Time = 2})
    else
        OrionLib:MakeNotification({Name = "错误", Content = "停止自动PVP失败: ".. tostring(err), Time = 2})
    end
end

-- 选择对手标签页
local OpponentSelectionTab = Window:MakeTab({Name = "选择PVP对手", Icon = "rbxassetid://4483345998"})
local otherPlayers = getOtherPlayers()
for _, opp in pairs(otherPlayers) do
    OpponentSelectionTab:AddButton({
        Name = opp.Name,
        Callback = function() selectOpponent(opp) end,
        Color = Color3.fromRGB(0, 150, 255)
    })
end

FunctionTab:AddButton({
    Name = "开始自动PVP",
    Callback = startAutoPVP,
    Color = Color3.fromRGB(0, 200, 100)
})

FunctionTab:AddButton({
    Name = "停止自动PVP",
    Callback = stopAutoPVP,
    Color = Color3.fromRGB(200, 100, 100)
})

-- 初始化Orion库
OrionLib:Init()
