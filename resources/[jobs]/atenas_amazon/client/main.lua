--Variables
ESX = nil
Data = nil
AllDone = false
X = {}
X.IsInJob = false
X.HaveTakenThePackage = false
X.IsCarrying = false
X.Charge = false
X.VehiclePos = nil
X.Destination = nil
X.Distance = 0
X.IsAborted = false
X.IsAbortedTwo = false
X.Blip = nil
X.State = nil
X.DonDePalabra = false
X.ActualPakcages = 0

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

--Events listenners
AddEventHandler('playerSpawned', function(spawn)
	TriggerServerEvent('tm1_package:initializer')
end)
TriggerServerEvent('tm1_package:initializer')

--Registrar eventos
RegisterNetEvent('tm1_package:initializer')

--Declaración de eventos
AddEventHandler('tm1_package:initializer', function(data)
    Data = data
end)


--Funciones
function createNPC(model, coords)
	model           = (tonumber(model) ~= nil and tonumber(model) or GetHashKey(model))
	local x = coords.x
	local y = coords.y
	local z = coords.z
	local h = coords.h

	Citizen.CreateThread(function()

		local model = 1644266841

		RequestModel(model)

		while not HasModelLoaded(model) do
			Citizen.Wait(1)
		end

		ped = CreatePed(5, model, x, y, z, h, false, false)

		--[[
		SetPedComponentVariation(ped, 0, 42,  0, 2)
		SetPedComponentVariation(ped, 1, 114,  6, 2) 
		SetPedComponentVariation(ped, 2, 13,  4, 0)
		SetPedHairColor(ped, 3, 4) 
		SetPedComponentVariation(ped, 3, 52,  0, 2)
		SetPedComponentVariation(ped, 4, 15, 3, 2)
		SetPedComponentVariation(ped, 6, 24, 0, 2)
		SetPedComponentVariation(ped, 8, 132, 0, 2)
		SetPedComponentVariation(ped, 11, 245, 0, 2)
		]]--
      	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true);

		FreezeEntityPosition(ped,true)
		SetEntityInvincible(ped, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
	end)
end

function Get3DDistance(x1, y1, z1, x2, y2, z2)
	local a = (x1 - x2) * (x1 - x2)
	local b = (y1 - y2) * (y1 - y2)
	local c = (z1 - z2) * (z1 - z2)
    return math.sqrt(a + b + c)
end

