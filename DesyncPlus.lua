-- Desync Plus 
-- Made by stacky

local CURRENTVERSION = "0.0"
local LATESTVERSION = http.Get("https://raw.githubusercontent.com/stqcky/DesyncPlus/master/version.txt")

local function Update() 
    if CURRENTVERSION ~= LATESTVERSION then
        currentScript = file.Open(GetScriptName(), "w")
        currentScript:Write(http.Get("https://raw.githubusercontent.com/stqcky/DesyncPlus/master/DesyncPlus.lua"))
        currentScript:Close()
        LoadScript(GetScriptName())
    end
end

local DESYNCPLUS_WINDOW = gui.Window("desyncplus", "Desync Plus", 100, 100, 790, 590)
local DESYNCPLUS_TAB = gui.Tab(gui.Reference("Settings"), "desyncplus.updater", "Desync Plus Updater")

local DESYNCPLUS_UPDATER_GBOX = gui.Groupbox(DESYNCPLUS_TAB, "Updater", 10, 10, 250, 0)
local DESYNCPLUS_UPDATER_CURRENTVERSION = gui.Text(DESYNCPLUS_UPDATER_GBOX, "Current version: v" .. CURRENTVERSION)
local DESYNCPLUS_UPDATER_LATESTVERSION = gui.Text(DESYNCPLUS_UPDATER_GBOX, "Latest version: v" .. LATESTVERSION)
local DESYNCPLUS_UPDATER_UPDATE = gui.Button(DESYNCPLUS_UPDATER_GBOX, "Update", Update)

local DESYNCPLUS_UPDATER_CHANGELOG_GBOX = gui.Groupbox(DESYNCPLUS_TAB, "Changelog", 270, 10, 360, 0)
local DESYNCPLUS_UPDATER_CHANGELOG_TEXT = gui.Text(DESYNCPLUS_UPDATER_CHANGELOG_GBOX, http.Get("https://raw.githubusercontent.com/stqcky/DesyncPlus/master/changelog.txt"))

local DESYNCPLUS_BASEDIRECTION_GBOX = gui.Groupbox(DESYNCPLUS_WINDOW, "Base Direction", 10, 10, 250, 0)
local DESYNCPLUS_BASEDIRECTION_BASEVALUE = gui.Slider(DESYNCPLUS_BASEDIRECTION_GBOX,"basedirection.basevalue", "Base Value", 0, -180, 180)
local DESYNCPLUS_BASEDIRECTION_MINSLIDER = gui.Slider(DESYNCPLUS_BASEDIRECTION_GBOX,"basedirection.minslider", "Minimal Value", 0, -180, 180)
local DESYNCPLUS_BASEDIRECTION_MAXSLIDER = gui.Slider(DESYNCPLUS_BASEDIRECTION_GBOX,"basedirection.maxslider", "Maximal Value", 0, -180, 180)
local DESYNCPLUS_BASEDIRECTION_TYPE = gui.Combobox(DESYNCPLUS_BASEDIRECTION_GBOX, "basedirection.type", "Type", "Off", "Jitter", "Switch", "Static")
local DESYNCPLUS_BASEDIRECTION_MANUALLEFT = gui.Keybox(DESYNCPLUS_BASEDIRECTION_GBOX, "basedirection.manualleft", "Manual AA Left", 0)
local DESYNCPLUS_BASEDIRECTION_MANUALRIGHT = gui.Keybox(DESYNCPLUS_BASEDIRECTION_GBOX, "basedirection.manualright", "Manual AA Right", 0)
local DESYNCPLUS_BASEDIRECTION_MANUALBACK = gui.Keybox(DESYNCPLUS_BASEDIRECTION_GBOX, "basedirection.manualback", "Manual AA Back", 0)

local DESYNCPLUS_ROTATION_GBOX = gui.Groupbox(DESYNCPLUS_WINDOW, "Rotation", 270, 10, 250, 0)
local DESYNCPLUS_ROTATION_MINSLIDER = gui.Slider(DESYNCPLUS_ROTATION_GBOX,"rotation.minslider", "Minimal Value", 0, -58, 58)
local DESYNCPLUS_ROTATION_MAXSLIDER = gui.Slider(DESYNCPLUS_ROTATION_GBOX,"rotation.maxslider", "Maximal Value", 0, -58, 58)
local DESYNCPLUS_ROTATION_SPEED = gui.Slider(DESYNCPLUS_ROTATION_GBOX,"rotation.speed", "Sway Speed", 1, 1, 30)
local DESYNCPLUS_ROTATION_TYPE = gui.Combobox(DESYNCPLUS_ROTATION_GBOX, "rotation.type", "Type", "Off", "Jitter", "Sway", "Switch", "Static")

