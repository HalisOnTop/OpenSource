--[=[
    
    ██╗  ██╗ ██████╗ ██████╗ ██╗███████╗ ██████╗ ███╗   ██╗
    ██║  ██║██╔═══██╗██╔══██╗██║╚══███╔╝██╔═══██╗████╗  ██║
    ███████║██║   ██║██████╔╝██║  ███╔╝ ██║   ██║██╔██╗ ██║
    ██╔══██║██║   ██║██╔══██╗██║ ███╔╝  ██║   ██║██║╚██╗██║
    ██║  ██║╚██████╔╝██║  ██║██║███████╗╚██████╔╝██║ ╚████║
    ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝

                    H O R I Z O N   H U B
                       OPEN SOURCE PROJECT

    ────────────────────────────────────────────────────────
    Credits To Dr6seven AKA 
    ORIGINAL PROJECT : HORIZON HUB
    RELEASE TYPE     : OPEN SOURCE
    ATTRIBUTION      : PLEASE PRESERVE THE ORIGINAL CREDITS

    This script is released to the community by Horizon Hub.
    Built with dedication. Shared for the community.

    You are welcome to study, learn from, and modify this code
    in accordance with the terms of the applicable license.

    Please give credit to Horizon Hub when redistributing
    or publishing modified versions of this project.

    ────────────────────────────────────────────────────────

                    HORIZON HUB © 2026
                  BUILT DIFFERENT. BUILT TO LAST.

]=]


local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local KEY = "HorizonHub"
local DISCORD_LINK = "https://discord.gg/yBfnjRHKnd"

local player = Players.LocalPlayer


pcall(function()
    local old = CoreGui:FindFirstChild("HorizonKeySystem")
    if old then old:Destroy() end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "HorizonKeySystem"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local parent = (gethui and gethui()) or CoreGui
gui.Parent = parent

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(340, 220)
frame.Position = UDim2.new(0.5, -170, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(170, 45, 65)
stroke.Thickness = 1.5
stroke.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.BackgroundTransparency = 1
title.Text = "HORIZON HUB"
title.TextColor3 = Color3.fromRGB(255, 65, 85)
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.Parent = frame

local subtitle = Instance.new("TextLabel")
subtitle.Position = UDim2.fromOffset(0, 43)
subtitle.Size = UDim2.new(1, 0, 0, 25)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Key System"
subtitle.TextColor3 = Color3.fromRGB(180, 180, 190)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 13
subtitle.Parent = frame

local input = Instance.new("TextBox")
input.Position = UDim2.fromOffset(25, 82)
input.Size = UDim2.new(1, -50, 0, 38)
input.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
input.PlaceholderText = "Enter your key..."
input.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
input.Text = ""
input.TextColor3 = Color3.new(1, 1, 1)
input.Font = Enum.Font.Gotham
input.TextSize = 13
input.ClearTextOnFocus = false
input.Parent = frame

Instance.new("UICorner", input).CornerRadius = UDim.new(0, 7)

local verify = Instance.new("TextButton")
verify.Position = UDim2.fromOffset(25, 132)
verify.Size = UDim2.new(1, -50, 0, 34)
verify.BackgroundColor3 = Color3.fromRGB(190, 40, 60)
verify.Text = "VERIFY KEY"
verify.TextColor3 = Color3.new(1, 1, 1)
verify.Font = Enum.Font.GothamBold
verify.TextSize = 13
verify.Parent = frame

Instance.new("UICorner", verify).CornerRadius = UDim.new(0, 7)

local getKey = Instance.new("TextButton")
getKey.Position = UDim2.fromOffset(25, 174)
getKey.Size = UDim2.new(1, -50, 0, 30)
getKey.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
getKey.Text = "GET KEY"
getKey.TextColor3 = Color3.fromRGB(220, 220, 230)
getKey.Font = Enum.Font.GothamBold
getKey.TextSize = 12
getKey.Parent = frame

Instance.new("UICorner", getKey).CornerRadius = UDim.new(0, 7)

local status = Instance.new("TextLabel")
status.Position = UDim2.fromOffset(0, 207)
status.Size = UDim2.new(1, 0, 0, 20)
status.BackgroundTransparency = 1
status.Text = ""
status.TextColor3 = Color3.fromRGB(255, 80, 80)
status.Font = Enum.Font.Gotham
status.TextSize = 11
status.Parent = frame

getKey.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(DISCORD_LINK)
        status.Text = "Discord link copied!"
        status.TextColor3 = Color3.fromRGB(90, 220, 130)
    else
        status.Text = "Clipboard not supported!"
    end
end)

local verified = false
local verifiedEvent = Instance.new("BindableEvent")

verify.MouseButton1Click:Connect(function()
    if input.Text == KEY then
        verified = true
        verifiedEvent:Fire()
        status.Text = "Key verified successfully!"
        status.TextColor3 = Color3.fromRGB(90, 220, 130)

        gui:Destroy()
    else
        status.Text = "Invalid key! Try again."
        status.TextColor3 = Color3.fromRGB(255, 65, 65)
        input.Text = ""
    end
end)

if not verified then verifiedEvent.Event:Wait() end
verifiedEvent:Destroy()


if not game:IsLoaded() then game.Loaded:Wait() end

local Players       = game:GetService("Players")
local UIS           = game:GetService("UserInputService")
local RunService    = game:GetService("RunService")
local TS            = game:GetService("TweenService")
local RS            = game:GetService("ReplicatedStorage")
local HttpService   = game:GetService("HttpService")
local VirtualUser   = game:GetService("VirtualUser")
local lp            = Players.LocalPlayer

local R = RS:WaitForChild("Remotes", 5)
if not (R and R:WaitForChild("Throw_Start", 5)) then
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Horizon Hub v2",
            Text = "This script only works in Throw Food For Animals.",
            Duration = 8,
        })
    end)
    return
end

-- Credits To Dr6seven AKA 
local SCRIPT_BASE   = "https://raw.githubusercontent.com/Dr6seven/throwforanimals/refs/heads/main/"
local SCRIPT_FILES  = { "script.lua", "throw.lua" }
local ICON_URL      = "https://raw.githubusercontent.com/Dr6seven/throwforanimals/refs/heads/main/icon/icon.png"
local CONFIG_FILE   = "ThrowForAnimals_configs.json"
local LASTSTATE_FILE= "ThrowForAnimals_laststate.json"
local AUTOEXEC_FLAG = "ThrowForAnimals_autoexec.txt"
local COUNTER_BASE  = "https://abacus.jasoncameron.dev"
local COUNTER_NS    = "throwforanimals-d33rzn"
local COUNTER_KEY   = "users"
local SALT          = "ganti-teks-acak-ini"

local RETRY         = 3
local SILENT_LIMIT  = 20
local TAP_DELAY     = 0.15
local TP_HEIGHT     = 3.5
local LINE_HEIGHT   = 3
local EQUIP_EVERY   = 30
local SELL_EVERY    = 60
local UPGRADE_EVERY = 10
local FOOD_EVERY    = 15
local FOOD_MAX      = 120
local THROW_ACCURACY= 1
local THROW_EXTRA   = 0.3

local CONFIG_KEYS = {
    "AutoTrain","AutoThrow","AutoIndex","AutoBuyFood","AutoEquipFood",
    "AutoBar","AutoSell","AutoEquip","AutoFence","Invisible","AutoExec",
    "AutoReconnect","AntiAfk","ESPPlayer","AutoBuyEvent","AutoInfuse",
    "AutoClaimIndex","AutoClaimCollection","FpsBooster",
}


if getgenv().TFAVisual then pcall(getgenv().TFAVisual.stop) end
getgenv().THROW_POS = nil
if getgenv().__TapConn then pcall(function() getgenv().__TapConn:Disconnect() end) end
if getgenv().__ThrowConns then
    for _, c in ipairs(getgenv().__ThrowConns) do pcall(function() c:Disconnect() end) end
