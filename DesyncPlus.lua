-- Desync Plus 
-- Made by stacky

local CURRENTVERSION = "2.0"
local LATESTVERSION = http.Get("https://raw.githubusercontent.com/stqcky/DesyncPlus/master/version.txt")

local function Update() 
    if CURRENTVERSION ~= LATESTVERSION then
        currentScript = file.Open(GetScriptName(), "w")
        currentScript:Write(http.Get("https://raw.githubusercontent.com/stqcky/DesyncPlus/master/DesyncPlus.lua"))
        currentScript:Close()
        LoadScript(GetScriptName())
    end
end

local DESYNCPLUS_WINDOW = gui.Window("desyncplus", "Desync Plus", 100, 100, 790, 610)
local DESYNCPLUS_TAB = gui.Tab(gui.Reference("Settings"), "desyncplus.updater", "Desync Plus Updater")

local test = gui.Tab(DESYNCPLUS_WINDOW, "test", "test")

local DESYNCPLUS_UPDATER_GBOX = gui.Groupbox(DESYNCPLUS_TAB, "Updater", 10, 10, 250, 0)
local DESYNCPLUS_UPDATER_CURRENTVERSION = gui.Text(DESYNCPLUS_UPDATER_GBOX, "Current version: v" .. CURRENTVERSION)
local DESYNCPLUS_UPDATER_LATESTVERSION = gui.Text(DESYNCPLUS_UPDATER_GBOX, "Latest version: v" .. LATESTVERSION)
local DESYNCPLUS_UPDATER_UPDATE = gui.Button(DESYNCPLUS_UPDATER_GBOX, "Update", Update)

local DESYNCPLUS_UPDATER_CHANGELOG_GBOX = gui.Groupbox(DESYNCPLUS_TAB, "Changelog", 270, 10, 360, 0)
local DESYNCPLUS_UPDATER_CHANGELOG_TEXT = gui.Text(DESYNCPLUS_UPDATER_CHANGELOG_GBOX, http.Get("https://raw.githubusercontent.com/stqcky/DesyncPlus/master/changelog.txt"))

local DESYNCPLUS_BASEDIRECTION_GBOX = gui.Groupbox(DESYNCPLUS_WINDOW, "Base Direction", 10, 10, 250, 0)
local DESYNCPLUS_BASEDIRECTION_STATE = gui.Combobox(DESYNCPLUS_BASEDIRECTION_GBOX, "basedirection.state", "State", "Standing", "Moving")
local DESYNCPLUS_BASEDIRECTION_BASEVALUE = gui.Slider(DESYNCPLUS_BASEDIRECTION_GBOX,"basedirection.basevalue", "Base Value", 0, -180, 180)
local DESYNCPLUS_BASEDIRECTION_MINSLIDER = gui.Slider(DESYNCPLUS_BASEDIRECTION_GBOX,"basedirection.minslider", "Minimal Value", 0, -180, 180)
local DESYNCPLUS_BASEDIRECTION_MAXSLIDER = gui.Slider(DESYNCPLUS_BASEDIRECTION_GBOX,"basedirection.maxslider", "Maximal Value", 0, -180, 180)
local DESYNCPLUS_BASEDIRECTION_TYPE = gui.Combobox(DESYNCPLUS_BASEDIRECTION_GBOX, "basedirection.type", "Type", "Off", "Jitter", "Switch", "Static")

local DESYNCPLUS_MANUAL_GBOX = gui.Groupbox(DESYNCPLUS_WINDOW, "Manual AA", 10, 320, 250, 0)
local DESYNCPLUS_MANUAL_LEFT = gui.Keybox(DESYNCPLUS_MANUAL_GBOX, "manual.left", "Left Button", 0)
local DESYNCPLUS_MANUAL_RIGHT = gui.Keybox(DESYNCPLUS_MANUAL_GBOX, "manual.right", "Right Button", 0)
local DESYNCPLUS_MANUAL_BACK = gui.Keybox(DESYNCPLUS_MANUAL_GBOX, "manual.back", "Back Button", 0)

