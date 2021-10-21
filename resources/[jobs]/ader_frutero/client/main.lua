ESX = nil
SAX = {}
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
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

-- Coger herramientas

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        if Vdist2(GetEntityCoords(PlayerPedId()), Config.CogerHerramientas.x, Config.CogerHerramientas.y, Config.CogerHerramientas.z) < 4.0 then
            if IsJobTrue() then
                sleep = 0
            Notification('Presiona ~y~E~w~ para coger las ~b~herramientas de trabajo', vector3(Config.CogerHerramientas.x, Config.CogerHerramientas.y, Config.CogerHerramientas.z + 0.9))
            if IsControlJustPressed(1, 51) then
                SAX.menuHerramientas()
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

-- End Coger herramientas

-- Cambiar vestimenta

Citizen.CreateThread(function()
    while true do
        local sleep = 1000

        if Vdist2(GetEntityCoords(PlayerPedId()), Config.Vestuario.x, Config.Vestuario.y, Config.Vestuario.z) < 4 then
            if IsJobTrue() then
            DrawMarker(2, Config.Vestuario.x, Config.Vestuario.y, Config.Vestuario.z + 0.2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.2, 0.18, 0.10, 255, 255, 255, 200, false, false, false, true, false, false, false)
            Notification('Presiona ~y~E~w~ para acceder al ~g~vestuario', vector3(Config.Vestuario.x, Config.Vestuario.y, Config.Vestuario.z + 0.9))
            sleep = 0
            if IsControlJustPressed(1, 51) then
                SAX.menuRopa()
                
                end
            end
        end

        Citizen.Wait(sleep)
    end
end)

-- End cambiar vestimenta

-- Recoger naranjas

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        
        local sleep = 1000

        for k,v in pairs(Config.Naranjas) do
        if Vdist2(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z) < 5 then 
            if IsJobTrue() then
            sleep = 0
            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.2, 0.18, 0.10, 255, 255, 255, 200, false, false, false, true, false, false, false)
            Notification('Presiona ~y~E~w~ para recoger ~o~naranjas', vector3(v.x, v.y, v.z + 0.9))
            if IsControlJustPressed(1, 51) then
                    TriggerServerEvent('ader_frutero:checkTijeras')
                    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
                    exports['progressBars']:startUI(4000, "Recogiendo Naranjas")
					Citizen.Wait(4000)
					ClearPedTasks(playerPed)
					Citizen.Wait(1500)
                    TriggerServerEvent('ader_frutero:recogerNaranjas')
                    Citizen.Wait(8000)
                    end
                end
            end
        end

        Citizen.Wait(sleep)
    end
end)

-- End recoger naranjas

-- Recoger melocotones

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        
        local sleep = 1000

        for k,v in pairs(Config.Melocotones) do
        if Vdist2(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z) < 5 then
            sleep = 0
            if IsJobTrue() then
            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.2, 0.18, 0.10, 255, 255, 255, 200, false, false, false, true, false, false, false)
            Notification('Presiona ~y~E~w~ para recoger ~o~melocotones', vector3(v.x, v.y, v.z + 0.9))
            if IsControlJustPressed(1, 51) then
                TriggerServerEvent('ader_frutero:checkTijeras')
                TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
                exports['progressBars']:startUI(4000, "Recogiendo melocotones")
					Citizen.Wait(4000)
					ClearPedTasks(playerPed)
					Citizen.Wait(1500)
                TriggerServerEvent('ader_frutero:recogerMelocotones')
					Wait(15000)
                    end
                end
            end
        end

        Citizen.Wait(sleep)
    end
end)

-- End recoger melocotones

-- Recoger fresas

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local sleep = 1000
        for k,v in pairs(Config.Fresas) do
        if Vdist2(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z) < 5 then
            sleep = 0
            if IsJobTrue() then
            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.2, 0.18, 0.10, 255, 255, 255, 200, false, false, false, true, false, false, false)
            Notification('Presiona ~y~E~w~ para recoger ~r~fresas', vector3(v.x, v.y, v.z + 0.9))
            if IsControlJustPressed(1, 51) then
                TriggerServerEvent('ader_frutero:checkTijeras')
                TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
                exports['progressBars']:startUI(4000, "Recogiendo fresas")
					Citizen.Wait(6000)
					ClearPedTasks(playerPed)
					Citizen.Wait(1500)
                TriggerServerEvent('ader_frutero:recogerFresas')
					Wait(15000)
                    end
                end
            end
        end

        Citizen.Wait(sleep)
    end
end)
-- End recoger fresas

-- Procesar fruta

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local sleep = 1000
        for k,v in pairs(Config.Procesar) do
        if Vdist2(GetEntityCoords(PlayerPedId()), v) < 5 then
            sleep = 0
            if IsJobTrue() then
            Notification('Presiona ~y~E~w~ para ~g~procesar ~w~las frutas', vector3(v.x, v.y, v.z + 1.0))
            if IsControlJustPressed(1, 51) then
                TaskStartScenarioInPlace(playerPed, 'world_human_hang_out_street', 0, false)
                exports['progressBars']:startUI(4000, "Procesando fruta")
					Citizen.Wait(4000)
					ClearPedTasks(playerPed)
					Citizen.Wait(1500)
                TriggerServerEvent('ader_frutero:procesarFruta')
                    end
                end
            end
        end

        Citizen.Wait(sleep)
    end