end
getgenv().__ThrowConns = {}
local conns = getgenv().__ThrowConns
local function track(c) conns[#conns + 1] = c; return c end
if getgenv().ThrowUI then pcall(function() getgenv().ThrowUI:Destroy() end) end
local myToken = (getgenv().__ThrowToken or 0) + 1
getgenv().__ThrowToken = myToken


local State = {
    AutoTrain = false, AutoThrow = false, AutoIndex = false, AutoReconnect = false,
    AutoBuyFood = false, AutoEquipFood = false, AutoBar = false, AutoSell = false,
    AutoEquip = false, AutoFence = false, Invisible = false, AutoExec = false,
    AntiAfk = true, ESPPlayer = false, AutoBuyEvent = false, AutoInfuse = false,
    AutoClaimIndex = false, AutoClaimCollection = false, FpsBooster = true,
    Webhook = false,
}

local taps, extra, lastId = 0, 0, 0
local running = false
local throwing = false
local throwPause = false
local throws = 0
local lastEvent = os.clock()


local toggleObjs    = {}
local applyingState = false

local function forceOff(key)
    State[key] = false
    applyingState = true
    if toggleObjs[key] then pcall(function() toggleObjs[key]:Set(false) end) end
    applyingState = false
end

local function applyState(key, value)
    if State[key] == nil or State[key] == value then return end
    State[key] = value
    applyingState = true
    if toggleObjs[key] then pcall(function() toggleObjs[key]:Set(value) end) end
    applyingState = false
end


local function fsOk() return writefile and readfile and isfile end

local cfgData = { configs = {}, autoload = nil }
local function readCfgFile()
    if not (fsOk() and isfile(CONFIG_FILE)) then return end
    local okR, data = pcall(function() return HttpService:JSONDecode(readfile(CONFIG_FILE)) end)
    if okR and typeof(data) == "table" and typeof(data.configs) == "table" then
        cfgData.configs = data.configs
        cfgData.autoload = (typeof(data.autoload) == "string" and data.autoload ~= "") and data.autoload or nil
    end
end
local function writeCfgFile()
    if not fsOk() then return false end
    return pcall(function()
        writefile(CONFIG_FILE, HttpService:JSONEncode({ configs = cfgData.configs, autoload = cfgData.autoload or "" }))
    end)
end
readCfgFile()


local function userKey()
    local h1, h2 = 5381, 52711
    for c in (SALT .. tostring(lp.UserId)):gmatch(".") do
        h1 = (h1 * 33 + c:byte()) % 4294967296
        h2 = (h2 * 31 + c:byte()) % 4294967296
    end
    return string.format("u%08x%08x", h1, h2)
end

local function counterCall(path)
    local okH, body = pcall(function() return game:HttpGet(COUNTER_BASE .. path) end)
    if not okH then return nil end
    local okJ, data = pcall(function() return HttpService:JSONDecode(body) end)
    if okJ and typeof(data) == "table" then
        local v = tonumber(data.value) or tonumber(data.count) or tonumber(data.Count)
        if v then return v end
    end
    return tonumber(body)
end

local function fetchTotalUsers(onValue)
    local url = "/get/" .. COUNTER_NS .. "/" .. COUNTER_KEY
    local total = counterCall(url)
    if total and onValue then onValue(total) end
    local regFile = "tfa_reg_" .. userKey() .. ".txt"
    local state = (isfile and isfile(regFile)) and readfile(regFile) or ""
    if state ~= "1" then
        if state ~= "pending" then
            local v = counterCall("/hit/" .. COUNTER_NS .. "/" .. userKey())
            if v == 1 then state = "pending" elseif v then state = "1" end
        end
        if state == "pending" then
            if writefile then pcall(writefile, regFile, "pending") end
            for _ = 1, 3 do
                if counterCall("/hit/" .. COUNTER_NS .. "/" .. COUNTER_KEY) then state = "1"; break end
                task.wait(2)
            end
        end
        if state == "1" then
            if writefile then pcall(writefile, regFile, "1") end
            total = counterCall(url) or total
            if total and onValue then onValue(total) end
        end
    end
    return total
end


local function getHRP()
    return lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
end

local function summarize(res)
    if typeof(res) ~= "table" then return tostring(res) end
    local p = {}
    for k, v in pairs(res) do p[#p + 1] = tostring(k) .. "=" .. tostring(v) end
    local s = table.concat(p, ", ")
    return #s > 90 and s:sub(1, 90) .. "..." or s
end

local function restoreLook()
    pcall(function() R.Throw_Cancel:InvokeServer() end)
    local char = lp.Character
    if char then
        for _, v in ipairs(char:GetDescendants()) do
            if v:IsA("BasePart") then
                if v.Name ~= "HumanoidRootPart" then v.Transparency = 0 end
                v.LocalTransparencyModifier = 0
            elseif v:IsA("Decal") then
                v.Transparency = 0
            end
        end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then workspace.CurrentCamera.CameraSubject = hum end
    end
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
end

local function aktif(token)
    return getgenv().__ThrowToken == myToken and State.AutoIndex and token == indexRun
end


local loops = {}

local function callOnce(remoteName)
    local okC, res = pcall(function() return R[remoteName]:InvokeServer() end)
    if not okC then return end
    return res
end

local function startFnLoop(key, interval, fn)
    if loops[key] then return end
    loops[key] = true
    task.spawn(function()
        while State[key] and getgenv().__ThrowToken == myToken do
            pcall(fn)
            local t0 = os.clock()
            while State[key] and getgenv().__ThrowToken == myToken and os.clock() - t0 < interval do
                task.wait(0.5)
            end
        end
        loops[key] = false
    end)
end

local function startLoop(key, remoteName, interval)
    startFnLoop(key, interval, function() callOnce(remoteName) end)
end


local function getTrainSpot()
    local props = workspace:FindFirstChild("LocalPlotProps")
    local area = props and props:FindFirstChild("TrainingArea")
    return area and area:FindFirstChild("TrainingSpot")
end

local function tpToTraining()
    local spot = getTrainSpot()
    local h = getHRP()
    if not (spot and h) then return false end
    h.CFrame = CFrame.new(spot.Position + Vector3.new(0, TP_HEIGHT, 0))
    return true
end

local function alive()
    return State.AutoTrain and getgenv().__ThrowToken == myToken
end

getgenv().__TapConn = R.Training_Bonus.OnClientEvent:Connect(function(...)
    lastEvent = os.clock()
    if not State.AutoTrain then return end
    local id
    for _, a in ipairs({...}) do
        if typeof(a) == "number" then id = a; break end
    end
    if not id then return end
    task.spawn(function()
        task.wait(TAP_DELAY)
        local okT, res = pcall(function() return R.Training_TapBonus:InvokeServer(id) end)
        if okT and typeof(res) == "table" and res.Ok then
            taps += 1
            extra += tonumber(res.ExtraReps) or 0
            lastId = id
        end
    end)
end)

local function trainLoop()
    running = true
    local started = false
    while alive() do
        if started and os.clock() - lastEvent > SILENT_LIMIT then
            started = false
        end
        if not started then
            local okS, res = pcall(function() return R.Training_Start:InvokeServer() end)
            local reason = (okS and typeof(res) == "table" and res.Ok == false) and tostring(res.Reason) or nil
            if not okS then
                task.wait(RETRY)
            elseif reason == "Busy" then
                started = true; lastEvent = os.clock()
            elseif reason == "TooFar" then
                if tpToTraining() then task.wait(0.6) else task.wait(RETRY) end
            elseif reason then
                task.wait(RETRY)
            else
                started = true; lastEvent = os.clock()
            end
        end
        task.wait(1)
    end
    running = false
end

local function stopTraining()
    pcall(function() R.Training_Stop:InvokeServer() end)
end

local setTrain
setTrain = function(on)
    if on then
        if State.AutoThrow or State.AutoIndex then
            forceOff("AutoTrain")
            return
        end
        if running then return end
        task.spawn(trainLoop)
    else
        task.spawn(function()
            local t0 = os.clock()
            while running and os.clock() - t0 < 5 do task.wait(0.1) end
            stopTraining()
        end)
    end
end


local function upgradeBar()
    local okC, res = pcall(function() return R.Stand_Upgrade:InvokeServer() end)
    if okC and typeof(res) == "table" and res.Ok == false and tostring(res.Reason) == "TooFar" then
        if not State.AutoThrow and not State.AutoIndex and tpToTraining() then
            task.wait(0.6)
            pcall(function() R.Stand_Upgrade:InvokeServer() end)
        end
    end
end


local foodNext = 1
local foodBest = 0
local foodEquipped = 0

local function buyFood()
    for _ = 1, 80 do
        if not State.AutoBuyFood then return end
        if foodNext > FOOD_MAX then return end
        local okB, res = pcall(function() return R.Shop_Buy:InvokeServer(foodNext) end)
        if not okB then return end
        local reason = (typeof(res) == "table" and res.Ok == false) and tostring(res.Reason):lower() or nil
        if not reason then
            foodBest = math.max(foodBest, foodNext)
            foodNext += 1
            task.wait(0.3)
        elseif reason:find("owned") or reason:find("already") or reason:find("bought") then
            foodBest = math.max(foodBest, foodNext)
            foodNext += 1
            task.wait(0.15)
        else
            return
        end
    end
end

local function equipBestFood()
    if State.AutoIndex then return end
    if foodBest <= 0 then
        for i = FOOD_MAX, 1, -1 do
            if not State.AutoEquipFood then return end
            local okE, res = pcall(function() return R.Shop_Equip:InvokeServer(i) end)
            local reason = (okE and typeof(res) == "table" and res.Ok == false) and tostring(res.Reason):lower() or nil
            if okE and (not reason or reason:find("already")) then
                foodBest = i; foodEquipped = i
                return
            end
            task.wait(0.08)
        end
        return
    end
    if foodBest == foodEquipped then return end
    local okE, res = pcall(function() return R.Shop_Equip:InvokeServer(foodBest) end)
    if okE and not (typeof(res) == "table" and res.Ok == false) then
        foodEquipped = foodBest
    end
end


local function getThrowLine()
    local area = workspace:FindFirstChild("StarterArea")
    return area and area:FindFirstChild("CrossLine")
end

local function tpToThrow(useSaved)
    local h = getHRP()
    if not h then return false end
    local saved = getgenv().THROW_POS
    if useSaved and saved then
        h.CFrame = CFrame.new(saved + Vector3.new(0, 0.5, 0))
        return true
    end
    local line = getThrowLine()
    if line and line:IsA("BasePart") then
        local p = line.Position
        h.CFrame = CFrame.new(p.X, p.Y + LINE_HEIGHT, p.Z)
        return true
    end
    if saved then
        h.CFrame = CFrame.new(saved + Vector3.new(0, 0.5, 0))
        return true
    end
    return false
end


local popGui = Instance.new("ScreenGui")
popGui.Name = "TFAPopups"
popGui.ResetOnSpawn = false
local okPG = pcall(function() popGui.Parent = (gethui and gethui()) or game:GetService("CoreGui") end)
if not okPG or not popGui.Parent then popGui.Parent = lp:WaitForChild("PlayerGui") end
getgenv().ThrowUI = popGui

local popupHolder = Instance.new("Frame")
popupHolder.Name = "PopupHewan"
popupHolder.BackgroundTransparency = 1
popupHolder.Size = UDim2.new(0, 210, 0, 240)
popupHolder.Position = UDim2.new(0.5, -105, 0, -30)
popupHolder.ZIndex = 50
popupHolder.Parent = popGui
local popupList = Instance.new("UIListLayout", popupHolder)
popupList.Padding = UDim.new(0, 5)
popupList.HorizontalAlignment = Enum.HorizontalAlignment.Center
popupList.SortOrder = Enum.SortOrder.LayoutOrder

local POP_RARITY = {
    common   = Color3.fromRGB(170,170,180), uncommon  = Color3.fromRGB(90,200,120),
    rare     = Color3.fromRGB(80,150,240),  epic      = Color3.fromRGB(170,100,240),
    legendary= Color3.fromRGB(250,190,60),  mythic    = Color3.fromRGB(240,80,110),
    divine   = Color3.fromRGB(255,235,140), sovereign = Color3.fromRGB(255,80,80),
}
local POP_VARIANT = {
    gold = Color3.fromRGB(245,197,66), diamond = Color3.fromRGB(111,216,255),
    emerald = Color3.fromRGB(80,220,140), rainbow = Color3.fromRGB(255,150,255),
    ruby = Color3.fromRGB(235,60,80),
}
local POP_SIZE = {
    titanic = Color3.fromRGB(255,95,162), giant = Color3.fromRGB(255,154,60),
}
local POP_SFX = { "","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc","Ud","Dd","Td","Qad","Qid","Sxd","Spd","Ocd","Nod","Vg" }
local popupN = 0
local popCache = {}
local C_BG   = Color3.fromRGB(18,18,22)
local C_GRAY = Color3.fromRGB(150,150,160)
local C_GOOD = Color3.fromRGB(90,200,120)

local function popFmt(n)
    n = tonumber(n)
    if not n or n ~= n then return nil end
    local i = 1
    while n >= 1000 and i < #POP_SFX do n = n / 1000; i += 1 end
    local s
    if n >= 100 then s = ("%.0f"):format(n)
    elseif n >= 10 then s = ("%.1f"):format(n)
    else s = ("%.2f"):format(n) end
    if s:find("%.") then s = (s:gsub("0+$","")); s = (s:gsub("%.$","")) end
    return s .. POP_SFX[i]
end

local function popNorm(s) return (tostring(s):lower():gsub("[%s_%-]","")) end

local POP_MUT = { "diamond","emerald","gold","rainbow","ruby" }
local POP_MUTNAMES = { diamond=true,emerald=true,gold=true,rainbow=true,ruby=true }
local POP_KOSONG = { [""]=true, none=true, ["false"]=true }

local function popBaca(r)
    local varian, ukuran
    for k, v in pairs(r) do
        if type(v) == "string" and k ~= "DisplayName" and k ~= "Rarity" then
            local kl, vl = tostring(k):lower(), v:lower()
            if not POP_KOSONG[vl] then
                if not varian and vl ~= "normal" and (POP_MUTNAMES[vl] or kl:find("mut") or kl:find("variant")) then
                    varian = v
                elseif not ukuran and kl:find("size") then
                    ukuran = v
                end
            end
        end
    end
    return varian, ukuran
end

local function popupHewan(r)
    if typeof(r) ~= "table" then return end
    popupN += 1
    local list = {}
    for _, c in ipairs(popupHolder:GetChildren()) do
        if c:IsA("Frame") then list[#list + 1] = c end
    end
    table.sort(list, function(a, b) return a.LayoutOrder < b.LayoutOrder end)
    while #list >= 3 do table.remove(list, 1):Destroy() end

    local nama   = tostring(r.DisplayName or "?")
    local rarity = tostring(r.Rarity or "")
    local varian, ukuran = popBaca(r)
    local income = popFmt(r.Income or r.IncomePerSecond)
    local warnaRar = POP_RARITY[rarity:lower()] or C_GRAY
    local teks1  = varian and varian:upper() or rarity:upper()
    local warna1 = varian and (POP_VARIANT[varian:lower()] or Color3.fromRGB(240,240,245)) or warnaRar

    local w = Instance.new("Frame")
    w.LayoutOrder = popupN
    w.Size = UDim2.new(1,0,0,76)
    w.BackgroundTransparency = 1
    w.ZIndex = 50
    w.Parent = popupHolder

    local f = Instance.new("Frame")
    f.Size = UDim2.new(1,0,1,0)
    f.Position = UDim2.new(0,0,0,-130)
    f.BackgroundColor3 = C_BG
    f.BorderSizePixel = 0
    f.ZIndex = 50
    f.Parent = w
    local cr = Instance.new("UICorner",f); cr.CornerRadius = UDim.new(0,8)
    local st = Instance.new("UIStroke",f)
    st.Color = Color3.fromRGB(120,120,130)
    st.Thickness = 2

    local img = Instance.new("Frame")
    img.Size = UDim2.new(0,76,1,0)
    img.BackgroundColor3 = warnaRar:Lerp(Color3.new(0,0,0), 0.55)
    img.BorderSizePixel = 0
    img.ZIndex = 51
    img.Parent = f

    local ikon = r.Image or r.Icon
    if type(ikon) == "string" and ikon:find("rbx") then
        local il = Instance.new("ImageLabel")
        il.Size = UDim2.new(1,0,1,0)
        il.BackgroundTransparency = 1
        il.Image = ikon
        il.ScaleType = Enum.ScaleType.Fit
        il.ZIndex = 52
        il.Parent = img
    else
        local hl = Instance.new("TextLabel")
        hl.Size = UDim2.new(1,0,1,0)
        hl.BackgroundTransparency = 1
        hl.Text = nama:sub(1,1):upper()
        hl.TextColor3 = warnaRar
        hl.Font = Enum.Font.GothamBold
        hl.TextSize = 30
        hl.ZIndex = 52
        hl.Parent = img
    end

    local box = Instance.new("Frame")
    box.Size = UDim2.new(1,-88,1,-2)
    box.Position = UDim2.new(0,82,0,0)
    box.BackgroundTransparency = 1
    box.ZIndex = 51
    box.Parent = f
    local bl = Instance.new("UIListLayout",box)
    bl.VerticalAlignment = Enum.VerticalAlignment.Center
    bl.SortOrder = Enum.SortOrder.LayoutOrder

    local function baris(order, teks, size, warna)
        local t = Instance.new("TextLabel")
        t.LayoutOrder = order
        t.Size = UDim2.new(1,-24,0,size+4)
        t.BackgroundTransparency = 1
        t.Text = teks
        t.TextColor3 = warna
        t.Font = Enum.Font.GothamBold
        t.TextSize = size
        t.TextXAlignment = Enum.TextXAlignment.Left
        t.TextTruncate = Enum.TextTruncate.AtEnd
        t.ZIndex = 52
        t.Parent = box
    end
    if teks1 ~= "" then baris(1, teks1, 10, warna1) end
    baris(2, nama, 13, Color3.new(1,1,1))
    if ukuran then baris(3, ukuran:upper(), 10, POP_SIZE[ukuran:lower()] or C_GRAY) end
    if income then baris(4, "$"..income.."/s", 11, C_GOOD) end

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1,0,0,2)
    bar.Position = UDim2.new(0,0,1,-2)
    bar.BackgroundColor3 = warna1
    bar.BorderSizePixel = 0
    bar.ZIndex = 53
    bar.Parent = f

    local tertutup = false
    local function tutup()
        if tertutup or not f.Parent then return end
        tertutup = true
        TS:Create(f, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            { Position = UDim2.new(0,0,0,-130) }):Play()
        task.wait(0.32)
        w:Destroy()
    end

    local x = Instance.new("TextButton")
    x.Size = UDim2.new(0,26,0,26)
    x.Position = UDim2.new(1,-28,0,2)
    x.BackgroundTransparency = 1
    x.Text = "×"
    x.TextColor3 = Color3.fromRGB(200,200,205)
    x.Font = Enum.Font.GothamBold
    x.TextSize = 18
    x.AutoButtonColor = false
    x.ZIndex = 54
    x.Parent = f
    x.Activated:Connect(tutup)

    TS:Create(f, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        { Position = UDim2.new(0,0,0,0) }):Play()
    TS:Create(bar, TweenInfo.new(3.2, Enum.EasingStyle.Linear),
        { Size = UDim2.new(0,0,0,2) }):Play()
    task.delay(3.2, tutup)
end


local tooFarStreak = 0

local function doThrow()
    local s = R.Throw_Start:InvokeServer()
    if typeof(s) ~= "table" then task.wait(2); return end
    if not s.Ok then
        local why = tostring(s.Reason)
        if why == "TooFar" then
            tooFarStreak += 1
            if tooFarStreak >= 6 then
                tooFarStreak = 0; task.wait(5)
            elseif tpToThrow(tooFarStreak >= 3) then
                task.wait(0.6)
            else
                task.wait(2)
            end
        elseif why == "Busy" then
            pcall(function() R.Throw_Complete:InvokeServer() end)
            task.wait(0.5)
            pcall(function() R.Throw_Cancel:InvokeServer() end)
            task.wait(1)
        elseif why == "Cooldown" then
            task.wait(0.5)
        else
            task.wait(2)
        end
        return
    end
    tooFarStreak = 0
    if not getgenv().THROW_POS then
        local h = getHRP()
        if h then getgenv().THROW_POS = h.Position end
    end
    local r = R.Throw_Resolve:InvokeServer(THROW_ACCURACY)
    if typeof(r) ~= "table" or not r.Ok then
        pcall(function() R.Throw_Cancel:InvokeServer() end)
        task.wait(2)
        return
    end
    throws += 1
    pcall(popupHewan, r)
    if getgenv().__TFAWebhook then pcall(getgenv().__TFAWebhook, r) end
    task.wait((tonumber(r.FlightTime) or 6) + THROW_EXTRA)
    local done = false
    task.spawn(function() pcall(function() R.Throw_Complete:InvokeServer() end); done = true end)
    local t0 = os.clock()
    while not done and os.clock() - t0 < 3 do task.wait(0.1) end
    task.wait(0.5)
    tpToThrow()
end

local function throwLoop()
    throwing = true
    if tpToThrow() then task.wait(0.5) end
    while (State.AutoThrow or State.AutoIndex) and not throwPause and getgenv().__ThrowToken == myToken do
        local okT, err = pcall(doThrow)
        if not okT then task.wait(2) end
        task.wait(0.2)
    end
    throwing = false
end

local setThrow
setThrow = function(on)
    if on then
        if State.AutoTrain then forceOff("AutoThrow"); return end
        if State.AutoIndex then forceOff("AutoThrow"); return end
        if throwing then return end
        task.spawn(throwLoop)
    else
        task.spawn(function()
            local t0 = os.clock()
            while throwing and os.clock() - t0 < 12 do task.wait(0.2) end
            restoreLook()
        end)
    end
end


local setIndex
local indexRun = 0

do
    local DC, AC, eco
    local foodAwal, foodSekarang, polaIdx, lastFoodTh, failFood
    local THROWS_PER_TRY = 150
    local STUCK_THROWS = 300
    local MARGIN = 20

    local function bacaMax(data)
        local terbaik
        local function coba(n)
            n = tonumber(n)
            if n and n >= 26 and (not terbaik or n > terbaik) then terbaik = n end
        end
        local hud = lp.PlayerGui:FindFirstChild("HUD")
        local ps = hud and hud:FindFirstChild("PowerSlider")
        local body = ps and ps:FindFirstChild("Body")
        local lbl = body and body:FindFirstChild("Value")
        if lbl then
            local t = lbl.Text:gsub("<[^>]+>","")
            local m = t:match("/%s*([%d%.,]+)")
            if m then coba((m:gsub(",",""))) end
        end
        local ls = lp:FindFirstChild("leaderstats")
        local tp = ls and ls:FindFirstChild("Throw Power")
        if tp then coba(tp.Value) end
        if data then coba(data.ThrowPower) end
        return terbaik
    end

    local function muat()
        if DC and AC and eco then return true end
        local function ambil(getter)
            local obj
            local t0 = os.clock()
            while os.clock() - t0 < 20 do
                local ok, o = pcall(getter)
                if ok and o then obj = o; break end
                task.wait(0.5)
            end
            if not obj then return nil end
            local hasil, selesai = nil, false
            task.spawn(function()
                local ok, m = pcall(require, obj)
                if ok then hasil = m end
                selesai = true
            end)
            local t1 = os.clock()
            while not selesai and os.clock() - t1 < 15 do task.wait(0.2) end
            return hasil
        end
        DC = DC or ambil(function() return lp.PlayerScripts.Client.Controllers.DataController end)
        if not DC then return false end
        AC = AC or ambil(function() return RS.Config.AreasConfig end)
        if not AC then return false end
        eco = eco or ambil(function() return RS.Config.AnimalEconomy end)
        return (DC and AC and eco) and true or false
    end

    local function ambilData()
        if not DC then return nil end
        local ok, data = pcall(function() return DC.GetPlayerData() end)
        if ok and typeof(data) == "table" then return data end
        return nil
    end

    local function hewanArea(a)
        local nama = {}
        local k1, k2 = popNorm(a.Key), popNorm(a.Name)
        for n, d in pairs(eco.List) do
            if type(d) == "table" and d.Area ~= nil then
                local ar = popNorm(d.Area)
                if ar == k1 or ar == k2 then nama[#nama+1] = n end
            end
        end
        return nama
    end

    local function kurang(a, idxT)
        local miss, semua = {}, hewanArea(a)
        for _, n in ipairs(semua) do
            if not idxT[n] then miss[#miss+1] = n end
        end
        return miss, #semua
    end

    local function putarMakanan(th, owned) end

    local function setPower(v)
        local okc, res = pcall(function() return R.Player_SetThrowPower:InvokeServer(v) end)
        if not okc then return false, "remote error" end
        if typeof(res) ~= "table" then return false, "bad reply" end
        if res.Ok == false then return false, tostring(res.Reason) end
        local pw = tonumber(res.Power) or 0
        if pw <= 0 then return false, "power 0" end
        return true, pw
    end

    local pausing = false
    local function pasangPower(v, token)
        local alasan
        for _ = 1, 8 do
            local ok, hasil = setPower(v)
            if ok then return true, hasil end
            alasan = hasil; task.wait(0.3)
        end
        pausing = true; throwPause = true
        local t0 = os.clock()
        while throwing and os.clock() - t0 < 20 and aktif(token) do task.wait(0.2) end
        pcall(restoreLook)
        local ok, hasil = setPower(v)
        task.wait(0.6); throwPause = false
        if aktif(token) and not throwing then task.spawn(throwLoop) end
        pausing = false
        if ok then return true, hasil end
        setPower(26)
        return false, hasil or alasan
    end

    local function farmArea(a, miss, maxP, token)
        local segLen = a.Length / a.Segments
        local lo = math.max(a.StartDistance, 26)
        local hi = a.StartDistance + a.Length - 1 - MARGIN
        local cands, seen = {}, {}
        local function tambah(p)
            p = math.clamp(math.floor(p), lo, hi)
            if not seen[p] then seen[p]=true; cands[#cands+1]=p end
        end
        for _, nama in ipairs(miss) do
            local d = eco.List[nama]
            local r = d and d.Rank or 1
            local s = math.clamp(math.ceil(r * a.Segments / 8), 1, a.Segments)
            tambah(a.StartDistance + (s - 0.5) * segLen)
        end
        tambah(hi)
        for s = a.Segments, 1, -1 do tambah(a.StartDistance + (s-0.5)*segLen) end

        local stuckBatas = math.clamp(#cands * THROWS_PER_TRY, STUCK_THROWS, 800)
        local sisa = #miss
        local d0 = ambilData()
        local lastGain = d0 and tonumber(d0.Throws) or 0
        local ci, gagal = 0, 0

        while aktif(token) do
            ci = ci % #cands + 1
            local pwr = cands[ci]
            local okP, hasilP = false, "exceeds max power"
            if pwr < maxP then okP, hasilP = pasangPower(pwr, token) end
            if not aktif(token) then return nil end
            if okP then
                gagal = 0
                local d1 = ambilData()
                local mulai = d1 and tonumber(d1.Throws) or lastGain
                local lastTh, gerak, tCand = mulai, os.clock(), os.clock()
                while aktif(token) do
                    task.wait(1)
                    if State.AutoTrain then applyState("AutoIndex", false); return nil end
                    if not throwing and not pausing then task.spawn(throwLoop) end
                    local d = ambilData()
                    if d then
                        local th = tonumber(d.Throws) or lastTh
                        putarMakanan(th, d.OwnedFoods)
                        local m2 = kurang(a, d.Index or {})
                        if #m2 < sisa then
                            sisa = #m2; lastGain = th; mulai = th; tCand = os.clock()
                            if sisa == 0 then return true end
                        end
                        if th > lastTh then lastTh = th; gerak = os.clock() end
                        if th - lastGain >= stuckBatas then return false end
                        if th - mulai >= THROWS_PER_TRY then break end
                    end
                    if os.clock() - gerak > 120 then gerak = os.clock() end
                    if os.clock() - tCand > 180 then break end
                end
            else
                gagal += 1
                if gagal >= #cands then return false end
                task.wait(1)
            end
        end
        return nil
    end

    local function loopIndex(token)
        if not muat() then
            if State.AutoIndex then applyState("AutoIndex", false) end
            return
        end
        local lewat = {}
        while aktif(token) do
            local data = ambilData()
            if not data then
                task.wait(3)
            else
                local idxT = data.Index or {}
                local maxP = bacaMax(data)
                if not maxP then applyState("AutoIndex", false); return end
                local target, miss
                local punya, semua = 0, 0
                for _, a in ipairs(AC.List) do
                    local m, tot = kurang(a, idxT)
                    semua += tot; punya += (tot - #m)
                    if not target and #m > 0 and not lewat[a.Key] and a.StartDistance < maxP then
                        target, miss = a, m
                    end
                end
                if not target then applyState("AutoIndex", false); return end
                local hasil = farmArea(target, miss, maxP, token)
                if hasil == false then lewat[target.Key] = true end
            end
        end
    end

    setIndex = function(on)
        indexRun += 1
        if on then
            if State.AutoTrain then forceOff("AutoIndex"); return end
            if State.AutoThrow then forceOff("AutoThrow") end
            foodAwal = nil; foodSekarang = nil; polaIdx = 0; lastFoodTh = nil; failFood = 0
            task.spawn(function(token)
                local ok, err = pcall(loopIndex, token)
                if not ok then
                    if State.AutoIndex then applyState("AutoIndex", false) end
                    warn("[AutoIndex] " .. tostring(err))
                end
            end, indexRun)
        else
            task.spawn(function()
                local t0 = os.clock()
                while throwing and os.clock() - t0 < 12 do task.wait(0.2) end
                if foodAwal then
                    pcall(function() R.Shop_Equip:InvokeServer(foodAwal) end)
                    foodEquipped = foodAwal; foodSekarang = nil
                end
                if not State.AutoThrow then restoreLook() end
            end)
        end
    end
end


local petBusy = false
local function petCall(remoteName)
    while petBusy do task.wait(0.2) end
    petBusy = true
    pcall(callOnce, remoteName)
    petBusy = false
end


local setInvisible
do
    local origVal = setmetatable({}, { __mode = "k" })
    local invisRunning = false
    local function hideObject(o, hidden)
        if o:IsA("BasePart") or o:IsA("Decal") or o:IsA("Texture") then
            if hidden then
                if origVal[o] == nil then origVal[o] = o.Transparency end
                o.Transparency = 1
            elseif origVal[o] ~= nil then
                o.Transparency = origVal[o]; origVal[o] = nil
            end
        elseif o:IsA("BillboardGui") or o:IsA("SurfaceGui") or o:IsA("ParticleEmitter")
            or o:IsA("Beam") or o:IsA("Trail") or o:IsA("Highlight") or o:IsA("Light") then
            if hidden then
                if origVal[o] == nil then origVal[o] = o.Enabled end
                o.Enabled = false
            elseif origVal[o] ~= nil then
                o.Enabled = origVal[o]; origVal[o] = nil
            end
        end
    end
    local invisConn, charConn
    local function disconnectInvis()
        if invisConn then invisConn:Disconnect(); invisConn = nil end
        if charConn then charConn:Disconnect(); charConn = nil end
    end
    local function invisTick(on)
        local char = lp.Character
        if not char then return end
        for _, d in ipairs(char:GetDescendants()) do hideObject(d, on) end
    end
    local function startInvisLoop()
        disconnectInvis()
        if not State.Invisible then
            pcall(invisTick, false)
            return
        end
        local char = lp.Character
        if char then
            pcall(invisTick, true)
            invisConn = track(char.DescendantAdded:Connect(function(obj)
                if State.Invisible and getgenv().__ThrowToken == myToken then
                    pcall(hideObject, obj, true)
                end
            end))
        end
        charConn = track(lp.CharacterAdded:Connect(function(newChar)
            if not State.Invisible or getgenv().__ThrowToken ~= myToken then return end
            task.defer(function()
                if not State.Invisible or getgenv().__ThrowToken ~= myToken then return end
                for _, obj in ipairs(newChar:GetDescendants()) do hideObject(obj, true) end
                if invisConn then invisConn:Disconnect() end
                invisConn = track(newChar.DescendantAdded:Connect(function(obj)
                    if State.Invisible and getgenv().__ThrowToken == myToken then
                        pcall(hideObject, obj, true)
                    end
                end))
            end)
        end))
    end
    function setInvisible() startInvisLoop() end
end


local setESP
do
    local folder = Instance.new("Folder")
    folder.Name = "ESPPlayer"
    folder.Parent = popGui
    local entries = {}
    local espConns = {}
    local espRunning = false
    local ESP_COLOR = Color3.fromRGB(255, 80, 80)
    local function hapus(plr)
        local e = entries[plr]
        if e then
            pcall(function() e.hl:Destroy() end)
            pcall(function() e.bb:Destroy() end)
            entries[plr] = nil
        end
    end
    local function pasang(plr)
        if plr == lp then return end
        hapus(plr)
        local char = plr.Character
        local root = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head"))
        if not root then return end
        local hl = Instance.new("Highlight")
        hl.Adornee = char; hl.FillColor = ESP_COLOR; hl.FillTransparency = 0.75
        hl.OutlineColor = Color3.new(1,1,1); hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        hl.Parent = folder
        local bb = Instance.new("BillboardGui")
        bb.Adornee = root; bb.Size = UDim2.new(0,150,0,18)
        bb.StudsOffset = Vector3.new(0,3.2,0); bb.AlwaysOnTop = true; bb.Parent = folder
        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1,0,1,0); lbl.BackgroundTransparency = 1
        lbl.Text = plr.DisplayName; lbl.TextColor3 = Color3.new(1,1,1)
        lbl.TextStrokeTransparency = 0.3; lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 13; lbl.Parent = bb
        entries[plr] = { hl=hl, bb=bb, lbl=lbl, root=root, nama=plr.DisplayName }
    end
    local function pantau(plr)
        if plr == lp then return end
        espConns[#espConns+1] = plr.CharacterAdded:Connect(function()
            task.wait(0.5)
            if State.ESPPlayer then pasang(plr) end
        end)
        pasang(plr)
    end
    local function berhenti()
        for _, c in ipairs(espConns) do c:Disconnect() end
        espConns = {}
        for plr in pairs(entries) do hapus(plr) end
    end
    function setESP(on)
        berhenti()
        if not on then return end
        for _, plr in ipairs(Players:GetPlayers()) do pantau(plr) end
        espConns[#espConns+1] = Players.PlayerAdded:Connect(pantau)
        espConns[#espConns+1] = Players.PlayerRemoving:Connect(hapus)
        if espRunning then return end
        espRunning = true
        task.spawn(function()
            while getgenv().__ThrowToken == myToken and State.ESPPlayer do
                local char = lp.Character
                local mine = char and char:FindFirstChild("HumanoidRootPart")
                if mine then
                    for _, e in pairs(entries) do
                        if e.root and e.root.Parent then
                            local d = math.floor((e.root.Position - mine.Position).Magnitude)
                            e.lbl.Text = e.nama .. "  [" .. d .. "m]"
                        end
                    end
                end
                task.wait(0.5)
            end
            berhenti(); espRunning = false
        end)
    end
end


local function setAntiAfk(on)
    if getgenv().__AfkConn then
        pcall(function() getgenv().__AfkConn:Disconnect() end)
        getgenv().__AfkConn = nil
    end
    if on then
        getgenv().__AfkConn = lp.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end
end


local queuedThisRun = false

local function saveLastState()
    if not writefile then return end
    local data = {}
    for _, k in ipairs(CONFIG_KEYS) do data[k] = State[k] == true end
    pcall(function() writefile(LASTSTATE_FILE, HttpService:JSONEncode(data)) end)
end

local function tulisFlag(v)
    if writefile then pcall(writefile, AUTOEXEC_FLAG, v and "1" or "0") end
end

local function buildQueued()
    local files = {}
    for _, f in ipairs(SCRIPT_FILES) do files[#files+1] = string.format("%q", SCRIPT_BASE .. f) end
    return table.concat({
        'if not (isfile and isfile("' .. AUTOEXEC_FLAG .. '") and readfile("' .. AUTOEXEC_FLAG .. '") == "1") then return end',
        'getgenv().ThrowAutoStart = true',
        'if not game:IsLoaded() then game.Loaded:Wait() end',
        'task.wait(3)',
        'local urls = {' .. table.concat(files, ", ") .. '}',
        'for _, u in ipairs(urls) do',
        '    local ok, src = pcall(function() return game:HttpGet(u) end)',
        '    if ok and type(src) == "string" and #src > 2000 then',
        '        local fn = loadstring(src)',
        '        if fn then fn(); return end',
        '    end',
        'end',
    }, "\n")
end

local setAutoExec
setAutoExec = function(on, awal)
    getgenv().__ExecLoop = (getgenv().__ExecLoop or 0) + 1
    if not on then
        if not awal then tulisFlag(false) end
        return
    end
    local qot = queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport)
    if not qot then forceOff("AutoExec"); return end
    tulisFlag(true)
    if not queuedThisRun then
        local okQ = pcall(qot, buildQueued())
        if not okQ then forceOff("AutoExec"); return end
        queuedThisRun = true
    end
    local myLoop = getgenv().__ExecLoop
    task.spawn(function()
        while State.AutoExec and getgenv().__ExecLoop == myLoop and getgenv().__ThrowToken == myToken do
            saveLastState(); task.wait(5)
        end
    end)
end


local setAR
do
    local GuiService = game:GetService("GuiService")
    local TeleportService = game:GetService("TeleportService")
    local arConns = {}
    local percobaan, sedang = {}, false

    local function putus()
        for _, c in ipairs(arConns) do pcall(function() c:Disconnect() end) end
        arConns = {}
    end

    local function reconnect(alasan)
        if sedang or not State.AutoReconnect then return end
        if getgenv().__ThrowToken ~= myToken then return end
        sedang = true
        local now = os.clock()
        local baru = {}
        for _, t in ipairs(percobaan) do
            if now - t < 300 then baru[#baru+1] = t end
        end
        percobaan = baru
        if #percobaan >= 5 then
            sedang = false; applyState("AutoReconnect", false)
            return
        end
        percobaan[#percobaan+1] = now
        pcall(saveLastState)
        local qot = queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport)
        if qot and not queuedThisRun then
            tulisFlag(true)
            if pcall(qot, buildQueued()) then queuedThisRun = true end
        end
        task.wait(3 + #percobaan * 2)
        if State.AutoReconnect then
            pcall(function() TeleportService:Teleport(game.PlaceId, lp) end)
        end
        task.wait(45); sedang = false
    end

    setAR = function(on)
        putus()
        if not on then return end
        arConns[#arConns+1] = GuiService.ErrorMessageChanged:Connect(function()
            local msg = GuiService:GetErrorMessage()
            if msg ~= "" then task.spawn(reconnect, msg) end
        end)
        local ok, overlay = pcall(function()
            return game:GetService("CoreGui").RobloxPromptGui.promptOverlay
        end)
        if ok and overlay then
            arConns[#arConns+1] = overlay.ChildAdded:Connect(function(c)
                if c.Name == "ErrorPrompt" then task.spawn(reconnect, "error prompt") end
            end)
        end
        local sekarang = GuiService:GetErrorMessage()
        if sekarang ~= "" then task.spawn(reconnect, sekarang) end
    end
end


local setFpsBooster
do
    local fpsOrig = setmetatable({}, { __mode = "k" })
    local fpsConn, fpsQuality
    local Lighting = game:GetService("Lighting")
    local function fpsSet(inst, prop, value)
        local ok, old = pcall(function() return inst[prop] end)
        if not ok or old == value then return end
        local rec = fpsOrig[inst]
        if not rec then rec = {}; fpsOrig[inst] = rec end
        if rec[prop] == nil then rec[prop] = old end
        pcall(function() inst[prop] = value end)
    end
    local function fpsApply(inst)
        if inst:IsA("BasePart") then
            if inst:IsA("Terrain") then return end
            local m = inst:FindFirstAncestorWhichIsA("Model")
            if m and m:FindFirstChildOfClass("Humanoid") then return end
            fpsSet(inst, "Material", Enum.Material.SmoothPlastic)
            fpsSet(inst, "Reflectance", 0)
            fpsSet(inst, "CastShadow", false)
            fpsSet(inst, "TopSurface", Enum.SurfaceType.Smooth)
            fpsSet(inst, "BottomSurface", Enum.SurfaceType.Smooth)
        elseif inst:IsA("Decal") then
            fpsSet(inst, "Transparency", 1)
        elseif inst:IsA("ParticleEmitter") or inst:IsA("Trail") or inst:IsA("Smoke")
            or inst:IsA("Fire") or inst:IsA("Sparkles") or inst:IsA("Beam") then
            fpsSet(inst, "Enabled", false)
        end
    end
    function setFpsBooster(on)
        if on then
            task.spawn(function()
                fpsSet(Lighting, "GlobalShadows", false)
                for _, e in ipairs(Lighting:GetChildren()) do
                    if e:IsA("PostEffect") then fpsSet(e, "Enabled", false) end
                end
                pcall(function()
                    if not fpsQuality then fpsQuality = settings().Rendering.QualityLevel end
                    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
                end)
                if fpsConn then fpsConn:Disconnect() end
                fpsConn = track(workspace.DescendantAdded:Connect(function(d)
                    if State.FpsBooster and getgenv().__ThrowToken == myToken then
                        task.defer(function()
                            if State.FpsBooster and getgenv().__ThrowToken == myToken and d.Parent then
                                pcall(fpsApply, d)
                            end
                        end)
                    end
                end))
                local n = 0
                for _, d in ipairs(workspace:GetDescendants()) do
                    if not State.FpsBooster then return end
                    fpsApply(d)
                    n += 1
                    if n % 400 == 0 then task.wait() end
                end
            end)
        else
            if fpsConn then fpsConn:Disconnect(); fpsConn = nil end
            task.spawn(function()
                local n = 0
                for inst, props in pairs(fpsOrig) do
                    for prop, old in pairs(props) do
                        pcall(function() inst[prop] = old end)
                    end
                    fpsOrig[inst] = nil
                    n += 1
                    if n % 400 == 0 then task.wait() end
                end
                if fpsQuality then
                    pcall(function() settings().Rendering.QualityLevel = fpsQuality end)
                    fpsQuality = nil
                end
            end)
        end
    end
end


local RSE = game:GetService("ReplicatedStorage")
local dreamRemote = RSE.Remotes.Dreamland_Action

local buyEventSelected = { CashBoost = false, TrainingBoost = false, DreamPotion = false }

task.spawn(function()
    while getgenv().__ThrowToken == myToken do
        if State.AutoBuyEvent then
            local items = {
                { key = "CashBoost",      selected = buyEventSelected.CashBoost },
                { key = "TrainingBoost",  selected = buyEventSelected.TrainingBoost },
                { key = "DreamPotion",    selected = buyEventSelected.DreamPotion },
            }
            for _, it in ipairs(items) do
                if it.selected then
                    pcall(function() dreamRemote:InvokeServer("Buy", it.key) end)
                end
            end
            task.wait(30)
        else
            task.wait(2)
        end
    end
end)

task.spawn(function()
    while getgenv().__ThrowToken == myToken do
        if State.AutoClaimCollection then
            for i = 1, 20 do
                if not State.AutoClaimCollection then break end
                pcall(function() dreamRemote:InvokeServer("Claim", i) end)
                task.wait(0.3)
            end
            task.wait(60)
        else
            task.wait(2)
        end
    end
end)

task.spawn(function()
    while getgenv().__ThrowToken == myToken do
        if State.AutoInfuse then
            pcall(function() dreamRemote:InvokeServer("Infuse") end)
            task.wait(5)
        else
            task.wait(2)
        end
    end
end)

task.spawn(function()
    while getgenv().__ThrowToken == myToken do
        if State.AutoClaimIndex then
            for i = 1, 50 do
                if not State.AutoClaimIndex then break end
                pcall(function() dreamRemote:InvokeServer("ClaimIndex", i) end)
                task.wait(0.2)
            end
            task.wait(60)
        else
            task.wait(2)
        end
    end
end)


do
    local req = request or http_request or (syn and syn.request) or (http and http.request)
    local SFX = {}
    for i = 2, #POP_SFX do SFX[POP_SFX[i]:upper()] = 10^(3*(i-1)) end
    local cfg = { url = "", min = "", on = false }
    local WH_FILE = "ThrowForAnimals_webhook.json"
    if isfile and readfile and isfile(WH_FILE) then
        local ok, d = pcall(function() return HttpService:JSONDecode(readfile(WH_FILE)) end)
        if ok and type(d) == "table" then
            cfg.url = tostring(d.url or ""); cfg.min = tostring(d.min or ""); cfg.on = d.on == true
        end
    end
    local function simpan()
        if writefile then pcall(writefile, WH_FILE, HttpService:JSONEncode(cfg)) end
    end
    local function urlValid(u)
        return u:match("^https://[%w%.]*discord%.com/api/webhooks/%d+/[%w%-_]+") ~= nil
            or u:match("^https://[%w%.]*discordapp%.com/api/webhooks/%d+/[%w%-_]+") ~= nil
    end
    local function parseNilai(s)
        s = tostring(s or ""):gsub("[%s,]",""):upper()
        local n = tonumber(s)
        if n then return n end
        local num, suf = s:match("^([%d%.]+)(%a+)$")
        num = tonumber(num)
        local m = SFX[suf or ""]
        if num and m then return num * m end
        return nil
    end
    local minNilai = parseNilai(cfg.min) or 0
    local lastWarn = 0

    getgenv().__TFAWebhook = function(r)
        if not State.Webhook or typeof(r) ~= "table" or not req then return end
        if not urlValid(cfg.url) then return end
        local income
        for _, key in ipairs({ "income","value","worth" }) do
            for k, v in pairs(r) do
                if tostring(k):lower():find(key, 1, true) and tonumber(v) then income = tonumber(v); break end
            end
            if income then break end
        end
        income = income or tonumber(r.Income or r.IncomePerSecond)
        if income and income < minNilai then return end
        local varian, ukuran = popBaca(r)
        local rarity = tostring(r.Rarity or "?")
        local c = POP_RARITY[rarity:lower()]
        local warna = c and (math.floor(c.R*255)*65536 + math.floor(c.G*255)*256 + math.floor(c.B*255)) or 5793266
        local body = HttpService:JSONEncode({
            username = "Throw For Animals",
            avatar_url = ICON_URL,
            embeds = { {
                title = tostring(r.DisplayName or "?"),
                color = warna,
                fields = {
                    { name = "Rarity",   value = rarity,                       inline = true },
                    { name = "Income",   value = income and popFmt(income) or "?", inline = true },
                    { name = "Variant",  value = varian or "-",                inline = true },
                    { name = "Size",     value = ukuran or "-",                inline = true },
                    { name = "Account",  value = lp.Name,                      inline = true },
                },
                footer = { text = "TFA V2 | WindUI", icon_url = ICON_URL },
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            } },
        })
        task.spawn(function()
            pcall(req, { Url = cfg.url, Method = "POST",
                Headers = { ["Content-Type"] = "application/json" }, Body = body })
        end)
    end


    getgenv().__TFAWebhookCfg  = cfg
    getgenv().__TFAWebhookSave = simpan
    getgenv().__TFAUrlValid    = urlValid
    getgenv().__TFAParseNilai  = parseNilai
    getgenv().__TFAMinNilai    = function(v) minNilai = v end
    getgenv().__TFAReqOk       = req ~= nil
end


local function snapshot()
    local data = {}
    for _, k in ipairs(CONFIG_KEYS) do data[k] = State[k] == true end
    return data
end

local function applyConfig(data)
    for _, k in ipairs(CONFIG_KEYS) do
        if data[k] == false then applyState(k, false) end
    end
    for _, k in ipairs(CONFIG_KEYS) do
        if data[k] == true then applyState(k, true) end
    end
end


local LocalPlayer = Players.LocalPlayer

local Red    = Color3.fromHex("#EF4F1D")
local Orange = Color3.fromHex("#F97316")
local Green  = Color3.fromHex("#10C550")
local Blue   = Color3.fromHex("#257AF7")
local Purple = Color3.fromHex("#7775F2")
local Yellow = Color3.fromHex("#ECA201")
local Grey   = Color3.fromHex("#83889E")
local White  = Color3.fromHex("#FFFFFF")

local WindUI
do
    local env = getgenv()
    local cached = env.__HorizonWindUI
    if type(cached) == "table" and type(cached.CreateWindow) == "function" then
        WindUI = cached
    else
        local okDownload, source = pcall(function()
            return game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua")
        end)
        if not okDownload or type(source) ~= "string" or #source < 1000 then
            error("Horizon Hub: WindUI download failed")
        end
        local compiler = loadstring or load
        local chunk, compileError = compiler(source)
        if not chunk then error("Horizon Hub: WindUI compile failed: " .. tostring(compileError)) end
        local okInit, module = pcall(chunk)
        if not okInit or type(module) ~= "table" or type(module.CreateWindow) ~= "function" then
            error("Horizon Hub: WindUI initialization failed: " .. tostring(module))
        end
        WindUI = module
        env.__HorizonWindUI = module
    end
end

local function notify(title, content, icon, duration)
    WindUI:Notify({
        Title   = title,
        Content = content or "",
        Icon    = icon or "solar:bell-bold",
        Duration = duration or 3,
    })
end

local Window = WindUI:CreateWindow({
    Title  = "Horizon Hub",
    Author = "By HalisAnteo",
    Folder = "ThrowForAnimals_Wind",
    Icon   = "solar:shield-check-bold-duotone",
    Theme  = "Midnight",
    NewElements   = true,
    HideSearchBar = false,
    OpenButton = {
        Title         = "TFA",
        CornerRadius  = UDim.new(1, 0),
        StrokeThickness = 2,
        Enabled  = true,
        Draggable = true,
        OnlyMobile = false,
        Scale    = 1.15,
        Color    = ColorSequence.new(
            Color3.fromHex("#FF6B6B"),
            Color3.fromHex("#FF8E53")
        ),
    },
    Topbar = {
        Height      = 44,
        ButtonsType = "Default",
    },
    User = {
        Enabled   = true,
        Anonymous = false,
        Callback  = function()
            WindUI:Notify({
                Title   = "Profile",
                Content = LocalPlayer.DisplayName .. " • @" .. LocalPlayer.Name,
                Icon    = "solar:user-bold",
                Duration = 3,
            })
        end,
    },
})

Window:SetPanelBackground(false)


Window:Tag({ Title = "v2.0.0", Icon = "github", Color = Color3.fromHex("#1c1c1c"), Border = true })
local fpsTag  = Window:Tag({ Title = "FPS: --",   Icon = "solar:cpu-bolt-bold", Color = Green,  Border = true })
local pingTag = Window:Tag({ Title = "Ping: --ms", Icon = "solar:wifi-bold",    Color = Yellow, Border = true })
task.spawn(function()
    local Stats = game:GetService("Stats")
    local frameCount, frameConn = 0, nil
    frameConn = RunService.Heartbeat:Connect(function() frameCount += 1 end)
    while getgenv().__ThrowToken == myToken do
        task.wait(1)
        local fps = frameCount
        frameCount = 0
        local ok, ping = pcall(function()
            return Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
        end)
        pcall(function() fpsTag:SetTitle("FPS: " .. fps) end)
        pcall(function() pingTag:SetTitle("Ping: " .. (ok and math.floor(ping) or "??") .. "ms") end)
    end
    if frameConn then frameConn:Disconnect() end
end)
Window:Tag({ Title = "✦ Premium Quality", Icon = "solar:shield-check-bold", Color = Purple, Border = true })


task.spawn(function()
    task.wait(8)
    while getgenv().__ThrowToken == myToken do
        pcall(fetchTotalUsers, function(v)

        end)
        for _ = 1, 300 do
            if getgenv().__ThrowToken ~= myToken then break end
            task.wait(1)
        end
    end
end)


local FarmSection = Window:Section({ Title = "Farm" })


do
    local Tab = FarmSection:Tab({
        Title     = "Automation",
        Desc      = "Core farming automation",
        Icon      = "solar:bolt-circle-bold",
        IconColor = Orange,
        IconShape = "Square",
        Border    = true,
    })

    Tab:Paragraph({
        Title     = "Automation Controls",
        Desc      = "Toggle training, throwing, indexing, and bar upgrades. Auto Train and Auto Throw cannot run simultaneously.",
        Image     = "solar:bolt-circle-bold",
        ImageSize = 36,
    })

    local AutoSection = Tab:Section({
        Title     = "Training & Throwing",
        Desc      = "Main automation toggles",
        Box       = true,
        BoxBorder = true,
        Opened    = true,
    })

    toggleObjs["AutoTrain"] = AutoSection:Toggle({
        Flag      = "AutoTrain",
        Title     = "Auto Train",
        Desc      = "Trains continuously and taps bonus events",
        Icon      = "solar:dumbbell-bold",
        IconColor = Orange,
        Value     = State.AutoTrain,
        Callback  = function(state)
            if applyingState then return end
            State.AutoTrain = state
            setTrain(state)
            notify("Auto Train", state and "Enabled" or "Disabled", "solar:dumbbell-bold")
        end,
    })

    Tab:Space()

    toggleObjs["AutoThrow"] = AutoSection:Toggle({
        Flag      = "AutoThrow",
        Title     = "Auto Throw",
        Desc      = "Throws food at the throw line automatically",
        Icon      = "solar:arrow-up-bold",
        IconColor = Blue,
        Value     = State.AutoThrow,
        Callback  = function(state)
            if applyingState then return end
            State.AutoThrow = state
            setThrow(state)
            notify("Auto Throw", state and "Enabled" or "Disabled", "solar:arrow-up-bold")
        end,
    })

    Tab:Space()

    toggleObjs["AutoIndex"] = AutoSection:Toggle({
        Flag      = "AutoIndex",
        Title     = "Auto Index",
        Desc      = "Automatically collects animals for each area",
        Icon      = "solar:list-check-bold",
        IconColor = Purple,
        Value     = State.AutoIndex,
        Callback  = function(state)
            if applyingState then return end
            State.AutoIndex = state
            setIndex(state)
            notify("Auto Index", state and "Enabled" or "Disabled", "solar:list-check-bold")
        end,
    })

    Tab:Space()

    local UpgSection = Tab:Section({
        Title     = "Upgrades",
        Desc      = "Automatic upgrade loops",
        Box       = true,
        BoxBorder = true,
        Opened    = true,
    })

    toggleObjs["AutoBar"] = UpgSection:Toggle({
        Flag      = "AutoBar",
        Title     = "Auto Upgrade Bar",
        Desc      = "Upgrades training bar on a timed loop",
        Icon      = "solar:chart-bold",
        IconColor = Green,
        Value     = State.AutoBar,
        Callback  = function(state)
            if applyingState then return end
            State.AutoBar = state
            if state then startFnLoop("AutoBar", UPGRADE_EVERY, upgradeBar) end
            notify("Auto Upgrade Bar", state and "Enabled" or "Disabled", "solar:chart-bold")
        end,
    })
end


do
    local Tab = FarmSection:Tab({
        Title     = "Food",
        Desc      = "Food buying and equipping",
        Icon      = "solar:apple-bold",
        IconColor = Green,
        IconShape = "Square",
        Border    = true,
    })

    Tab:Paragraph({
        Title     = "Food Management",
        Desc      = "Auto Buy purchases the next food tier when affordable. Auto Equip always keeps your best food equipped.",
        Image     = "solar:apple-bold",
        ImageSize = 36,
    })

    local FoodSection = Tab:Section({
        Title     = "Food Controls",
        Desc      = "Buying and equipping toggles",
        Box       = true,
        BoxBorder = true,
        Opened    = true,
    })

    toggleObjs["AutoBuyFood"] = FoodSection:Toggle({
        Flag      = "AutoBuyFood",
        Title     = "Auto Buy Food",
        Desc      = "Buys next food index when affordable",
        Icon      = "solar:cart-large-2-bold",
        IconColor = Green,
        Value     = State.AutoBuyFood,
        Callback  = function(state)
            if applyingState then return end
            State.AutoBuyFood = state
            if state then startFnLoop("AutoBuyFood", FOOD_EVERY, buyFood) end
            notify("Auto Buy Food", state and "Enabled" or "Disabled", "solar:cart-large-2-bold")
        end,
    })

    Tab:Space()

    toggleObjs["AutoEquipFood"] = FoodSection:Toggle({
        Flag      = "AutoEquipFood",
        Title     = "Auto Equip Best Food",
        Desc      = "Equips your highest-tier owned food",
        Icon      = "solar:star-shine-bold",
        IconColor = Yellow,
        Value     = State.AutoEquipFood,
        Callback  = function(state)
            if applyingState then return end
            State.AutoEquipFood = state
            if state then startFnLoop("AutoEquipFood", FOOD_EVERY, equipBestFood) end
            notify("Auto Equip Food", state and "Enabled" or "Disabled", "solar:star-shine-bold")
        end,
    })

    Tab:Space()

    Tab:Slider({
        Flag  = "FoodMaxSlider",
        Title = "Food Max Index",
        Desc  = "Upper limit for food purchasing",
        Icons = {
            From = "sfsymbols:sunMinFill",
            To   = "sfsymbols:sunMaxFill",
        },
        Step      = 1,
        IsTooltip = true,
        IsTextbox = true,
        Value = { Min = 1, Max = 500, Default = FOOD_MAX },
        Callback = function(value)
            FOOD_MAX = value
        end,
    })
end


do
    local Tab = FarmSection:Tab({
        Title     = "Pets & Sell",
        Desc      = "Animal management",
        Icon      = "solar:dog-bold",
        IconColor = Purple,
        IconShape = "Square",
        Border    = true,
    })

    Tab:Paragraph({
        Title     = "Pet & Plot Management",
        Desc      = "Equip your best animals, sell overflow, and upgrade pen capacity automatically.",
        Image     = "solar:dog-bold",
        ImageSize = 36,
    })

    local PetSection = Tab:Section({
        Title     = "Animals",
        Desc      = "Equip and sell toggles",
        Box       = true,
        BoxBorder = true,
        Opened    = true,
    })

    toggleObjs["AutoEquip"] = PetSection:Toggle({
        Flag      = "AutoEquip",
        Title     = "Auto Equip Best",
        Desc      = "Equips your best animals every 30s",
        Icon      = "solar:crown-bold",
        IconColor = Yellow,
        Value     = State.AutoEquip,
        Callback  = function(state)
            if applyingState then return end
            State.AutoEquip = state
            if state then
                startFnLoop("AutoEquip", EQUIP_EVERY, function()
                    petCall("Plot_EquipBest")
                end)
            end
            notify("Auto Equip Best", state and "Enabled" or "Disabled", "solar:crown-bold")
        end,
    })

    Tab:Space()

    toggleObjs["AutoSell"] = PetSection:Toggle({
        Flag      = "AutoSell",
        Title     = "Auto Sell",
        Desc      = "Sells smaller animals every 60s (pen is safe)",
        Icon      = "solar:tag-price-bold",
        IconColor = Red,
        Value     = State.AutoSell,
        Callback  = function(state)
            if applyingState then return end
            State.AutoSell = state
            if state then
                startFnLoop("AutoSell", SELL_EVERY, function()
                    if State.AutoEquip then
                        petCall("Plot_EquipBest")
                        task.wait(1)
                    end
                    petCall("Plot_SellAll")
                end)
            end
            notify("Auto Sell", state and "Enabled" or "Disabled", "solar:tag-price-bold")
        end,
    })

    Tab:Space()

    local PlotSection = Tab:Section({
        Title     = "Plot",
        Desc      = "Pen and plot upgrades",
        Box       = true,
        BoxBorder = true,
        Opened    = true,
    })

    toggleObjs["AutoFence"] = PlotSection:Toggle({
        Flag      = "AutoFence",
        Title     = "Auto Upgrade Plot",
        Desc      = "Upgrades pen fence capacity on a timed loop",
        Icon      = "solar:home-angle-bold",
        IconColor = Blue,
        Value     = State.AutoFence,
        Callback  = function(state)
            if applyingState then return end
            State.AutoFence = state
            if state then startLoop("AutoFence", "Plot_UpgradeFence", UPGRADE_EVERY) end
            notify("Auto Upgrade Plot", state and "Enabled" or "Disabled", "solar:home-angle-bold")
        end,
    })
end


do
    local Tab = FarmSection:Tab({
        Title     = "Events",
        Desc      = "Dreamland event automation",
        Icon      = "solar:star-fall-bold",
        IconColor = Yellow,
        IconShape = "Square",
        Border    = true,
    })

    Tab:Paragraph({
        Title     = "Dreamland Event",
        Desc      = "Automate Dreamland shop purchases, collection claims, infusing, and index claims.",
        Image     = "solar:star-fall-bold",
        ImageSize = 36,
    })

    local BuySection = Tab:Section({
        Title     = "Auto Buy Event",
        Desc      = "Purchase selected Dreamland items when available",
        Box       = true,
        BoxBorder = true,
        Opened    = true,
    })

    Tab:Dropdown({
        Flag   = "BuyEventItems",
        Title  = "Items to Buy",
        Desc   = "Select which Dreamland shop items to auto-purchase",
        Values = { "2x Cash", "2x Training", "Dream Potion" },
        Multi  = true,
        Value  = {},
        Callback = function(selected)
            buyEventSelected.CashBoost     = selected["2x Cash"]     or false
            buyEventSelected.TrainingBoost = selected["2x Training"] or false
            buyEventSelected.DreamPotion   = selected["Dream Potion"] or false
        end,
    })

    Tab:Space()

    toggleObjs["AutoBuyEvent"] = BuySection:Toggle({
        Flag      = "AutoBuyEvent",
        Title     = "Auto Buy Event",
        Desc      = "Buys selected items from the event shop",
        Icon      = "solar:shop-bold",
        IconColor = Orange,
        Value     = State.AutoBuyEvent,
        Callback  = function(state)
            if applyingState then return end
            State.AutoBuyEvent = state
            notify("Auto Buy Event", state and "Enabled" or "Disabled", "solar:shop-bold")
        end,
    })

    Tab:Space()

    local ClaimSection = Tab:Section({
        Title     = "Claims & Infuse",
        Desc      = "Automated claiming and infusing",
        Box       = true,
        BoxBorder = true,
        Opened    = true,
    })

    toggleObjs["AutoClaimCollection"] = ClaimSection:Toggle({
        Flag      = "AutoClaimCollection",
        Title     = "Auto Claim Collection",
        Desc      = "Claims Dreamland collection rewards every minute",
        Icon      = "solar:gift-bold",
        IconColor = Purple,
        Value     = State.AutoClaimCollection,
        Callback  = function(state)
            if applyingState then return end
            State.AutoClaimCollection = state
            notify("Auto Claim Collection", state and "Enabled" or "Disabled", "solar:gift-bold")
        end,
    })

    Tab:Space()

    toggleObjs["AutoInfuse"] = ClaimSection:Toggle({
        Flag      = "AutoInfuse",
        Title     = "Auto Infuse",
        Desc      = "Automatically triggers Dreamland infuse action",
        Icon      = "solar:magic-stick-3-bold",
        IconColor = Blue,
        Value     = State.AutoInfuse,
        Callback  = function(state)
            if applyingState then return end
            State.AutoInfuse = state
            notify("Auto Infuse", state and "Enabled" or "Disabled", "solar:magic-stick-3-bold")
        end,
    })

    Tab:Space()

    toggleObjs["AutoClaimIndex"] = ClaimSection:Toggle({
        Flag      = "AutoClaimIndex",
        Title     = "Auto Claim Index",
        Desc      = "Claims all index rewards automatically",
        Icon      = "solar:clipboard-check-bold",
        IconColor = Green,
        Value     = State.AutoClaimIndex,
        Callback  = function(state)
            if applyingState then return end
            State.AutoClaimIndex = state
            notify("Auto Claim Index", state and "Enabled" or "Disabled", "solar:clipboard-check-bold")
        end,
    })
end


local VisualSection = Window:Section({ Title = "Visual" })

do
    local Tab = VisualSection:Tab({
        Title     = "Player",
        Desc      = "Visual and performance options",
        Icon      = "solar:eye-bold",
        IconColor = Blue,
        IconShape = "Square",
        Border    = true,
    })

    Tab:Paragraph({
        Title     = "Visual Controls",
        Desc      = "Toggle player visibility, ESP, and FPS performance boost.",
        Image     = "solar:eye-bold",
        ImageSize = 36,
    })

    local VisSection = Tab:Section({
        Title     = "Visual Toggles",
        Box       = true,
        BoxBorder = true,
        Opened    = true,
    })

    toggleObjs["Invisible"] = VisSection:Toggle({
        Flag      = "Invisible",
        Title     = "Invisible",
        Desc      = "Hides your character (client-side only)",
        Icon      = "solar:ghost-bold",
        IconColor = Grey,
        Value     = State.Invisible,
        Callback  = function(state)
            if applyingState then return end
            State.Invisible = state
            setInvisible()
            notify("Invisible", state and "Enabled" or "Disabled", "solar:ghost-bold")
        end,
    })

    Tab:Space()

    toggleObjs["ESPPlayer"] = VisSection:Toggle({
        Flag      = "ESPPlayer",
        Title     = "Player ESP",
        Desc      = "Shows player names and distance through walls",
        Icon      = "solar:user-speak-bold",
        IconColor = Red,
        Value     = State.ESPPlayer,
        Callback  = function(state)
            if applyingState then return end
            State.ESPPlayer = state
            setESP(state)
            notify("Player ESP", state and "Enabled" or "Disabled", "solar:user-speak-bold")
        end,
    })

    Tab:Space()

    local PerfSection = Tab:Section({
        Title     = "Performance",
        Box       = true,
        BoxBorder = true,
        Opened    = true,
    })

    toggleObjs["FpsBooster"] = PerfSection:Toggle({
        Flag      = "FpsBooster",
        Title     = "FPS Booster",
        Desc      = "Removes textures and effects for better performance",
        Icon      = "solar:rocket-bold",
        IconColor = Green,
        Value     = State.FpsBooster,
        Callback  = function(state)
            if applyingState then return end
            State.FpsBooster = state
            setFpsBooster(state)
            notify("FPS Booster", state and "Enabled" or "Disabled", "solar:rocket-bold")
        end,
    })
end


local SettingsSection = Window:Section({ Title = "Settings" })


do
    local Tab = SettingsSection:Tab({
        Title     = "Timing",
        Desc      = "Fine-tune automation intervals",
        Icon      = "solar:clock-bold",
        IconColor = Yellow,
        IconShape = "Square",
        Border    = true,
    })

    Tab:Paragraph({
        Title     = "Timing Configuration",
        Desc      = "Adjust delays and intervals for all automation loops. Lower values are more aggressive; stay within safe ranges.",
        Image     = "solar:clock-bold",
        ImageSize = 36,
    })

    local ThrowTiming = Tab:Section({
        Title     = "Throw Timing",
        Box       = true,
        BoxBorder = true,
        Opened    = true,
    })

    ThrowTiming:Slider({
        Flag  = "TapDelay",
        Title = "Tap Delay (s)",
        Desc  = "Delay before tapping bonus (max 0.4)",
        Icons = { From = "sfsymbols:sunMinFill", To = "sfsymbols:sunMaxFill" },
        Step      = 0.01,
        IsTooltip = true,
        IsTextbox = true,
        Value = { Min = 0.05, Max = 0.4, Default = TAP_DELAY },
        Callback = function(value) TAP_DELAY = value end,
    })

    Tab:Space()

    ThrowTiming:Slider({
        Flag  = "ThrowAccuracy",
        Title = "Throw Accuracy",
        Desc  = "Bar position for throws (1 = highest, best reach)",
        Icons = { From = "sfsymbols:sunMinFill", To = "sfsymbols:sunMaxFill" },
        Step      = 1,
        IsTooltip = true,
        IsTextbox = true,
        Value = { Min = 1, Max = 10, Default = THROW_ACCURACY },
        Callback = function(value) THROW_ACCURACY = value end,
    })

    Tab:Space()

    ThrowTiming:Slider({
        Flag  = "ThrowExtra",
        Title = "Throw Extra Wait (s)",
        Desc  = "Extra delay after flight time before completing",
        Icons = { From = "sfsymbols:sunMinFill", To = "sfsymbols:sunMaxFill" },
        Step      = 0.05,
        IsTooltip = true,
        IsTextbox = true,
        Value = { Min = 0, Max = 2, Default = THROW_EXTRA },
        Callback = function(value) THROW_EXTRA = value end,
    })

    Tab:Space()

    local LoopTiming = Tab:Section({
        Title     = "Loop Intervals",
        Box       = true,
        BoxBorder = true,
        Opened    = true,
    })

    LoopTiming:Slider({
        Flag  = "EquipEvery",
        Title = "Equip Best Interval (s)",
        Icons = { From = "sfsymbols:sunMinFill", To = "sfsymbols:sunMaxFill" },
        Step      = 1,
        IsTooltip = true,
        IsTextbox = true,
        Value = { Min = 5, Max = 120, Default = EQUIP_EVERY },
        Callback = function(value) EQUIP_EVERY = value end,
    })

    Tab:Space()

    LoopTiming:Slider({
        Flag  = "SellEvery",
        Title = "Auto Sell Interval (s)",
        Icons = { From = "sfsymbols:sunMinFill", To = "sfsymbols:sunMaxFill" },
        Step      = 5,
        IsTooltip = true,
        IsTextbox = true,
        Value = { Min = 5, Max = 300, Default = SELL_EVERY },
        Callback = function(value) SELL_EVERY = value end,
    })

    Tab:Space()

    LoopTiming:Slider({
        Flag  = "UpgradeEvery",
        Title = "Upgrade Interval (s)",
        Icons = { From = "sfsymbols:sunMinFill", To = "sfsymbols:sunMaxFill" },
        Step      = 1,
        IsTooltip = true,
        IsTextbox = true,
        Value = { Min = 1, Max = 60, Default = UPGRADE_EVERY },
        Callback = function(value) UPGRADE_EVERY = value end,
    })

    Tab:Space()

    local TeleportSettings = Tab:Section({
        Title     = "Teleport Heights",
        Box       = true,
        BoxBorder = true,
        Opened    = true,
    })

    TeleportSettings:Slider({
        Flag  = "TpHeight",
        Title = "Training Spot TP Height",
        Icons = { From = "sfsymbols:sunMinFill", To = "sfsymbols:sunMaxFill" },
        Step      = 0.5,
        IsTooltip = true,
        IsTextbox = true,
        Value = { Min = 1, Max = 10, Default = TP_HEIGHT },
        Callback = function(value) TP_HEIGHT = value end,
    })

    Tab:Space()

    TeleportSettings:Slider({
        Flag  = "LineHeight",
        Title = "Throw Line TP Height",
        Icons = { From = "sfsymbols:sunMinFill", To = "sfsymbols:sunMaxFill" },
        Step      = 0.5,
        IsTooltip = true,
        IsTextbox = true,
        Value = { Min = 1, Max = 10, Default = LINE_HEIGHT },
        Callback = function(value) LINE_HEIGHT = value end,
    })
end


do
    local Tab = SettingsSection:Tab({
        Title     = "System",
        Desc      = "Session and connection options",
        Icon      = "solar:settings-bold",
        IconColor = Grey,
        IconShape = "Square",
        Border    = true,
    })

    Tab:Paragraph({
        Title     = "System Settings",
        Desc      = "Anti AFK, Auto Execute, Auto Reconnect, and UI keybind settings.",
        Image     = "solar:settings-bold",
        ImageSize = 36,
    })

    local SysSection = Tab:Section({
        Title     = "Session Controls",
        Box       = true,
        BoxBorder = true,
        Opened    = true,
    })

    toggleObjs["AntiAfk"] = SysSection:Toggle({
        Flag      = "AntiAfk",
        Title     = "Anti AFK",
        Desc      = "Prevents idle disconnect kicks",
        Icon      = "solar:shield-minimalistic-bold",
        IconColor = Green,
        Value     = State.AntiAfk,
        Callback  = function(state)
            if applyingState then return end
            State.AntiAfk = state
            setAntiAfk(state)
            notify("Anti AFK", state and "Enabled" or "Disabled", "solar:shield-minimalistic-bold")
        end,
    })

    Tab:Space()

    toggleObjs["AutoExec"] = SysSection:Toggle({
        Flag      = "AutoExec",
        Title     = "Auto Execute",
        Desc      = "Re-runs the script after a rejoin or server hop",
        Icon      = "solar:restart-bold",
        IconColor = Blue,
        Value     = State.AutoExec,
        Callback  = function(state)
            if applyingState then return end
            State.AutoExec = state
            setAutoExec(state)
            notify("Auto Execute", state and "Enabled" or "Disabled", "solar:restart-bold")
        end,
    })

    Tab:Space()

    toggleObjs["AutoReconnect"] = SysSection:Toggle({
        Flag      = "AutoReconnect",
        Title     = "Auto Reconnect",
        Desc      = "Rejoins the server if you get kicked or disconnected",
        Icon      = "solar:plug-circle-bold",
        IconColor = Orange,
        Value     = State.AutoReconnect,
        Callback  = function(state)
            if applyingState then return end
            State.AutoReconnect = state
            setAR(state)
            notify("Auto Reconnect", state and "Enabled" or "Disabled", "solar:plug-circle-bold")
        end,
    })

    Tab:Space()

    local KeySection = Tab:Section({
        Title     = "Keybind",
        Box       = true,
        BoxBorder = true,
        Opened    = true,
    })

    KeySection:Keybind({
        Flag     = "ToggleUIKey",
        Title    = "Toggle UI",
        Desc     = "Press to show or hide the hub window",
        Icon     = "solar:keyboard-bold",
        IconColor = Purple,
        Value    = Enum.KeyCode.RightShift,
        Callback = function(key)
            Window:SetToggleKey(key)
        end,
    })

    Tab:Space()

    local InfoSection = Tab:Section({
        Title     = "Script Info",
        Box       = true,
        BoxBorder = true,
        Opened    = true,
    })

    InfoSection:Button({
        Title    = "Copy Discord Link",
        Desc     = "Open or copy the script community Discord",
        Icon     = "solar:chat-square-bold",
        IconColor = Blue,
        Color    = Blue,
        Justify  = "Left",
        Callback = function()
            local link = "https://discord.gg/horizonhub"
            pcall(function()
                local cb = setclipboard or toclipboard or (syn and syn.write_clipboard)
                if cb then cb(link) end
                game:GetService("GuiService"):OpenBrowserWindow(link)
            end)
            notify("Discord", "Link copied and opened!", "solar:chat-square-bold")
        end,
    })

    Tab:Space()

    InfoSection:Button({
        Title    = "Show Stats",
        Desc     = "Display current throw and tap statistics",
        Icon     = "solar:graph-up-bold",
        IconColor = Green,
        Color    = Green,
        Justify  = "Left",
        Callback = function()
            notify(
                "Session Stats",
                ("Throws: %d | Taps: %d | Extra Reps: %d | Last ID: %d"):format(throws, taps, extra, lastId),
                "solar:graph-up-bold",
                5
            )
        end,
    })
end


do
    local Tab = SettingsSection:Tab({
        Title     = "Webhook",
        Desc      = "Discord animal notifications",
        Icon      = "solar:bell-bold",
        IconColor = Red,
        IconShape = "Square",
        Border    = true,
    })

    Tab:Paragraph({
        Title     = "Discord Webhook",
        Desc      = "Sends a notification to your Discord server when you catch animals at or above your minimum value threshold.",
        Image     = "solar:bell-bold",
        ImageSize = 36,
    })

    local cfg     = getgenv().__TFAWebhookCfg
    local simpan  = getgenv().__TFAWebhookSave
    local urlValid= getgenv().__TFAUrlValid
    local parseNilai = getgenv().__TFAParseNilai
    local setMinNilai = getgenv().__TFAMinNilai

    local WHSection = Tab:Section({
        Title     = "Webhook Settings",
        Box       = true,
        BoxBorder = true,
        Opened    = true,
    })

    local urlInput = WHSection:Input({
        Flag     = "WebhookURL",
        Title    = "Webhook URL",
        Desc     = "Paste your Discord webhook URL here",
        Icon     = "solar:link-bold",
        IconColor = Blue,
        Placeholder = "https://discord.com/api/webhooks/...",
        Value    = cfg and cfg.url or "",
        Callback = function(value)
            if not cfg then return end
            local u = value:gsub("%s","")
            if u ~= "" and not urlValid(u) then
                notify("Webhook", "Invalid webhook URL — check the format", "solar:bell-bold")
                return
            end
            cfg.url = u
            if u == "" and State.Webhook then
                State.Webhook = false
                cfg.on = false
                applyingState = true
                if toggleObjs["Webhook"] then toggleObjs["Webhook"]:Set(false) end
                applyingState = false
            end
            simpan()
        end,
    })

    Tab:Space()

    WHSection:Input({
        Flag     = "WebhookMin",
        Title    = "Minimum Value",
        Desc     = "Only notify for animals at or above this value (e.g. 500K, 1.5M)",
        Icon     = "solar:filter-bold",
        IconColor = Yellow,
        Placeholder = "500K, 1.5M, 2B",
        Value    = cfg and cfg.min or "",
        Callback = function(value)
            if not cfg then return end
            local t = value:gsub("%s","")
            if t == "" then
                cfg.min = ""; setMinNilai(0); simpan(); return
            end
            local n = parseNilai(t)
            if not n then
                notify("Webhook", "Invalid value — example: 500K or 1.5M", "solar:filter-bold")
                return
            end
            cfg.min = t; setMinNilai(n); simpan()
        end,
    })

    Tab:Space()

    toggleObjs["Webhook"] = WHSection:Toggle({
        Flag      = "Webhook",
        Title     = "Enable Webhook",
        Desc      = "Send animal catches to Discord",
        Icon      = "solar:bell-bold",
        IconColor = Red,
        Value     = State.Webhook,
        Callback  = function(state)
            if applyingState then return end
            if state and cfg and not urlValid(cfg.url) then
                State.Webhook = false
                applyingState = true
                if toggleObjs["Webhook"] then toggleObjs["Webhook"]:Set(false) end
                applyingState = false
                notify("Webhook", "Set a valid webhook URL first", "solar:bell-bold")
                return
            end
            State.Webhook = state
            if cfg then cfg.on = state; simpan() end
            notify("Webhook", state and "Enabled — watching for animals" or "Disabled", "solar:bell-bold")
        end,
    })
end


local InterfaceSection = Window:Section({ Title = "Interface" })

do
    local Tab = InterfaceSection:Tab({
        Title     = "Config",
        Desc      = "Save and load toggle presets",
        Icon      = "solar:folder-with-files-bold",
        IconColor = Purple,
        IconShape = "Square",
        Border    = true,
    })

    Tab:Paragraph({
        Title     = "Config Manager",
        Desc      = "Save your current toggle states as a named config, load them anytime, or delete old ones. Auto Load applies a config automatically on startup.",
        Image     = "solar:folder-with-files-bold",
        ImageSize = 36,
    })

    local ConfigManager = Window.ConfigManager
    local ConfigName = "default"

    local ConfigNameInput = Tab:Input({
        Flag     = "ConfigName",
        Title    = "Config Name",
        Desc     = "Enter a name for the config to save or load",
        Icon     = "solar:file-text-bold",
        IconColor = Blue,
        Placeholder = "my_config",
        Callback = function(value)
            ConfigName = value
        end,
    })

    Tab:Space()

    local AllConfigs = ConfigManager:AllConfigs()
    local DefaultValue = table.find(AllConfigs, ConfigName) and ConfigName or nil

    local AllConfigsDropdown = Tab:Dropdown({
        Flag     = "AllConfigs",
        Title    = "Saved Configs",
        Desc     = "Select an existing config to load or delete",
        Icon     = "solar:list-bold",
        IconColor = Purple,
        Values   = AllConfigs,
        Value    = DefaultValue,
        Callback = function(value)
            ConfigName = value
            ConfigNameInput:Set(value)
        end,
    })

    Tab:Space()

    local BtnGroup = Tab:Group({})

    BtnGroup:Button({
        Title    = "Save",
        Icon     = "solar:diskette-bold",
        IconColor = Green,
        Color    = Color3.fromHex("#10C550"),
        Justify  = "Center",
        Callback = function()
            Window.CurrentConfig = ConfigManager:Config(ConfigName)
            if Window.CurrentConfig:Save() then
                notify("Config Saved", "'" .. ConfigName .. "' saved successfully", "solar:diskette-bold")
            end
            AllConfigsDropdown:Refresh(ConfigManager:AllConfigs())
        end,
    })

    BtnGroup:Space()

    BtnGroup:Button({
        Title    = "Load",
        Icon     = "solar:download-minimalistic-bold",
        IconColor = Blue,
        Color    = Color3.fromHex("#257AF7"),
        Justify  = "Center",
        Callback = function()
            Window.CurrentConfig = ConfigManager:CreateConfig(ConfigName)
            if Window.CurrentConfig:Load() then
                notify("Config Loaded", "'" .. ConfigName .. "' loaded", "solar:download-minimalistic-bold")
            end
        end,
    })

    BtnGroup:Space()

    BtnGroup:Button({
        Title    = "Delete",
        Icon     = "solar:trash-bin-trash-bold",
        IconColor = Red,
        Color    = Color3.fromHex("#EF4F1D"),
        Justify  = "Center",
        Callback = function()
            local all = ConfigManager:AllConfigs()
            local found = table.find(all, ConfigName)
            if found then
                ConfigManager:DeleteConfig(ConfigName)
                notify("Config Deleted", "'" .. ConfigName .. "' deleted", "solar:trash-bin-trash-bold")
                AllConfigsDropdown:Refresh(ConfigManager:AllConfigs())
            else
                notify("Config", "Config not found — save it first", "solar:trash-bin-trash-bold")
            end
        end,
    })

    Tab:Space()

    Tab:Button({
        Title    = "Reset All to Default",
        Icon     = "solar:refresh-bold",
        IconColor = Orange,
        Color    = Color3.fromHex("#F97316"),
        Justify  = "Center",
        Callback = function()
            for _, k in ipairs(CONFIG_KEYS) do
                applyState(k, false)
            end
            applyState("AntiAfk", true)
            applyState("FpsBooster", true)
            notify("Reset", "All toggles reset to defaults", "solar:refresh-bold")
        end,
    })
end


setAntiAfk(State.AntiAfk)
if State.FpsBooster then setFpsBooster(true) end
setAutoExec(State.AutoExec, true)


notify("TFA V2 • WindUI", "Script loaded — have a good session!", "solar:shield-check-bold", 4)


local fromTeleport = getgenv().ThrowAutoStart
getgenv().ThrowAutoStart = nil

if fromTeleport then
    task.spawn(function()
        local t0 = os.clock()
        repeat task.wait(0.5) until (lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")) or os.clock() - t0 > 30
        task.wait(2)
        if isfile and readfile and isfile(LASTSTATE_FILE) then
            local okR, data = pcall(function()
                return HttpService:JSONDecode(readfile(LASTSTATE_FILE))
            end)
            if okR and typeof(data) == "table" then
                for _, k in ipairs(CONFIG_KEYS) do
                    if data[k] == true then applyState(k, true) end
                end
                notify("TFA V2", "Last session state restored", "solar:restart-bold")
            end
        end
    end)
end