local DESYNCPLUS_ROTATION_GBOX = gui.Groupbox(DESYNCPLUS_WINDOW, "Rotation", 270, 10, 250, 0)
local DESYNCPLUS_ROTATION_STATE = gui.Combobox(DESYNCPLUS_ROTATION_GBOX, "rotation.state", "State", "Standing", "Moving")
local DESYNCPLUS_ROTATION_MINSLIDER = gui.Slider(DESYNCPLUS_ROTATION_GBOX,"rotation.minslider", "Minimal Value", 0, -58, 58)
local DESYNCPLUS_ROTATION_MAXSLIDER = gui.Slider(DESYNCPLUS_ROTATION_GBOX,"rotation.maxslider", "Maximal Value", 0, -58, 58)
local DESYNCPLUS_ROTATION_SPEED = gui.Slider(DESYNCPLUS_ROTATION_GBOX,"rotation.speed", "Cycle Speed", 1, 1, 30)
local DESYNCPLUS_ROTATION_TYPE = gui.Combobox(DESYNCPLUS_ROTATION_GBOX, "rotation.type", "Type", "Off", "Jitter", "Cycle", "Switch", "Static")

local DESYNCPLUS_LBY_GBOX = gui.Groupbox(DESYNCPLUS_WINDOW, "LBY", 530, 10, 250, 0)
local DESYNCPLUS_LBY_STATE = gui.Combobox(DESYNCPLUS_LBY_GBOX, "lby.state", "State", "Standing", "Moving")
local DESYNCPLUS_LBY_MINSLIDER = gui.Slider(DESYNCPLUS_LBY_GBOX,"lby.minslider", "Minimal Value", 0, -180, 180)
local DESYNCPLUS_LBY_MAXSLIDER = gui.Slider(DESYNCPLUS_LBY_GBOX,"lby.maxslider", "Maximal Value", 0, -180, 180)
local DESYNCPLUS_LBY_SPEED = gui.Slider(DESYNCPLUS_LBY_GBOX,"lby.speed", "Cycle Speed", 1, 1, 30)
local DESYNCPLUS_LBY_TYPE = gui.Combobox(DESYNCPLUS_LBY_GBOX, "lby.type", "Type", "Off", "Jitter", "Cycle", "Switch", "Match", "Opposite", "Static")
local DESYNCPLUS_LBY_VALUE = gui.Slider(DESYNCPLUS_LBY_GBOX,"lby.value", "LBY Value", 0, 0, 180)

local DESYNCPLUS_MISC_GBOX = gui.Groupbox(DESYNCPLUS_WINDOW, "Misc", 530, 370, 250, 0)
local DESYNCPLUS_MISC_MASTERSWITCH = gui.Checkbox(DESYNCPLUS_MISC_GBOX, "misc.masterswitch", "Master Switch", false)
local DESYNCPLUS_MISC_FAKELAGSTAND = gui.Checkbox(DESYNCPLUS_MISC_GBOX, "misc.fakelagstand", "Fakelag while standing still", false)

local DESYNCPLUS_FAKELAG_GBOX = gui.Groupbox(DESYNCPLUS_WINDOW, "Fakelag", 270, 320, 250, 0)
local DESYNCPLUS_FAKELAG_MINSLIDER = gui.Slider(DESYNCPLUS_FAKELAG_GBOX,"fakelag.minslider", "Minimal Value", 0, 2, 17)
local DESYNCPLUS_FAKELAG_MAXSLIDER = gui.Slider(DESYNCPLUS_FAKELAG_GBOX,"fakelag.maxslider", "Maximal Value", 0, 2, 17)
local DESYNCPLUS_FAKELAG_SPEED = gui.Slider(DESYNCPLUS_FAKELAG_GBOX,"fakelag.speed", "Cycle Speed", 0, 1, 20)
local DESYNCPLUS_FAKELAG_TYPE = gui.Combobox(DESYNCPLUS_FAKELAG_GBOX, "fakelag.type", "Type", "Off", "Jitter", "Cycle", "Switch", "Static")

