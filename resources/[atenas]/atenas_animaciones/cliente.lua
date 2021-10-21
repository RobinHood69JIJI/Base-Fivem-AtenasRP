local job = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

AddEventHandler('playerSpawned', function(spawn)
  TriggerServerEvent('vaini_animaciones:cojertrabajo')
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    TriggerServerEvent('vaini_animaciones:cojertrabajo')
end)
TriggerServerEvent('vaini_animaciones:cojertrabajo')
RegisterNetEvent('vaini_animaciones:dartrabajo')
AddEventHandler('vaini_animaciones:dartrabajo',function(jobu)
  trabajo = jobu
end)

Citizen.CreateThread(function()
  local dict = "random@arrests"
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
      Citizen.Wait(0)
  end
  while true do
    Citizen.Wait(0)
    if trabajo == "police" or trabajo == "ambulance" then
		if (IsControlJustPressed(1, 20)) then
        TaskPlayAnim(PlayerPedId(), dict, "generic_radio_chatter", 8.0, 8.0, -1, 48, 1, false, false, false)
      end
    end
  end
end)

Citizen.CreateThread(function()
  local dict = "anim@mp_player_intcelebrationmale@face_palm"
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
      Citizen.Wait(0)
  end
  while true do
    Citizen.Wait(0)
	if (IsControlJustPressed(1, 47)) then
    TaskPlayAnim(PlayerPedId(), dict, "face_palm", 8.0, 8.0, -1, 48, 1, false, false, false)
    end
  end
end)

Citizen.CreateThread(function()
  local dict = "amb@world_human_cop_idles@male@idle_b"
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
      Citizen.Wait(0)
  end
  while true do
    Citizen.Wait(0)
    	if trabajo == "police" then
			if (IsControlJustPressed(1, 74)) then
    		TaskPlayAnim(GetPlayerPed(-1), dict, "idle_d", 8.0, 8.0, -1, 50, 0, false, false, false)
		end
    end
  end
end)