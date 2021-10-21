local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil

--- esx
local GUI = {}
ESX                           = nil
GUI.Time                      = 0
local PlayerData              = {}

Citizen.CreateThread(function ()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
 	PlayerData = ESX.GetPlayerData()
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

----markers
AddEventHandler('esx_duty:hasEnteredMarker', function (zone)
  if zone == 'AmbulanceDuty' then
    CurrentAction     = 'ambulance_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
  if zone == 'PoliceDuty' then
    CurrentAction     = 'police_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
  if zone == 'TaxiDuty' then
    CurrentAction     = 'taxi_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
  if zone == 'MecanicoDuty' then
    CurrentAction     = 'mecanico_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
end)

AddEventHandler('esx_duty:hasExitedMarker', function (zone)
  CurrentAction = nil
end)


--keycontrols
Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(0)

    local playerPed = GetPlayerPed(-1)
    if CurrentAction ~= nil then
      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlPressed(0, 38) then
        if CurrentAction == 'ambulance_duty' then
          if PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'offambulance' then
            TriggerServerEvent('duty:ambulance')
          if PlayerData.job.name == 'ambulance' then
            ESX.ShowNotification("Has salido de servicio.")
            Wait(1000)
          else
            ESX.ShowNotification("Has entrado de servicio.")
            Wait(1000)
          end
        else
          ESX.ShowNotification("No eres EMS.")
          Wait(1000)
        end
      end

        if CurrentAction == 'police_duty' then
          if PlayerData.job.name == 'police' or PlayerData.job.name == 'offpolice' then
            TriggerServerEvent('duty:police')
          if PlayerData.job.name == 'police' then
		        RemoveAllPedWeapons(playersss, true)
            ESX.ShowNotification("Has salido de servicio.")
            Wait(1000)
          else
            ESX.ShowNotification("Has entrado de servicio.")
            Wait(1000)
          end
        else
          ESX.ShowNotification("No eres policía.")
          Wait(1000)
          end
        end
		if CurrentAction == 'taxi_duty' then
          if PlayerData.job.name == 'taxi' or PlayerData.job.name == 'offtaxi' then
            TriggerServerEvent('duty:taxi')
          if PlayerData.job.name == 'taxi' then
            ESX.ShowNotification("Has salido de servicio.")
            Wait(1000)
          else
            ESX.ShowNotification("Has entrado de servicio.")
            Wait(1000)
          end
        else
          ESX.ShowNotification("No eres Taxista.")
          Wait(1000)
          end
        end
        if IsControlPressed(0, 38) then
          if CurrentAction == 'mecanico_duty' then
            if PlayerData.job.name == 'mechanic' or PlayerData.job.name == 'offmechanic' then
              TriggerServerEvent('duty:mecanico')
            if PlayerData.job.name == 'mechanic' then
              ESX.ShowNotification("Has salido de servicio.")
              Wait(1000)
            else
              ESX.ShowNotification("Has entrado de servicio.")
              Wait(1000)
            end
          else
            ESX.ShowNotification("No eres Mecánico.")
            Wait(1000)
      end
    end
  end
end
end
end
end)
-- Display markers
Citizen.CreateThread(function ()
  while true do
    Wait(1)

    local coords = GetEntityCoords(GetPlayerPed(-1))

    for k,v in pairs(Config.Zones) do
      if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
        DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
      end
    end
  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function ()
  while true do
    Wait(1)

    local coords      = GetEntityCoords(GetPlayerPed(-1))
    local isInMarker  = false
    local currentZone = nil

    for k,v in pairs(Config.Zones) do
      if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
        isInMarker  = true
        currentZone = k
      end
    end

    if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
      HasAlreadyEnteredMarker = true
      LastZone                = currentZone
      TriggerEvent('esx_duty:hasEnteredMarker', currentZone)
    end

    if not isInMarker and HasAlreadyEnteredMarker then
      HasAlreadyEnteredMarker = false
      TriggerEvent('esx_duty:hasExitedMarker', LastZone)
    end
  end
end)