local STAND_BASEDIRECTION_BASEVALUE, STAND_BASEDIRECTION_MINVALUE, STAND_BASEDIRECTION_MAXVALUE, STAND_BASEDIRECTION_TYPE = 0
local STAND_ROTATION_MINVALUE, STAND_ROTATION_MAXVALUE, STAND_ROTATION_TYPE = 0
local STAND_ROTATION_CYCLESPEED = 1
local STAND_LBY_MINVALUE, STAND_LBY_MAXVALUE, STAND_LBY_TYPE, STAND_LBY_VALUE = 0
local STAND_LBY_CYCLESPEED = 1

local MOVE_BASEDIRECTION_BASEVALUE, MOVE_BASEDIRECTION_MINVALUE, MOVE_BASEDIRECTION_MAXVALUE, MOVE_BASEDIRECTION_TYPE = 0
local MOVE_ROTATION_MINVALUE, MOVE_ROTATION_MAXVALUE, MOVE_ROTATION_TYPE = 0
local MOVE_ROTATION_CYCLESPEED = 1
local MOVE_LBY_MINVALUE, MOVE_LBY_MAXVALUE, MOVE_LBY_TYPE, MOVE_LBY_VALUE = 0
local MOVE_LBY_CYCLESPEED = 1

local BASEDIRECTION_STATE = 0
local ROTATION_STATE = 0
local LBY_STATE = 0

local angle, direction = 0, 0
local angle2, direction2 = 0, 0
local angle3, direction3 = 0, 0
local windowOpened = true
local lastTick = 0
local flMove = 3

local function SetLBY(isMoving)
    if isMoving then lbyType = MOVE_LBY_TYPE else lbyType = STAND_LBY_TYPE end
    if lbyType ~= 0 then
        if isMoving then
            minValue = MOVE_LBY_MINVALUE
            maxValue = MOVE_LBY_MAXVALUE
            speed = MOVE_LBY_CYCLESPEED
            value = MOVE_LBY_VALUE
        else
            minValue = STAND_LBY_MINVALUE
            maxValue = STAND_LBY_MAXVALUE
            speed = STAND_LBY_CYCLESPEED
            value = STAND_LBY_VALUE
        end

        if lbyType == 1 then
            RandomValue = math.random(minValue, maxValue)
            gui.SetValue("rbot.antiaim.base.lby", RandomValue)
        elseif lbyType == 2 then
            if angle2 >= maxValue then direction2 = 1 elseif angle2 <= minValue + speed then direction2 = 0 end       
            if direction2 == 0 then angle2 = angle2 + speed elseif direction2 == 1 then angle2 = angle2 - speed end            
            gui.SetValue("rbot.antiaim.base.lby", angle2)   
        elseif lbyType == 3 then
            curValue = gui.GetValue("rbot.antiaim.base.lby")
            if curValue == maxValue then gui.SetValue("rbot.antiaim.base.lby", minValue)
            elseif curValue == minValue then gui.SetValue("rbot.antiaim.base.lby", maxValue)
            else gui.SetValue("rbot.antiaim.base.lby", minValue) end      
        elseif lbyType == 4 then
            if gui.GetValue("rbot.antiaim.base.rotation") >= 0 then
                    gui.SetValue("rbot.antiaim.base.lby", value)
            else
                    gui.SetValue("rbot.antiaim.base.lby", value * -1)
            end
        elseif lbyType == 5 then
            if gui.GetValue("rbot.antiaim.base.rotation") >= 0 then
                gui.SetValue("rbot.antiaim.base.lby", value * -1)
            else
                gui.SetValue("rbot.antiaim.base.lby", value)
            end
        elseif lbyType == 6 then
            gui.SetValue("rbot.antiaim.base.lby", minValue)
        end
    end

end