function DrawText3D(coords, text, size, option)
    local onScreen, x, y
    if option == 'npc' then 
        onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z + 2)
    else
        onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)
    end

	
	local camCoords      = GetGameplayCamCoords()
	local dist           = GetDistanceBetweenCoords(camCoords, coords.x, coords.y, coords.z, true)
	local size           = size

	if size == nil then
		size = 1
	end

	local scale = (size / dist) * 2
	local fov   = (1 / GetGameplayCamFov()) * 100
	local scale = scale * fov

	if onScreen then
		SetTextScale(0.0 * scale, 0.55 * scale)
		SetTextFont(0)
		SetTextColour(255, 255, 255, 255)
		SetTextDropshadow(0, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry('STRING')
		SetTextCentre(1)

		AddTextComponentString(text)
		DrawText(x, y)
	end
end

function LoadAnim(animDict)
	RequestAnimDict(animDict)

	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(10)
	end
end

function LoadModel(model)
	RequestModel(model)

	while not HasModelLoaded(model) do
		Citizen.Wait(10)
	end
end


X.DrawMarker = function(typeOfMarker,x,y,z,r,g,b,sizeX,sizeY,SizeZ)
	DrawMarker(typeOfMarker, x, y, z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, sizeX,sizeY,SizeZ, r,g,b, 100, false, true, 2, true, false, false, false)
end

X.createJob = function()
	local elements = {
		{value = 'yes', label = '<span style="color: yellow;">Aceptar</span>'},
		{value = 'getMoney', label = '<span style="color: green;">Cobrar</span>'},
		{value = 'no', label = '<span style="color: red;">Rechazar</span>'}
	}
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'warehouse', {
		title    = 'Recoger entrega',
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		if X.IsCarrying == true then
			ESX.ShowNotification('Primero suelta el paquete para hablar conmigo.')
		else
			if data.current.value == 'yes' and X.IsInJob == false then
				local vehicle, distance = ESX.Game.GetClosestVehicle(Config.Points['spawner'])
				if distance > 4.0 then
					if Config.IsMyClothActive == true then
						X.PutUniform('work')
					end
					ESX.ShowNotification('Aquí tienes el trabajo, ve a la puerta para recoger el paquete y mételo en tu furgoneta.')
					X.JobCar()
					X.IsInJob = true
					menu.close()
				else
					ESX.ShowNotification('Hay un vehículo cerca del spawn')
				end
			elseif data.current.value == 'yes' and X.IsInJob == true then
				ESX.ShowNotification('Primero tienes que acabar el trabajo.')
				menu.close()
			elseif data.current.value == 'getMoney' then
				TriggerServerEvent('tm1_package:earn', Data)
				menu.close()
			else
				X.IsInJob = false
				if Config.IsMyClothActive == true then
					X.PutUniform('cloth')
				end
				ESX.ShowNotification('Nos vemos en otro momento.')
				X.ActualPakcages = 0
				menu.close()
			end
		end
	end,
	function(data, menu)
		menu.close()
	end
	)
end

X.JobCar = function()
	ESX.Game.SpawnVehicle(Config.Vehicle, Config.Points['spawner'], nil, function(vehicle)
		Citizen.CreateThread(function()
			while true do
				Citizen.Wait(0)
				if X.IsInJob == true then
					local playerPed = PlayerPedId()
					local coords    = GetEntityCoords(playerPed)
					local pos = GetEntityCoords(vehicle)
					X.VehiclePos = pos
					local distance = Get3DDistance(pos.x,pos.y, pos.z,coords.x, coords.y, coords.z)
					if distance < 10.0 and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
						if X.Charge == false then
							ESX.Game.Utils.DrawText3D(pos, "[~r~Sin carga~w~] ["..X.ActualPakcages.."/"..Config.MaxPackages.."] Pulsa E para meter una carga", 0.4)
						else
							ESX.Game.Utils.DrawText3D(pos, "[~g~Con carga~w~] ["..X.ActualPakcages.."/"..Config.MaxPackages.."] Pulsa E para coger la carga", 0.4)
						end
						if distance < 2.0 then
							if IsControlJustPressed(0, 38) then
								if X.Charge == true and X.IsCarrying == false then
									X.ActualPakcages = X.ActualPakcages - 1
									X.HavePackage()
									if X.ActualPakcages == 0 then
										X.Charge = false
									end
								elseif X.Charge == false and X.IsCarrying == false then
									ESX.ShowNotification('Tienes que tener una carga para coger un paquete.')
								end
							end
						end
					end
				else
					ESX.Game.DeleteVehicle(vehicle)
					break
				end
			end
		end)
	end)
end

X.HavePackage = function()
	Citizen.CreateThread(function()
		LoadModel("prop_cs_cardbox_01")
		local package = CreateObject(GetHashKey("prop_cs_cardbox_01"), Config.Points['warehouse'].x, Config.Points['warehouse'].y, Config.Points['warehouse'].z, true)
		PlaceObjectOnGroundProperly(package)
		if DoesEntityExist(package) then
			AttachEntityToEntity(package, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
			ClearPedTasks(PlayerPedId())
		end
		LoadAnim("anim@heists@box_carry@")
		X.IsCarrying = true

		while X.IsCarrying == true do
			Citizen.Wait(0)

			DisableControlAction(0, 23, true)
			DisableControlAction(0, 22, true)
			DisableControlAction(0, 21, true)

			if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 3) then
				TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
			end

			if not IsEntityAttachedToEntity(package, PlayerPedId()) then
				X.IsCarrying = false
				DeleteEntity(package)
			else
				local DeliverPosition = X.VehiclePos
				local PedPosition = GetEntityCoords(PlayerPedId())
				local DistanceCar = GetDistanceBetweenCoords(PedPosition, DeliverPosition["x"], DeliverPosition["y"], DeliverPosition["z"], true)
				local DistanceDest = GetDistanceBetweenCoords(PedPosition, X.Destination.x, X.Destination.y, X.Destination.z, true)
	
				if DistanceCar <= 2.0 then
					if IsControlJustPressed(0, 38) then
						ESX.Game.DeleteObject(package)
						DeleteEntity(package)
						while DoesEntityExist(package) do 
							Citizen.Wait(0)
							DeleteEntity(package)
						end
						ClearPedTasksImmediately(PlayerPedId())
						X.Charge = true
						X.ActualPakcages = X.ActualPakcages + 1
						Citizen.Wait(200)
						X.IsCarrying = false
					end
				elseif DistanceDest <= 2.0 then
					if IsControlJustPressed(0, 38) then
						ESX.Game.DeleteObject(package)
						DeleteEntity(package)
						while DoesEntityExist(package) do 
							Citizen.Wait(0)
							DeleteEntity(package)
						end
						X.RemoveBlip()
						ClearPedTasksImmediately(PlayerPedId())
						ESX.ShowNotification('Paquete ~g~entregado. ~w~')
						SetNewWaypoint(Config.Points['warehouse'].x,Config.Points['warehouse'].y)
						if X.ActualPakcages == 0 then 
							X.Destination = nil
							ESX.ShowNotification('Vuelve al centro')
						else
							X.GetJob()
							ESX.ShowNotification('Ve a la siguiente casa')
						end
						TriggerServerEvent('tm1_package:destinationCompleted', X.Distance, Data)
						X.IsCarrying = false
					end
				end

				if X.IsAborted == true then
					ESX.ShowNotification('Paquete ~r~devuelto')
					ESX.Game.DeleteObject(package)
					DeleteEntity(package)
					while DoesEntityExist(package) do 
						Citizen.Wait(0)
						DeleteEntity(package)
					end
					ClearPedTasksImmediately(PlayerPedId())
					if X.ActualPakcages == 0 then 
						X.Destination = nil
					end
					X.IsCarrying = false
				end

				if X.IsAbortedTwo == true then
					ESX.ShowNotification('Paquete ~r~perdido')
					ESX.Game.DeleteObject(package)
					DeleteEntity(package)
					while DoesEntityExist(package) do 
						Citizen.Wait(0)
						DeleteEntity(package)
					end
					ClearPedTasksImmediately(PlayerPedId())
					X.Destination = nil
					X.IsCarrying = false
				end
			end
		end
	end)
end

X.CreateBlip = function()
	X.Blip = AddBlipForCoord(X.Destination.x,X.Destination.y, X.Destination.z)
	SetBlipSprite(X.Blip, 1)
	SetNewWaypoint(X.Destination.x,X.Destination.y)
end

X.RemoveBlip = function()
	RemoveBlip(X.Blip)
end

X.ChangeState = function()
	if X.State == 1 and X.IsCarrying == true then
		X.RemoveBlip()
		X.IsAbortedTwo = true
		Citizen.Wait(10)
		X.IsAbortedTwo = false
	end
end

X.GetJob = function()
	local random = math.random(1, #Config.Destinations)
	X.Destination = Config.Destinations[random]
	X.CreateBlip()
	X.Distance = Get3DDistance(Config.Points['warehouse'].x, Config.Points['warehouse'].y, Config.Points['warehouse'].z,X.Destination.x, X.Destination.y, X.Destination.z)
end

X.PutUniform = function(option)
	if option == 'work' then
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
			if skin.sex == 0 then
				TriggerEvent('skinchanger:change', 'tshirt_1', 132)
				TriggerEvent('skinchanger:change', 'tshirt_2', 0)
				TriggerEvent('skinchanger:change', 'torso_1', 245)
				TriggerEvent('skinchanger:change', 'torso_2', 0)
				TriggerEvent('skinchanger:change', 'arms', 53)
				TriggerEvent('skinchanger:change', 'pants_1', 15)
				TriggerEvent('skinchanger:change', 'pants_2', 3)
				TriggerEvent('skinchanger:change', 'shoes_1', 61)
				TriggerEvent('skinchanger:change', 'shoes_2', 0)
				TriggerEvent('skinchanger:change', 'chain_1', 18)
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
	elseif option == 'cloth' then
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
		end)
	end
end

Citizen.CreateThread(function()
    for k,v in pairs(Config.Blips) do
        local blip = AddBlipForCoord(v.coords)

        SetBlipSprite (blip, v.id)
        SetBlipDisplay(blip, v.display)
        SetBlipScale  (blip, 1.0)
        SetBlipColour (blip, v.colour)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(v.name)
        EndTextCommandSetBlipName(blip)
    end
end)

--Hilos
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    ESX.PlayerData = ESX.GetPlayerData()

    for i,v in ipairs(Config.NPCs) do
        createNPC(v.hash, v.coords)
	end
	
	if IsEntityDead(GetPlayerPed(-1)) then
		X.State = 1
	else
		X.State = 0
	end

    AllDone = true
end)

