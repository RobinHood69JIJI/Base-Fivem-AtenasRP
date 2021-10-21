ESX = nil
blip = nil
oldblip = nil
blips = {}

colorNames = {
  ['0'] = "Negro metálico",
  ['1'] = "Negro grafito metálico",
  ['2'] = "Robo negro metálico",
  ['3'] = "Plata oscura metalizada",
  ['4'] = "Plata metálica",
  ['5'] = "Azul metálico plateado",
  ['6'] = "Gris metálico de acero",
  ['7'] = "Plata metálica sombra",
  ['8'] = "Plata de piedra metálica",
  ['9'] = "Plata metálica de medianoche",
  ['10'] = "Pistola metálica de metal",
  ['11'] = "Gris antracita metálico",
  ['12'] = "Negro mate",
  ['13'] = "Gris mate",
  ['14'] = "Gris claro mate",
  ['15'] = "Util Black",
  ['16'] = "Util Black Poly",
  ['17'] = "Util plata oscura",
  ['18'] = "Util Silver",
  ['19'] = "Util Gun Metal",
  ['20'] = "Util Shadow Silver",
  ['21'] = "Negro desgastado",
  ['22'] = "Grafito desgastado",
  ['23'] = "Gris plateado gastado",
  ['24'] = "Plata gastada",
  ['25'] = "Plata azul gastada",
  ['26'] = "Plata de sombra gastada",
  ['27'] = "Rojo metálico",
  ['28'] = "Rojo Torino Metálico",
  ['29'] = "Fórmula metálica roja",
  ['30'] = "Rojo metálico resplandor",
  ['31'] = "Rojo metálico elegante",
  ['32'] = "Rojo granate metálico",
  ['33'] = "Rojo metálico del desierto",
  ['34'] = "Rojo Cabernet metálico",
  ['35'] = "Rojo caramelo metálico",
  ['36'] = "Naranja metálico del amanecer",
  ['37'] = "Oro clásico metálico",
  ['38'] = "Naranja Metálico",
  ['39'] = "Rojo mate",
  ['40'] = "Rojo oscuro mate",
  ['41'] = "Naranja mate",
  ['42'] = "Amarillo mate",
  ['43'] = "Util Red",
  ['44'] = "Util rojo brillante",
  ['45'] = "Util Garnet Red",
  ['46'] = "Rojo desgastado",
  ['47'] = "Rojo dorado desgastado",
  ['48'] = "Rojo oscuro desgastado",
  ['49'] = "Verde oscuro metalizado",
  ['50'] = "Metallic Racing Green",
  ['51'] = "Verde Mar Metálico",
  ['52'] = "Verde oliva metálico",
  ['53'] = "Verde metálico",
  ['54'] = "Gasolina Metálica Azul Verde",
  ['55'] = "Verde lima mate",
  ['56'] = "Util verde oscuro",
  ['57'] = "Util Green",
  ['58'] = "Verde oscuro desgastado",
  ['59'] = "Verde desgastado",
  ['60'] = "Lavado de mar gastado",
  ['61'] = "Azul metálico de medianoche",
  ['62'] = "Azul metálico oscuro",
  ['63'] = "Azul metálico de Sajonia",
  ['64'] = "Azul metálico",
  ['65'] = "Azul marino metálico",
  ['66'] = "Azul metálico del puerto",
  ['67'] = "Azul Diamante Metálico",
  ['68'] = "Azul metálico de surf",
  ['69'] = "Azul náutico metálico",
  ['70'] = "Azul metálico brillante",
  ['71'] = "Azul metalizado morado",
  ['72'] = "Azul metálico de spinnaker",
  ['73'] = "Metallic Ultra Blue",
  ['74'] = "Azul metálico brillante",
  ['75'] = "Util Azul Oscuro",
  ['76'] = "Util Midnight Blue",
  ['77'] = "Util Blue",
  ['78'] = "Util Sea Foam Blue",
  ['79'] = "Uil Lightning blue",
  ['80'] = "Util Maui Blue Poly",
  ['81'] = "Util Bright Blue",
  ['82'] = "Azul oscuro mate",
  ['83'] = "Azul mate",
  ['84'] = "Azul medianoche mate",
  ['85'] = "Azul oscuro desgastado",
  ['86'] = "Azul desgastado",
  ['87'] = "Azul claro desgastado",
  ['88'] = "Taxi metálico amarillo",
  ['89'] = "Raza metálica amarilla",
  ['90'] = "Bronce metálico",
  ['91'] = "Amarillo Metálico",
  ['92'] = "Cal metálica",
  ['93'] = "Champán metálico",
  ['94'] = "Pueblo Beige metálico",
  ['95'] = "Marfil oscuro metálico",
  ['96'] = "Marrón Choco Metálico",
  ['97'] = "Marrón dorado metálico",
  ['98'] = "Marrón claro metálico",
  ['99'] = "Beige pajizo metálico",
  ['100'] = "Marrón musgo metálico",
  ['101'] = "Marrón de pistón metálico",
  ['102'] = "Madera de haya metálica",
  ['103'] = "Madera de haya oscura metálica",
  ['104'] = "Naranja Choco Metálico",
  ['105'] = "Arena metálica de playa",
  ['106'] = "Arena Metálica Bleeched Sun",
  ['107'] = "Crema metálica",
  ['108'] = "Util Brown",
  ['109'] = "Util Medium Brown",
  ['110'] = "Util marrón claro",
  ['111'] = "Blanco metálico",
  ['112'] = "Blanco Frost Metálico",
  ['113'] = "Miel Beige desgastado",
  ['114'] = "Marrón gastado",
  ['115'] = "Marrón oscuro desgastado",
  ['116'] = "Color beige paja gastado",
  ['117'] = "Acero cepillado",
  ['118'] = "Acero negro cepillado",
  ['119'] = "Aluminio cepillado",
  ['120'] = "Chrome",
  ['121'] = "Desgastado Blanco",
  ['122'] = "Util Off White",
  ['123'] = "Naranja gastada",
  ['124'] = "Naranja claro gastado",
  ['125'] = "Verde metálico Securicor",
  ['126'] = "Taxi amarillo desgastado",
  ['127'] = "coche de policía azul",
  ['128'] = "Verde mate",
  ['129'] = "Marrón mate",
  ['130'] = "Naranja gastada",
  ['131'] = "Blanco mate",
  ['132'] = "Blanco desgastado",
  ['133'] = "Ejército verde oliva desgastado",
  ['134'] = "Blanco puro",
  ['135'] = "Rosa fuerte",
  ['136'] = "Rosa salmón",
  ['137'] = "Rosa metalizado bermellón",
  ['138'] = "Naranja",
  ['139'] = "Verde",
  ['140'] = "Azul",
  ['141'] = "Mettalic Black Blue",
  ['142'] = "Negro metalizado morado",
  ['143'] = "Negro metalizado rojo",
  ['144'] = "verde cazador",
  ['145'] = "Púrpura metálico",
  ['146'] = "Metaillic V Dark Blue",
  ['147'] = "MODSHOP BLACK1",
  ['148'] = "Púrpura mate",
  ['149'] = "Púrpura oscuro mate",
  ['150'] = "Rojo metálico lava",
  ['151'] = "Verde bosque mate",
  ['152'] = "Malva Oliva mate",
  ['153'] = "Marrón Desierto Mate",
  ['154'] = "Bronceado mate del desierto",
  ['155'] = "Verde mate de foilaje",
  ['156'] = "COLOR DE ALEACIÓN PREDETERMINADO",
  ['157'] = "Epsilon Blue",
}

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
    TriggerEvent('chat:addSuggestion', '/forzar', 'Llamada de entorno a la policía al robar un coche de NPC')