local function SetRotation(isMoving)
    if isMoving then rotationType = MOVE_ROTATION_TYPE else rotationType = STAND_ROTATION_TYPE end
    if rotationType ~= 0 then  
        if isMoving then
            minValue = MOVE_ROTATION_MINVALUE
            maxValue = MOVE_ROTATION_MAXVALUE
            speed = MOVE_ROTATION_CYCLESPEED / 3
        else
            minValue = STAND_ROTATION_MINVALUE
            maxValue = STAND_ROTATION_MAXVALUE
            speed = STAND_ROTATION_CYCLESPEED / 3
        end

        if rotationType == 1 then
            gui.SetValue("rbot.antiaim.base.rotation", math.random(minValue, maxValue))    
        elseif rotationType == 2 then
            if angle >= maxValue then direction = 1 elseif angle <= minValue + speed then direction = 0 end       
            if direction == 0 then angle = angle + speed elseif direction == 1 then angle = angle - speed end      
            gui.SetValue("rbot.antiaim.base.rotation", angle)   
        elseif rotationType == 3 then 
            currentValue = gui.GetValue("rbot.antiaim.base.rotation")
            if currentValue == minValue then gui.SetValue("rbot.antiaim.base.rotation", maxValue)
            elseif currentValue == maxValue then gui.SetValue("rbot.antiaim.base.rotation", minValue)
            else gui.SetValue("rbot.antiaim.base.rotation", maxValue) end          
        elseif rotationType == 4 then
            gui.SetValue("rbot.antiaim.base.rotation", minValue)   
        end              
    end
end

local function SetBaseDirection(isMoving)
    if isMoving then BaseDirectionType = MOVE_BASEDIRECTION_TYPE else BaseDirectionType = STAND_BASEDIRECTION_TYPE end
    if BaseDirectionType ~= 0 then          
        if isMoving then
            baseValue = MOVE_BASEDIRECTION_BASEVALUE
            minValue = MOVE_BASEDIRECTION_MINVALUE
            maxValue = MOVE_BASEDIRECTION_MAXVALUE
        else
            baseValue = STAND_BASEDIRECTION_BASEVALUE
            minValue = STAND_BASEDIRECTION_MINVALUE
            maxValue = STAND_BASEDIRECTION_MAXVALUE
        end

        if BaseDirectionType == 1 then
            RandomRange = math.random(minValue, maxValue)       
            if baseValue + RandomRange > 180 or baseValue + RandomRange < -180 then baseValue = baseValue * -1 end
            gui.SetValue("rbot.antiaim.base", baseValue + RandomRange)
        elseif BaseDirectionType == 2 then      
            angle = 0
            for w in gui.GetValue("rbot.antiaim.base"):gmatch("%S+") do angle = tonumber(w); break end
            if angle == maxValue then gui.SetValue("rbot.antiaim.base", minValue)
            elseif angle == minValue then gui.SetValue("rbot.antiaim.base", maxValue)
            else gui.SetValue("rbot.antiaim.base", minValue) end 

        elseif BaseDirectionType == 3 then
            gui.SetValue("rbot.antiaim.base", baseValue)
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
    if DESYNCPLUS_MANUAL_LEFT:GetValue() ~= 0 then
        if input.IsButtonPressed(DESYNCPLUS_MANUAL_LEFT:GetValue()) then 
            DESYNCPLUS_BASEDIRECTION_BASEVALUE:SetValue(90)
        end
    end

    if DESYNCPLUS_MANUAL_RIGHT:GetValue() ~= 0 then
        if input.IsButtonPressed(DESYNCPLUS_MANUAL_RIGHT:GetValue()) then 
            DESYNCPLUS_BASEDIRECTION_BASEVALUE:SetValue(-90)
        end
    end
    if DESYNCPLUS_MANUAL_BACK:GetValue() ~= 0 then
        if input.IsButtonPressed(DESYNCPLUS_MANUAL_BACK:GetValue()) then 
            DESYNCPLUS_BASEDIRECTION_BASEVALUE:SetValue(180)
        end
    end
end

local function MoveHandler(UserCmd) 
    if DESYNCPLUS_MISC_MASTERSWITCH then
        localPlayer = entities.GetLocalPlayer()
        if not localPlayer then return end 
        velocity = math.sqrt(localPlayer:GetPropFloat( "localdata", "m_vecVelocity[0]" )^2 + localPlayer:GetPropFloat( "localdata", "m_vecVelocity[1]" )^2)

        if DESYNCPLUS_MISC_FAKELAGSTAND:GetValue() and velocity < 5 then    
            UserCmd.sidemove = flMove
            flMove = flMove * -1
        end
    end
end
callbacks.Register("CreateMove", MoveHandler)

