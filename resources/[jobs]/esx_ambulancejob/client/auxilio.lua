ESX = nil
blip = nil
oldblip = nil
blips = {}

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end

  while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

  PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
PlayerData.job = job
end)
      
Citizen.CreateThread(function()
  TriggerEvent('chat:addSuggestion', '/auxilio', 'Manda un señal de auxilio a los EMS')
end)

RegisterNetEvent('auxilio:setBlip')
AddEventHandler('auxilio:setBlip', function(x, y, z, message)
  if PlayerData.job.name ~= "ambulance" then return end
  TriggerEvent("pNotify:SetQueueMax", "auxilio", 5)
  TriggerEvent("pNotify:SendNotification", {
    text = message,
    type = "error",
    timeout = 20000,
    layout = "centerRight",
    queue = "auxilio",
    animation = {
            open = "gta_effects_open",
            close = "gta_effects_fade_out"
          }})

  contador = 20000

  auxilio_llamada = true 
  Citizen.CreateThread(function()
    blipPos = vector3(x, y, z)
    blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, 304)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Auxilio')
    EndTextCommandSetBlipName(blip)
    table.insert(blips, blip)

    activarcontador = true
    
    
    while auxilio_llamada do
      if IsControlJustReleased(1, 38) then
        TriggerEvent("pNotify:SendNotification", {
          text = 'Has aceptado la llamada',
          type = "success",
          timeout = 3000,
          layout = "centerRight",
          queue = "auxilio",
          animation = {
                  open = "gta_effects_open",
                  close = "gta_effects_fade_out"
              }})
        activarcontador2 = true
        auxilio_llamada = false
        TriggerEvent('llamada_auxilio:aceptarAuxilio')
        TriggerEvent('auxilio:remblip', blip)
        SetNewWaypoint(tonumber(x), tonumber(y))
      elseif IsControlJustReleased(1, 113) then
        TriggerEvent("pNotify:SendNotification", {
          text = 'Has rechazado la llamada',
          type = "error",
          timeout = 3000,
          layout = "centerRight",
          queue = "auxilio",
          animation = {
                  open = "gta_effects_open",
                  close = "gta_effects_fade_out"
              }})
        auxilio_llamada = false
        blipPos = nil  
        RemoveBlip(blip)
        TriggerEvent('llamada_auxilio:rechazarAuxilio') 
      end

      contador = contador - 1
      if contador <= 0 then
        auxilio_llamada = false 
        RemoveBlip(blip)
      end
      Citizen.Wait(0)
    end 

  end)
end)

RegisterNetEvent('auxilio:remblip')
AddEventHandler('auxilio:remblip', function(blip)
local newblip = blip
Wait(180000)
RemoveBlip(newblip)
end)

Citizen.CreateThread(function()
local contador2 = 10
while activarcontador2 == true do
  Citizen.Wait(1000)
  if contador2 <= 0 then
    blipPos = nil 
    RemoveBlip(blip)
    activarcontador2 = false
  else
    contador2 = contador2 - 1
  end
end 
end)

RegisterCommand('auxilio', function(source, args)
  local name = GetPlayerName(PlayerId())
  local ped = GetPlayerPed(PlayerId())
  local x, y, z = table.unpack(GetEntityCoords(ped, true))
  local msg = table.concat(args, ' ')
  if args[1] == nil then
      TriggerEvent('chatMessage', '^5Auxilio', {255,255,255}, ' ^7Por favor, escribe lo sucedido detalladamente.')
  else
    local message = '<em><b style=color:#FFFFFF>LLAMADA DE AUXILIO:</b><em> </br></br> <b style=color:#FFFFFF>Llamada: </b><b style=color:#00FBFF>'.. msg ..'</b> </br></br> <b style=color:#00FF59>[E] Aceptar</b>  <b style=color:#FF0000>[G] Rechazar</b>',

    TriggerEvent("pNotify:SendNotification", {
      text = 'Se ha enviado una llamada de auxilio a los EMS.',
      type = "error",
      timeout = 3000,
      layout = "centerLeft",
      queue = "cl",
      animation = {
        open = "gta_effects_open",
        close = "gta_effects_fade_out"
              }})
    TriggerServerEvent('auxilio:alert', x, y, z, message)
  end
end)