end)

-- End procesar fruta

-- Vender fruta

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local sleep = 1000
        for k,v in pairs(Config.Vender) do
        if Vdist2(GetEntityCoords(PlayerPedId()), v) < 5 then
            sleep = 0
            if IsJobTrue() then
            Notification(' Presiona ~y~E~w~ para ~g~vender ~w~las\n ~b~Cajas de Fruta', vector3(v.x, v.y, v.z + 0.9))
            if IsControlJustPressed(1, 51) then
                TaskStartScenarioInPlace(playerPed, 'world_human_cop_idles', 0, false)
                exports['progressBars']:startUI(4000, "Vendiendo cajas de fruta")
					Citizen.Wait(4000)
					ClearPedTasks(playerPed)
					Citizen.Wait(1500)
                TriggerServerEvent('ader_frutero:venderFruta')
                    end
                end
            end
        end

        Citizen.Wait(sleep)
    end
end)

-- End vender fruta

-- Abrir menú de herramientas

SAX.menuHerramientas = function()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'herramientas',
    {
        title = 'Herramientas',
        align = 'bottom-right',
        elements = {
            {label = 'Coger herramientas de trabajo', value = 'herramientas'}
        }
    }, function(data, menu)
        local ader = data.current.value
        if ader == 'herramientas' then
            TriggerServerEvent('ader_frutero:darHerramienta')
            menu.close()
            return
        end
    end)
end

-- End menú de herramientas

-- Abrir menú de ropa

SAX.menuRopa = function()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vestimenta',
    {
        title = 'Menú de vestimenta',
        align = 'bottom-right',
        elements = {
            {label = 'Ropa de trabajo', value = 'trabajo'},
            {label = 'Ropa de civil', value = 'civil'},
        }
    }, function(data, menu)
        local ader = data.current.value
        if ader == 'trabajo' then
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            if skin.sex == 0 then
            TriggerEvent('skinchanger:change', 'tshirt_1', 15)
			TriggerEvent('skinchanger:change', 'tshirt_2', 0)
			TriggerEvent('skinchanger:change', 'torso_1', 43)
			TriggerEvent('skinchanger:change', 'torso_2', 0)
			TriggerEvent('skinchanger:change', 'arms', 37)
			TriggerEvent('skinchanger:change', 'pants_1', 13)
			TriggerEvent('skinchanger:change', 'pants_2', 0)
			TriggerEvent('skinchanger:change', 'shoes_1', 25)
			TriggerEvent('skinchanger:change', 'shoes_2', 0)
			TriggerEvent('skinchanger:change', 'chain_1', 0)
			TriggerEvent('skinchanger:change', 'chain_2', 0)
			TriggerEvent('skinchanger:change', 'helmet_1', -1)
			TriggerEvent('skinchanger:change', 'helmet_2', 0)
			TriggerEvent('skinchanger:change', 'mask_1', 0)
			TriggerEvent('skinchanger:change', 'mask_2', 0)
			TriggerEvent('skinchanger:change', 'bags_1', 0)
			TriggerEvent('skinchanger:change', 'bags_2', 0)
			TriggerEvent('skinchanger:change', 'glasses_1', 0)
			TriggerEvent('skinchanger:change', 'glasses_2', 0)
			TriggerEvent('skinchanger:change', 'bproof_1', 0)
			TriggerEvent('skinchanger:change', 'bproof_2', 0)
			TriggerEvent('skinchanger:change', 'decals_1', 0)
            TriggerEvent('skinchanger:change', 'decals_2', 0)
            menu.close()
            return
        end
        if skin.sex == 1 then
            TriggerEvent('skinchanger:change', 'tshirt_1', 14)
			TriggerEvent('skinchanger:change', 'tshirt_2', 0)
			TriggerEvent('skinchanger:change', 'torso_1', 86)
			TriggerEvent('skinchanger:change', 'torso_2', 0)
			TriggerEvent('skinchanger:change', 'arms', 33)
			TriggerEvent('skinchanger:change', 'pants_1', 73)
			TriggerEvent('skinchanger:change', 'pants_2', 5)
			TriggerEvent('skinchanger:change', 'shoes_1', 66)
			TriggerEvent('skinchanger:change', 'shoes_2', 4)
			TriggerEvent('skinchanger:change', 'chain_1', 0)
			TriggerEvent('skinchanger:change', 'chain_2', 0)
			TriggerEvent('skinchanger:change', 'helmet_1', -1)
			TriggerEvent('skinchanger:change', 'helmet_2', 0)
			TriggerEvent('skinchanger:change', 'mask_1', 0)
			TriggerEvent('skinchanger:change', 'mask_2', 0)
			TriggerEvent('skinchanger:change', 'bags_1', 0)
			TriggerEvent('skinchanger:change', 'bags_2', 0)
			TriggerEvent('skinchanger:change', 'glasses_1', 0)
			TriggerEvent('skinchanger:change', 'glasses_2', 0)
			TriggerEvent('skinchanger:change', 'bproof_1', 0)
			TriggerEvent('skinchanger:change', 'bproof_2', 0)
			TriggerEvent('skinchanger:change', 'decals_1', 0)
            TriggerEvent('skinchanger:change', 'decals_2', 0)
            end
        end)
    end
        if ader == 'civil' then
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                local model = nil
      
              if skin.sex == 0 then
                  model = GetHashKey("mp_m_freemode_01")
              else
                  model = GetHashKey("mp_f_freemode_01")
              end
  
                RequestModel(model)
                while not HasModelLoaded(model) do
                  RequestModel(model)
                  Citizen.Wait(1)
              end
  
              SetPlayerModel(PlayerId(), model)
              SetModelAsNoLongerNeeded(model)
  
              TriggerEvent('skinchanger:loadSkin', skin)
              TriggerEvent('esx:restoreLoadout')
              menu.close()
            end)
          return
        end
    end)