end)

RegisterNetEvent('forzar:setBlip')
AddEventHandler('forzar:setBlip', function(x, y, z, message)

    TriggerEvent("pNotify:SetQueueMax", "forzar", 5)

    TriggerEvent("pNotify:SendNotification", {
      text = message,
      type = "info",
      timeout = 10000,
      layout = "centerRight",
      queue = "forzar",
      animation = {
				            open = "gta_effects_open",
				            close = "gta_effects_fade_out"
				        }})
    

    contador = 20000

    forzar_llamada = true 
    Citizen.CreateThread(function()
      blipPos = vector3(x, y, z)
      blip = AddBlipForCoord(x, y, z)
      SetBlipSprite(blip, 523)
      SetBlipScale(blip, 1.0)
      SetBlipColour(blip, 2)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString('Robo de vehiculo menor')
      EndTextCommandSetBlipName(blip)
      table.insert(blips, blip)

      activarcontador = true
      
      
      while forzar_llamada do
        if IsControlJustReleased(1, 157) then
          TriggerEvent("pNotify:SendNotification", {
            text = 'Has aceptado la llamada',
            type = "success",
            timeout = 3000,
            layout = "centerRight",
            queue = "forzar",
            animation = {
				            open = "gta_effects_open",
				            close = "gta_effects_fade_out"
				        }})
          activarcontador2 = true
          forzar_llamada = false
          TriggerEvent('llamada_forzar:aceptarForzar')
          TriggerEvent('forzar:remblip', blip)
          SetNewWaypoint(tonumber(x), tonumber(y))
        elseif IsControlJustReleased(1, 158) then
          TriggerEvent("pNotify:SendNotification", {
            text = 'Has rechazado la llamada',
            type = "error",
            timeout = 3000,
            layout = "centerRight",
            queue = "forzar",
            animation = {
				            open = "gta_effects_open",
				            close = "gta_effects_fade_out"
				        }})
          forzar_llamada = false
          blipPos = nil  
          RemoveBlip(blip)
          TriggerEvent('llamada_forzar:rechazarForzar') 
        end

        contador = contador - 1
        if contador <= 0 then
          forzar_llamada = false 
          RemoveBlip(blip)
        end
        Citizen.Wait(0)
      end 

    end)
end)