local function main()
    if DESYNCPLUS_BASEDIRECTION_STATE:GetValue() ~= BASEDIRECTION_STATE then
        BASEDIRECTION_STATE = DESYNCPLUS_BASEDIRECTION_STATE:GetValue()
        if BASEDIRECTION_STATE == 0 then
            DESYNCPLUS_BASEDIRECTION_BASEVALUE:SetValue(STAND_BASEDIRECTION_BASEVALUE)
            DESYNCPLUS_BASEDIRECTION_MINSLIDER:SetValue(STAND_BASEDIRECTION_MINVALUE)
            DESYNCPLUS_BASEDIRECTION_MAXSLIDER:SetValue(STAND_BASEDIRECTION_MAXVALUE)
            DESYNCPLUS_BASEDIRECTION_TYPE:SetValue(STAND_BASEDIRECTION_TYPE)
        else
            DESYNCPLUS_BASEDIRECTION_BASEVALUE:SetValue(MOVE_BASEDIRECTION_BASEVALUE)
            DESYNCPLUS_BASEDIRECTION_MINSLIDER:SetValue(MOVE_BASEDIRECTION_MINVALUE)
            DESYNCPLUS_BASEDIRECTION_MAXSLIDER:SetValue(MOVE_BASEDIRECTION_MAXVALUE)
            DESYNCPLUS_BASEDIRECTION_TYPE:SetValue(MOVE_BASEDIRECTION_TYPE)
        end
    end

    if DESYNCPLUS_ROTATION_STATE:GetValue() ~= ROTATION_STATE then
        ROTATION_STATE = DESYNCPLUS_ROTATION_STATE:GetValue()
        if ROTATION_STATE == 0 then
            DESYNCPLUS_ROTATION_MINSLIDER:SetValue(STAND_ROTATION_MINVALUE)
            DESYNCPLUS_ROTATION_MAXSLIDER:SetValue(STAND_ROTATION_MAXVALUE)
            DESYNCPLUS_ROTATION_SPEED:SetValue(STAND_ROTATION_CYCLESPEED)
            DESYNCPLUS_ROTATION_TYPE:SetValue(STAND_ROTATION_TYPE)
        else
            DESYNCPLUS_ROTATION_MINSLIDER:SetValue(MOVE_ROTATION_MINVALUE)
            DESYNCPLUS_ROTATION_MAXSLIDER:SetValue(MOVE_ROTATION_MAXVALUE)
            DESYNCPLUS_ROTATION_SPEED:SetValue(MOVE_ROTATION_CYCLESPEED)
            DESYNCPLUS_ROTATION_TYPE:SetValue(MOVE_ROTATION_TYPE)
        end
    end

    if DESYNCPLUS_LBY_STATE:GetValue() ~= LBY_STATE then
        LBY_STATE = DESYNCPLUS_LBY_STATE:GetValue()
        if LBY_STATE == 0 then
            DESYNCPLUS_LBY_MINSLIDER:SetValue(STAND_LBY_MINVALUE)
            DESYNCPLUS_LBY_MAXSLIDER:SetValue(STAND_LBY_MAXVALUE)
            DESYNCPLUS_LBY_SPEED:SetValue(STAND_LBY_CYCLESPEED)
            DESYNCPLUS_LBY_TYPE:SetValue(STAND_LBY_TYPE)
            DESYNCPLUS_LBY_VALUE:SetValue(STAND_LBY_VALUE)
        else
            DESYNCPLUS_LBY_MINSLIDER:SetValue(MOVE_LBY_MINVALUE)
            DESYNCPLUS_LBY_MAXSLIDER:SetValue(MOVE_LBY_MAXVALUE)
            DESYNCPLUS_LBY_SPEED:SetValue(MOVE_LBY_CYCLESPEED)
            DESYNCPLUS_LBY_TYPE:SetValue(MOVE_LBY_TYPE)
            DESYNCPLUS_LBY_VALUE:SetValue(MOVE_LBY_VALUE)
        end
    end

    if BASEDIRECTION_STATE == 0 then
        STAND_BASEDIRECTION_BASEVALUE = DESYNCPLUS_BASEDIRECTION_BASEVALUE:GetValue()
        STAND_BASEDIRECTION_MAXVALUE = DESYNCPLUS_BASEDIRECTION_MAXSLIDER:GetValue()
        STAND_BASEDIRECTION_MINVALUE = DESYNCPLUS_BASEDIRECTION_MINSLIDER:GetValue()
        STAND_BASEDIRECTION_TYPE = DESYNCPLUS_BASEDIRECTION_TYPE:GetValue()
    else
        MOVE_BASEDIRECTION_BASEVALUE = DESYNCPLUS_BASEDIRECTION_BASEVALUE:GetValue()
        MOVE_BASEDIRECTION_MAXVALUE = DESYNCPLUS_BASEDIRECTION_MAXSLIDER:GetValue()
        MOVE_BASEDIRECTION_MINVALUE = DESYNCPLUS_BASEDIRECTION_MINSLIDER:GetValue()
        MOVE_BASEDIRECTION_TYPE = DESYNCPLUS_BASEDIRECTION_TYPE:GetValue()
    end

    if ROTATION_STATE == 0 then
        STAND_ROTATION_MINVALUE = DESYNCPLUS_ROTATION_MINSLIDER:GetValue()
        STAND_ROTATION_MAXVALUE = DESYNCPLUS_ROTATION_MAXSLIDER:GetValue()
        STAND_ROTATION_CYCLESPEED = DESYNCPLUS_ROTATION_SPEED:GetValue()
        STAND_ROTATION_TYPE = DESYNCPLUS_ROTATION_TYPE:GetValue()
    else
        MOVE_ROTATION_MINVALUE = DESYNCPLUS_ROTATION_MINSLIDER:GetValue()
        MOVE_ROTATION_MAXVALUE = DESYNCPLUS_ROTATION_MAXSLIDER:GetValue()
        MOVE_ROTATION_CYCLESPEED = DESYNCPLUS_ROTATION_SPEED:GetValue()
        MOVE_ROTATION_TYPE = DESYNCPLUS_ROTATION_TYPE:GetValue()
    end

    if LBY_STATE == 0 then
        STAND_LBY_MINVALUE = DESYNCPLUS_LBY_MINSLIDER:GetValue()
        STAND_LBY_MAXVALUE = DESYNCPLUS_LBY_MAXSLIDER:GetValue()
        STAND_LBY_CYCLESPEED = DESYNCPLUS_LBY_SPEED:GetValue()
        STAND_LBY_TYPE = DESYNCPLUS_LBY_TYPE:GetValue()
        STAND_LBY_VALUE = DESYNCPLUS_LBY_VALUE:GetValue()
    else
        MOVE_LBY_MINVALUE = DESYNCPLUS_LBY_MINSLIDER:GetValue()
        MOVE_LBY_MAXVALUE = DESYNCPLUS_LBY_MAXSLIDER:GetValue()
        MOVE_LBY_CYCLESPEED = DESYNCPLUS_LBY_SPEED:GetValue()
        MOVE_LBY_TYPE = DESYNCPLUS_LBY_TYPE:GetValue()
        MOVE_LBY_VALUE = DESYNCPLUS_LBY_VALUE:GetValue()
    end

    if DESYNCPLUS_MISC_MASTERSWITCH:GetValue() then
        ManualAA()

        if globals.TickCount() > lastTick then 
            localPlayer = entities.GetLocalPlayer()
            if localPlayer then 
                velocity = math.sqrt(localPlayer:GetPropFloat( "localdata", "m_vecVelocity[0]" )^2 + localPlayer:GetPropFloat( "localdata", "m_vecVelocity[1]" )^2)
                if velocity > 5 then
                    SetLBY(true)
                    SetRotation(true)
                    SetBaseDirection(true)
                else
                    SetLBY(false)
                    SetRotation(false)
                    SetBaseDirection(false)
                end
            end
            SetFakelag()         
        end
    end
    if input.IsButtonPressed(45) then 
        if windowOpened then DESYNCPLUS_WINDOW:SetActive(0) else DESYNCPLUS_WINDOW:SetActive(1) end 
        windowOpened = not windowOpened
    end
    lastTick = globals.TickCount()
end

callbacks.Register("Draw", main)