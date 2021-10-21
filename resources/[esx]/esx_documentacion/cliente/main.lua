local open = false
ESX                           = nil
local Licenses 				= {}


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

-- Open ID card
RegisterNetEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function( data, type, msg )
	open = true
	SendNUIMessage({
		action = "open",
		array  = data,
		type   = type
	})
end)

function SetCurrentZoneType(type)
CurrentZoneType = type
end

-- Key events
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
			SendNUIMessage({
				action = "close"
			})
			open = false
		end
		
	end
end)

function openMenuID()
  ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'id_card_menu',
	{
		title    = 'Menú Personal',
		align = 'bottom-right',
		elements = {
			{label = 'Ver identidad', value = 'checkID'},
			{label = 'Mostrar identidad', value = 'showID'},
			{label = 'Ver licencia de conducir', value = 'checkDriver'},
			{label = 'Mostrar licencia de conducir', value = 'showDriver'},
			{label = 'Ver licencia de armas', value = 'checkFirearms'},
			{label = 'Mostrar licencia de armas', value = 'showFirearms'},
		}
	},
	function(data, menu)
		local val = data.current.value
		
		if val == 'checkID' then
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
		elseif val == 'checkDriver' then
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
		elseif val == 'checkFirearms' then
			local ownedLicenses 				= {}
			local _source = source
			
			for i = 1, #Licenses, 1 do
				ownedLicenses[Licenses[i].type] = true
			end
			
			local elements = {}
			
			if ownedLicenses['weapon'] or ownedLicenses['weapon2'] then
				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
			else
				ShowNotification("Usted no tiene licencia tendencia de armas")
				ExecuteCommand("do Se veria al sujeto mirando en sus bolsillos pero finalmente no encontraría nada....")
			end
			
		else
			local player, distance = ESX.Game.GetClosestPlayer()
			
			if distance ~= -1 and distance <= 3.0 then
				if val == 'showID' then
				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
				elseif val == 'showDriver' then
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
				elseif val == 'showFirearms' then
					local ownedLicenses 				= {}
					local _source = source
					
					for i = 1, #Licenses, 1 do
						ownedLicenses[Licenses[i].type] = true
					end
					
					local elements = {}
					
					if ownedLicenses['weapon'] or ownedLicenses['weapon2'] then
						TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
					else
						ShowNotification("Usted no tiene tendencia de armas")
					end
				end
			else
			  ESX.ShowNotification('No hay jugadores cerca')
			end
		end
	end,
	function(data, menu)
		menu.close()
	end
)
end


function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end