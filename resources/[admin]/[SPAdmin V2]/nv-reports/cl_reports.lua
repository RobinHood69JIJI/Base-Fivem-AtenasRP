local ESX = nil
local NUI = false

CreateThread(function()
    while ESX == nil do
        Wait(1)
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end

    TriggerServerEvent("reports:init")
end)

RegisterNetEvent("reports:openreport")
AddEventHandler("reports:openreport", function(id)
    if not id then
        SendNUIMessage({ action = 'error', data = 'Invaild report id.' })
        return
    end

    SendNUIMessage({ action = 'open', data = id })
end)

RegisterNetEvent("reports:history")
AddEventHandler("reports:history", function(history)
    SetNuiFocus(true, true)
    SendNUIMessage({ action = 'history' })
end)

RegisterNetEvent("reports:delete")
AddEventHandler("reports:delete", function(id)
    SendNUIMessage({ action = 'delete', data = id })
end)

RegisterNUICallback('closeNUI', function()
    NUI = false
    SetNuiFocus(NUI, NUI)
end)

RegisterNUICallback('openNUI', function()
    NUI = true
    SetNuiFocus(NUI, NUI)
end)

RegisterNUICallback('goto', function(data)
    TriggerEvent("reports:goto", data.player)
end)

RegisterNUICallback('GetInfo', function(data, cb)
    local sec = math.floor((GetGameTimer()-data.timer)/1000)
    local min = math.floor(((GetGameTimer()-data.timer)/1000)/60)

    local id = GetPlayerFromServerId(data.player)
    local ped = GetPlayerPed(id)
    local div = {'fas fa-power-off', 'OFFLINE'}
    local callback = cb

    if DoesEntityExist(ped) and NetworkIsPlayerActive(id) then
        local nearbyPlayers = ESX.Game.GetPlayersInArea(GetEntityCoords(ped), 20)
        div = {'fas fa-users', #nearbyPlayers - 1 .. ' players nearby (20m)'}
    end

    ESX.TriggerServerCallback("reports:IsBlocked", function(data)
        callback({div,data, GetStreetAndZone(GetEntityCoords(ped)), min > 0 and (min .. " minutes ago") or (sec .. " seconds ago")})
    end, data.player)
end)

RegisterNUICallback('bring', function(data)
    local id = GetPlayerFromServerId(data.player)
    local ped = GetPlayerPed(id)

    if DoesEntityExist(ped) then
        TriggerServerEvent("reports:bring", data.player)
    else
        TriggerEvent("notification", 'Player offline!', 2)
    end
end)

RegisterNUICallback('block', function(data)
    TriggerServerEvent("reports:block", data.player, data.name)
end)

RegisterNUICallback('delete', function(data)
    TriggerServerEvent("reports:delete", data.report)
end)

RegisterNetEvent("reports:goto")
AddEventHandler("reports:goto", function(id)
    local id = GetPlayerFromServerId(id)
    local ped = GetPlayerPed(id)

    if DoesEntityExist(ped) then
        DoScreenFadeOut(500)
        Wait(500)
        SetEntityCoords(PlayerPedId(), GetEntityCoords(ped))
        DoScreenFadeIn(500)
    else
        TriggerEvent("notification", 'Player offline!', 2)
    end
end)

RegisterNetEvent("reports:error")
AddEventHandler("reports:error", function(msg)
    SendNUIMessage({ action = 'error', data = msg })
end)

RegisterNetEvent("reports:info")
AddEventHandler("reports:info", function(msg)
    SendNUIMessage({ action = 'info', data = msg })
end)

RegisterNetEvent("reports:addReport")
AddEventHandler("reports:addReport", function(data)
    local years, months, days, hours, minutes, seconds = Citizen.InvokeNative(0x50C7A99057A69748, Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local id = GetPlayerFromServerId(data.id)
    local ped = GetPlayerPed(id)
    local coords = GetEntityCoords(ped)

    data.x = coords.x
    data.y = coords.x
    data.z = coords.x
    data.time = hours .. ":" .. minutes .. ":" .. seconds
    data.timer = GetGameTimer()

    SendNUIMessage({ action = 'new', data = data })

    print(math.floor((GetGameTimer()-data.timer)/1000))
end)

function GetStreetAndZone(plyPos)
    local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    zone = tostring(GetNameOfZone(plyPos.x, plyPos.y, plyPos.z))
    local playerStreetsLocation = GetLabelText(zone)
    local street = street1 .. ", " .. playerStreetsLocation
    return street
end
