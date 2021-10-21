ESX = nil
PlayerData = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(500)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

local hunger = 0
local thirst = 0
local stress = 0
local showHud = true  
local hud = true

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    SendNUIMessage({
        active= hud,
    })
end)

function updateHungerThirstHUD(hunger, thirst,stress)
    local ped = PlayerPedId()
    local health = GetEntityHealth(ped) - 100
    local vehicle = GetVehiclePedIsIn(ped)
            
    if health < 1 then health = 0 end
    local o2 = false
    armor = GetPedArmour(ped)
    if armor > 100.0 then armor = 100.0 end
    if IsPedSwimmingUnderWater(ped) then
        o2 = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10
    end
    if IsPedInAnyVehicle(ped,true) then
        fuel = GetVehicleFuelLevel(vehicle)
    end
    SendNUIMessage({
        veh = IsPedInAnyVehicle(ped,true),
        o2 = o2,
        values = {
        health = health,
        shield = armor,
        hunger = hunger,
        thirst = thirst,
        stress = stress,
        id = GetPlayerServerId(PlayerId()),
        fuel = fuel,
        }
    })
end

function DrawText3D(x,y,z, text, r,g,b)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(r, g, b, 150)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function mostrarhud()
    SendNUIMessage({
        active= hud,
    })
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        mostrarhud()
        updateHungerThirstHUD(hunger, thirst, stress)
    end
end)

RegisterNetEvent("esx_status:onTick")
AddEventHandler("esx_status:onTick", function(status)
    hunger, thirst = status[1].percent, status[2].percent
end)

Citizen.CreateThread(function()
	Citizen.Wait(100)

	while true do
		local sleepThread = 500

		local radarEnabled = IsRadarEnabled()

		if not IsPedInAnyVehicle(PlayerPedId()) and radarEnabled then
			DisplayRadar(false)
		elseif IsPedInAnyVehicle(PlayerPedId()) and not radarEnabled then
			DisplayRadar(true)
		end

		Citizen.Wait(sleepThread)
	end
end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(1)
      if (IsPauseMenuActive()) and not isPaused then
            showHud = false
            hud = false
        else
            showHud = true
            hud = true
        end
    end
end)

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
		HideHudComponentThisFrame(2)
		HideHudComponentThisFrame(3)
        HideHudComponentThisFrame(4)
        HideHudComponentThisFrame(6)
        HideHudComponentThisFrame(7)
		HideHudComponentThisFrame(8)
		HideHudComponentThisFrame(9)
        HideHudComponentThisFrame(20) 
	end
end)