local DESYNCPLUS_LBY_GBOX = gui.Groupbox(DESYNCPLUS_WINDOW, "LBY", 530, 10, 250, 0)
local DESYNCPLUS_LBY_MINSLIDER = gui.Slider(DESYNCPLUS_LBY_GBOX,"lby.minslider", "Minimal Value", 0, -180, 180)
local DESYNCPLUS_LBY_MAXSLIDER = gui.Slider(DESYNCPLUS_LBY_GBOX,"lby.maxslider", "Maximal Value", 0, -180, 180)
local DESYNCPLUS_LBY_SPEED = gui.Slider(DESYNCPLUS_LBY_GBOX,"lby.speed", "Sway Speed", 1, 1, 30)
local DESYNCPLUS_LBY_TYPE = gui.Combobox(DESYNCPLUS_LBY_GBOX, "lby.type", "Type", "Off", "Jitter", "Sway", "Switch", "Match", "Opposite", "Static")
local DESYNCPLUS_LBY_VALUE = gui.Slider(DESYNCPLUS_LBY_GBOX,"lby.value", "LBY Offset value for Opposite/Match", 0, 0, 180)

local DESYNCPLUS_MISC_GBOX = gui.Groupbox(DESYNCPLUS_WINDOW, "Misc", 10, 440, 250, 0)
local DESYNCPLUS_MISC_MASTERSWITCH = gui.Checkbox(DESYNCPLUS_MISC_GBOX, "misc.masterswitch", "Master Switch", false)

local DESYNCPLUS_FAKELAG_GBOX = gui.Groupbox(DESYNCPLUS_WINDOW, "Fakelag", 270, 270, 250, 0)
local DESYNCPLUS_FAKELAG_MINSLIDER = gui.Slider(DESYNCPLUS_FAKELAG_GBOX,"fakelag.minslider", "Minimal Value", 0, 2, 17)
local DESYNCPLUS_FAKELAG_MAXSLIDER = gui.Slider(DESYNCPLUS_FAKELAG_GBOX,"fakelag.maxslider", "Maximal Value", 0, 2, 17)
local DESYNCPLUS_FAKELAG_SPEED = gui.Slider(DESYNCPLUS_FAKELAG_GBOX,"fakelag.speed", "Sway Speed", 0, 1, 20)
local DESYNCPLUS_FAKELAG_TYPE = gui.Combobox(DESYNCPLUS_FAKELAG_GBOX, "fakelag.type", "Type", "Off", "Jitter", "Sway", "Switch", "Static")
local DESYNCPLUS_FAKELAG_STAND = gui.Checkbox(DESYNCPLUS_FAKELAG_GBOX, "fakelag.stand", "Fakelag while standing still", false)

local angle, direction = 0, 0
local angle2, direction2 = 0, 0
local angle3, direction3 = 0, 0
local windowOpened = true
local lastTick = 0
local switchMove = true