Citizen.CreateThread(function()
	while AllDone == false do Citizen.Wait(0) end
	Citizen.Wait(500)
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)
        
		--NPCs
		
        for i,v in ipairs(Config.NPCs) do
            if Get3DDistance(v.coords.x, v.coords.y, v.coords.z, coords.x, coords.y, coords.z) < v.distance then
                DrawText3D(v.coords, v.text, 1, 'npc')
				if IsControlJustReleased(1,38) then
					if ESX.PlayerData.job.name == "amazon" then
						X[v.func]()
					else
						ESX.ShowNotification("No eres trabajador de Amazon.")
					end
                end
            end
        end

		if X.IsInJob == true and X.HaveTakenThePackage == false then
			local distance = Get3DDistance(Config.Points['warehouse'].x, Config.Points['warehouse'].y, Config.Points['warehouse'].z,coords.x, coords.y, coords.z)
			if distance < 50.0 then
				X.DrawMarker(2,Config.Points['warehouse'].x, Config.Points['warehouse'].y, Config.Points['warehouse'].z,255,255,0,1.0,1.0,1.0)
				if distance < 3.0 then
					ESX.ShowHelpNotification('Pulsa ~o~E ~w~para coger o dejar el paquete.')
					if IsControlJustReleased(1,38) then
						if X.IsCarrying == false then
							if not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
								if X.ActualPakcages <= 4 then
									if X.ActualPakcages < 1 then
										X.GetJob()
									end
									X.HavePackage()
								else
									ESX.ShowNotification('No te caben más paquetes en la furgoneta.')
								end
							else
								ESX.ShowNotification('Sal del vehículo')
							end
						else
							if X.ActualPakcages >= 1 then
								X.IsAborted = true
								Citizen.Wait(10)
								X.IsAborted = false
							else
								X.RemoveBlip()
								X.IsAborted = true
								Citizen.Wait(10)
								X.IsAborted = false
							end
						end
					end
				end
			end
		end
		
		if X.Destination then
			local distance = Get3DDistance(X.Destination.x, X.Destination.y, X.Destination.z,coords.x, coords.y, coords.z)
			if distance < 50.0 then
				X.DrawMarker(2,X.Destination.x, X.Destination.y, X.Destination.z,255,255,0,1.0,1.0,1.0)
				if distance < 3.0 then
					ESX.ShowHelpNotification('Punto de ~y~entrega.')
				end
			end
		end

		local lastState = X.State

		if IsEntityDead(GetPlayerPed(-1)) then
			X.State = 1
		else
			X.State = 0
		end

		if not(lastState == X.State) then
			if X.IsInJob == true then
				X.ChangeState()
			end
		end
    end
end)