RegisterNetEvent('forzar:remblip')
AddEventHandler('forzar:remblip', function(blip)
  local newblip = blip
  Wait(180000)
  RemoveBlip(newblip)
end)

Citizen.CreateThread(function()
  local contador2 = 10
  while activarcontador2 == true do
    print ('activado')
    Citizen.Wait(1000)
    if contador2 <= 0 then
      blipPos = nil 
      RemoveBlip(blip)
      activarcontador2 = false
    else
      contador2 = contador2 - 1
      print (contador2)
    end
  end 
end)

RegisterCommand('forzar', function(source, args)
    local playername = GetPlayerName(PlayerId())
    local ped = GetPlayerPed(PlayerId())
    local x, y, z = table.unpack(GetEntityCoords(ped, true))
    local street = GetStreetNameAtCoord(x, y, z)
    local location = GetStreetNameFromHashKey(street)
    local estaDentro = IsPedInAnyVehicle(ped, false)
    local model = GetEntityModel(veh)
    local vehicleModel = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
    local vehiculo = GetVehiclePedIsIn(ped)
    local primary = GetVehicleColours(vehiculo)
    primary = colorNames[tostring(primary)]
    local modelo = GetDisplayNameFromVehicleModel(vehicleModel)
    local matricula = GetVehicleNumberPlateText(vehiculo)

    TriggerEvent("pNotify:SetQueueMax", "cl", 5)

    if estaDentro then
      local message = '<em><b style=color:#FFFFFF>ROBO DE VEHÍCULO:</b><em> </br></br> <b style=color:#FFFFFF>Modelo: </b><b style=color:#00FBFF>'.. modelo ..'</b> </br><b style=color:#FFFFFF>Color: </b><b style=color:#00FBFF>'.. primary ..'</b></br> </b><b style=color:#FFFFFF>Matrícula: </b><b style=color:#00FBFF>' .. matricula .. '</b> </br> <b style=color:#FFFFFF>Ubicación:</b> <b style=color:#00FBFF>' .. location .. '</b> </br></br> <b style=color:#00FF59>[1] Aceptar</b>  <b style=color:#FF0000>[2] Rechazar</b>',

      TriggerEvent("pNotify:SendNotification", {
        text = 'Se ha enviado una llamada de forzar a la policía.',
        type = "info",
        timeout = 3000,
        layout = "centerLeft",
        queue = "cl",
        animation = {
				            open = "gta_effects_open",
				            close = "gta_effects_fade_out"
				        }})
 
      TriggerServerEvent('forzar:alert', message, x, y, z)
    else

      TriggerEvent("pNotify:SendNotification", {
        text = 'No estás en ningún vehiculo.',
        type = "error",
        timeout = 3000,
        layout = "bottomLeft",
        queue = "cl",
        animation = {
				            open = "gta_effects_open",
				            close = "gta_effects_fade_out"
				        }})

    end
end)