local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

-- Disable Dispatch
--Citizen.CreateThread(function()
--	while true do
--		Wait(100)
--		for i = 1, 15 do
--			EnableDispatchService(i, false)
--		end
--	end
--end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5) -- A Short Daily of 5 MS
		DisableControlAction(0, 140, true) -- r
		DisableControlAction(0, 304, true) -- h
	end
end)

Citizen.CreateThread(function()
	Wait(100)
	for i = 1, 15 do
		Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
	end
end)

-- No Weapon Reward Car 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        DisablePlayerVehicleRewards(PlayerId())
		SetVehicleHasBeenOwnedByPlayer(veh,true)
    end
end)

-- AntiVDM
Citizen.CreateThread(function()
    while true do
        N_0x4757f00bc6323cfe(-1553120962, 0.0) --undocumented damage modifier. 1st argument is hash, 2nd is modified (0.0-1.0)
        Wait(0)
    end
end)

-- No More Weapons Npc
local pedindex = {}

function SetWeaponDrops() 
    local handle, ped = FindFirstPed()
    local finished = false 
    repeat 
        if not IsEntityDead(ped) then
                pedindex[ped] = {}
        end
        finished, ped = FindNextPed(handle) 
    until not finished
    EndFindPed(handle)

    for peds,_ in pairs(pedindex) do
        if peds ~= nil then 
            SetPedDropsWeaponsWhenDead(peds, false) 
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        SetWeaponDrops()
    end
end)

function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end