local function SetLBY()
    lbyType = DESYNCPLUS_LBY_TYPE:GetValue()
    if lbyType ~= 0 then
        if lbyType == 1 then
            RandomValue = math.random(DESYNCPLUS_LBY_MINSLIDER:GetValue(), DESYNCPLUS_LBY_MAXSLIDER:GetValue())
            gui.SetValue("rbot.antiaim.base.lby", RandomValue)
        elseif lbyType == 2 then
            maxValue = DESYNCPLUS_LBY_MAXSLIDER:GetValue()
            minValue = DESYNCPLUS_LBY_MINSLIDER:GetValue()
            speed = DESYNCPLUS_LBY_SPEED:GetValue()

            if angle2 >= maxValue then direction2 = 1 elseif angle2 <= minValue + speed then direction2 = 0 end       
            if direction2 == 0 then angle2 = angle2 + speed elseif direction2 == 1 then angle2 = angle2 - speed end            
            gui.SetValue("rbot.antiaim.base.lby", angle2)   
        elseif lbyType == 3 then
            maxValue = DESYNCPLUS_LBY_MAXSLIDER:GetValue()
            minValue = DESYNCPLUS_LBY_MINSLIDER:GetValue()
            curValue = gui.GetValue("rbot.antiaim.base.lby")
            if curValue == maxValue then gui.SetValue("rbot.antiaim.base.lby", minValue)
            elseif curValue == minValue then gui.SetValue("rbot.antiaim.base.lby", maxValue)
            else gui.SetValue("rbot.antiaim.base.lby", minValue) end      
        elseif lbyType == 4 then
            if gui.GetValue("rbot.antiaim.base.rotation") >= 0 then
                    gui.SetValue("rbot.antiaim.base.lby", DESYNCPLUS_LBY_VALUE:GetValue())
            else
                    gui.SetValue("rbot.antiaim.base.lby", DESYNCPLUS_LBY_VALUE:GetValue() * -1)
            end
        elseif lbyType == 5 then
            if gui.GetValue("rbot.antiaim.base.rotation") >= 0 then
                gui.SetValue("rbot.antiaim.base.lby", DESYNCPLUS_LBY_VALUE:GetValue() * -1)
            else
                gui.SetValue("rbot.antiaim.base.lby", DESYNCPLUS_LBY_VALUE:GetValue())
            end
        elseif lbyType == 6 then
            gui.SetValue("rbot.antiaim.base.lby", DESYNCPLUS_LBY_MINSLIDER:GetValue())
        end
    end

end

local function SetRotation()
    rotationType = DESYNCPLUS_ROTATION_TYPE:GetValue()
    if rotationType ~= 0 then  
        if rotationType == 1 then
            gui.SetValue("rbot.antiaim.base.rotation", math.random(DESYNCPLUS_ROTATION_MINSLIDER:GetValue(), DESYNCPLUS_ROTATION_MAXSLIDER:GetValue()))    
        elseif rotationType == 2 then
            maxValue = DESYNCPLUS_ROTATION_MAXSLIDER:GetValue()
            minValue = DESYNCPLUS_ROTATION_MINSLIDER:GetValue()
            speed = DESYNCPLUS_ROTATION_SPEED:GetValue() / 3

            if angle >= maxValue then direction = 1 elseif angle <= minValue + speed then direction = 0 end       
            if direction == 0 then angle = angle + speed elseif direction == 1 then angle = angle - speed end      
            gui.SetValue("rbot.antiaim.base.rotation", angle)   
        elseif rotationType == 3 then 
            maxValue = DESYNCPLUS_ROTATION_MAXSLIDER:GetValue()
            minValue = DESYNCPLUS_ROTATION_MINSLIDER:GetValue()
            currentValue = gui.GetValue("rbot.antiaim.base.rotation")

            if currentValue == minValue then 
                gui.SetValue("rbot.antiaim.base.rotation", maxValue)
            elseif currentValue == maxValue then 
                gui.SetValue("rbot.antiaim.base.rotation", minValue)
            else 
                gui.SetValue("rbot.antiaim.base.rotation", maxValue) 
            end          
        elseif rotationType == 4 then
            gui.SetValue("rbot.antiaim.base.rotation", DESYNCPLUS_ROTATION_MINSLIDER:GetValue())   
        end              
    end
end

local function SetBaseDirection()
    BaseDirectionType = DESYNCPLUS_BASEDIRECTION_TYPE:GetValue()
    if BaseDirectionType ~= 0 then          
        if BaseDirectionType == 1 then
            BaseDirection = DESYNCPLUS_BASEDIRECTION_BASEVALUE:GetValue()
            RandomRange = math.random(DESYNCPLUS_BASEDIRECTION_MINSLIDER:GetValue(), DESYNCPLUS_BASEDIRECTION_MAXSLIDER:GetValue())       
            if BaseDirection + RandomRange > 180 or BaseDirection + RandomRange < -180 then BaseDirection = BaseDirection * -1 end
            gui.SetValue("rbot.antiaim.base", BaseDirection + RandomRange)

        elseif BaseDirectionType == 2 then
            maxValue = DESYNCPLUS_BASEDIRECTION_MAXSLIDER:GetValue() 
            minValue = DESYNCPLUS_BASEDIRECTION_MINSLIDER:GetValue()          
            angle = 0
            for w in gui.GetValue("rbot.antiaim.base"):gmatch("%S+") do angle = tonumber(w); break end

            if angle == maxValue then gui.SetValue("rbot.antiaim.base", minValue)
            elseif angle == minValue then gui.SetValue("rbot.antiaim.base", maxValue)
            else gui.SetValue("rbot.antiaim.base", minValue) end 

        elseif BaseDirectionType == 3 then
            gui.SetValue("rbot.antiaim.base", DESYNCPLUS_BASEDIRECTION_BASEVALUE:GetValue())
        end
    end