end

-- End menú de ropa

-- NPC

Citizen.CreateThread(function()
    modelHash = GetHashKey("a_m_m_farmer_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
       	Wait(1)
    end
    crearNPCHerramientas()
end)

crearNPCHerramientas = function()
    negrata = CreatePed(5, modelHash , Config.CogerHerramientas.x, Config.CogerHerramientas.y, Config.CogerHerramientas.z - 1, Config.CogerHerramientas.rotacion, Config.CogerHerramientas.NetworkSync, Config.CogerHerramientas.NetworkSync)
	FreezeEntityPosition(negrata, true)
	SetEntityInvincible(negrata, true)
	SetBlockingOfNonTemporaryEvents(negrata, true)
	TaskStartScenarioInPlace(negrata, "world_human_drug_dealer_hard", 0, true)
end

-- End NPC

-- NPC 2

Citizen.CreateThread(function()
    modelHash = GetHashKey("a_m_m_farmer_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
       	Wait(1)
    end
    crearNPCProcesado()
end)

crearNPCProcesado = function()
    local npcProcesado = {x = 413.05, y = 6539.41, z = 27.73, rotacion = 7.96}
    negrata = CreatePed(5, modelHash , npcProcesado.x, npcProcesado.y, npcProcesado.z - 1, npcProcesado.rotacion, npcProcesado.NetworkSync, npcProcesado.NetworkSync)
	FreezeEntityPosition(negrata, true)
	SetEntityInvincible(negrata, true)
	SetBlockingOfNonTemporaryEvents(negrata, true)
	TaskStartScenarioInPlace(negrata, "world_human_drug_dealer_hard", 0, true)
end

-- End NPC 2

-- NPC 3

Citizen.CreateThread(function()
    modelHash = GetHashKey("a_m_m_farmer_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
       	Wait(1)
    end
    crearNPCVenta()
end)

crearNPCVenta = function()
    local npcVenta = {x = 417.01, y = 6520.78, z = 27.71, rotacion = 260.05}
    negrata = CreatePed(5, modelHash , npcVenta.x, npcVenta.y, npcVenta.z - 1, npcVenta.rotacion, npcVenta.NetworkSync, npcVenta.NetworkSync)
	FreezeEntityPosition(negrata, true)
	SetEntityInvincible(negrata, true)
	SetBlockingOfNonTemporaryEvents(negrata, true)
	TaskStartScenarioInPlace(negrata, "world_human_drug_dealer_hard", 0, true)
end

-- End NPC 3

Notification = function(msg, coords)
	AddTextEntry('esxFloatingHelpNotificationfruta', msg)
	SetFloatingHelpTextWorldPosition(1, coords)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp('esxFloatingHelpNotificationfruta')
	EndTextCommandDisplayHelp(2, false, false, -1)
end

IsJobTrue = function()
    if PlayerData ~= nil then
        local IsJobTrue = false
        if PlayerData.job ~= nil and PlayerData.job.name == 'frutero' then
            IsJobTrue = true
        end
        return IsJobTrue
    end
end

-- Blips

addBlip = function(coords, sprite, colour, text, scale)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipScale(blip, scale)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
end

addZone = function(coords, text)
    zoneblip = AddBlipForRadius(coords, 21.0)
    SetBlipSprite(zoneblip,9)
    SetBlipColour(zoneblip,69)
    SetBlipAlpha(zoneblip,100)
    AddTextComponentString(text)
end

Citizen.CreateThread(function()
    addBlip(vector3(411.47, 6514.4, 27.89), 23, 6, 'Procesado de fruta', 0.90)
    addBlip(vector3(410.2, 6535.65, 27.88), 266, 30, 'Venta de fruta', 0.90)
    addBlip(vector3(410.56, 6527.51, 27.88), 480, 42, 'Vestuario y herramientas de Frutero', 0.90)
    --addZone(vector3(362.62, 6518.8, 28.3), 'Recogida de fruta')
end)

-- End blips