end

local function SetFakelag()
    fakelagType = DESYNCPLUS_FAKELAG_TYPE:GetValue()
    if fakelagType ~= 0 then
        if fakelagType == 1 then
            gui.SetValue("misc.fakelag.factor", math.random(DESYNCPLUS_FAKELAG_MINSLIDER:GetValue(), DESYNCPLUS_FAKELAG_MAXSLIDER:GetValue()))
        elseif fakelagType == 2 then
            maxValue = DESYNCPLUS_FAKELAG_MAXSLIDER:GetValue()
            minValue = DESYNCPLUS_FAKELAG_MINSLIDER:GetValue()
            speed = DESYNCPLUS_FAKELAG_SPEED:GetValue() / 9

            if angle3 >= maxValue then direction3 = 1 elseif angle3 <= minValue + speed then direction3 = 0 end       
            if direction3 == 0 then angle3 = angle3 + speed elseif direction3 == 1 then angle3 = angle3 - speed end     
            gui.SetValue("misc.fakelag.factor", angle3)   
        elseif fakelagType == 3 then
            curFactor = gui.GetValue("misc.fakelag.factor")
            minSlider = DESYNCPLUS_FAKELAG_MINSLIDER:GetValue()
            maxSlider = DESYNCPLUS_FAKELAG_MAXSLIDER:GetValue()
            if curFactor == maxSlider then gui.SetValue("misc.fakelag.factor", minSlider)
            elseif curFactor == minSlider then gui.SetValue("misc.fakelag.factor", maxSlider)
            else gui.SetValue("misc.fakelag.factor", minSlider) end
        elseif fakelagType == 4 then
            gui.SetValue("misc.fakelag.factor", DESYNCPLUS_FAKELAG_MINSLIDER:GetValue())
        end
    end
end

local function ManualAA()
    if DESYNCPLUS_BASEDIRECTION_MANUALLEFT:GetValue() ~= 0 then
        if input.IsButtonPressed(DESYNCPLUS_BASEDIRECTION_MANUALLEFT:GetValue()) then 
            DESYNCPLUS_BASEDIRECTION_BASEVALUE:SetValue(90)
        end
    end

    if DESYNCPLUS_BASEDIRECTION_MANUALRIGHT:GetValue() ~= 0 then
        if input.IsButtonPressed(DESYNCPLUS_BASEDIRECTION_MANUALRIGHT:GetValue()) then 
            DESYNCPLUS_BASEDIRECTION_BASEVALUE:SetValue(-90)
        end
    end
    if DESYNCPLUS_BASEDIRECTION_MANUALBACK:GetValue() ~= 0 then
        if input.IsButtonPressed(DESYNCPLUS_BASEDIRECTION_MANUALBACK:GetValue()) then 
            DESYNCPLUS_BASEDIRECTION_BASEVALUE:SetValue(180)
        end
    end
end

local function CreateMoveHook(pCmd) 
    if DESYNCPLUS_FAKELAG_STAND:GetValue() then
        player = entities.GetLocalPlayer()
        if not player then return end
        local vel = math.sqrt(player:GetPropFloat( "localdata", "m_vecVelocity[0]" )^2 + player:GetPropFloat( "localdata", "m_vecVelocity[1]" )^2)
        if vel > 3 then return end

        if switchMove then pCmd.sidemove = 3
        else pCmd.sidemove = -3 end
        
        switchMove = not switchMove
    end
end
callbacks.Register("CreateMove", CreateMoveHook)

local function main()
    if DESYNCPLUS_MISC_MASTERSWITCH:GetValue() then
        ManualAA()
        if globals.TickCount() > lastTick then 
            SetRotation()
            SetLBY()
            SetBaseDirection()
            SetFakelag()         
        end
        if input.IsButtonPressed(45) then 
            if windowOpened then DESYNCPLUS_WINDOW:SetActive(0) else DESYNCPLUS_WINDOW:SetActive(1) end 
            windowOpened = not windowOpened
        end
    end
    lastTick = globals.TickCount()
end

callbacks.Register("Draw", main)