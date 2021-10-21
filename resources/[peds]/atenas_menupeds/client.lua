ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
	end
end)


Citizen.CreateThread(function()
	CheckSteam()
    while true do 
        Wait(150)
    end
end)

CheckSteam = function()
  checked = nil
  TriggerServerEvent('peds:checked')
  while (checked == nil) do
      Citizen.Wait(1)
  end
end


function AbrirMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'menu', -- Replace the menu name
  {
    title    = ("Peds - Atenas"),
    align = 'bottom-right', 
    elements = { 
      {label = ('Andrea'),     value = 'andrea'},
      {label = ('Child'),     value = 'child'},
      {label = ('Dante'),     value = 'dante'},
      {label = ('Nene'),     value = 'nene'},
      {label = ('Nene1'),     value = 'nene1'},
      {label = ('Dantwbrown'),     value = 'dantwbrown'},
      {label = ('Jxro'),     value = 'dani'},
      {label = ('Pove'),     value = 'pove'}
    }
  },
  function(data, menu)
    if data.current.value == 'andrea' then
      TriggerEvent('andrea')
    end
    if data.current.value == 'child' then
      TriggerEvent('child')
    end         
    if data.current.value == 'dante' then
      TriggerEvent('dante')
    end       
    if data.current.value == 'nene' then
      TriggerEvent('nene')
    end    
    if data.current.value == 'nene1' then
      TriggerEvent('nene1')
    end   
    if data.current.value == 'Nc_Pepe' then
      TriggerEvent('Nc_Pepe')
    end    
    if data.current.value == 'dantwbrown' then
      TriggerEvent('dantwbrown')
    end 
    if data.current.value == 'dani' then
      TriggerEvent('dani')
    end 
    if data.current.value == 'pove' then
      TriggerEvent('pove')
    end     
  end,
  function(data, menu)
      menu.close() 
  end
)
end


RegisterNetEvent('peds:checkid')
AddEventHandler('peds:checkid', function(state)
  checked = state 
end)


RegisterCommand("peds", function() 
  if checked then 
    AbrirMenu()
  elseif not checked then 
    ESX.ShowNotification('No tienes permisos para ver esto')
    end 
end)


RegisterNetEvent('andrea')
AddEventHandler('andrea', function()
local ped = 'Andrea'
local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
    end)

RegisterNetEvent('child')
AddEventHandler('child', function()
local ped = 'Child'
local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
      SetPlayerModel(PlayerId(), hash)
    end)
    
RegisterNetEvent('dante')
AddEventHandler('dante', function()
local ped = 'Dante'
local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

RegisterNetEvent('dani')
AddEventHandler('dani', function()
local ped = 'Dani'
local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

RegisterNetEvent('nene')
AddEventHandler('nene', function()
local ped = 'Nene'
local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

RegisterNetEvent('nene1')
AddEventHandler('nene1', function()
local ped = 'Nene1'
local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

    RegisterNetEvent('dantwbrown')
AddEventHandler('dantwbrown', function()
local ped = 'Dantwbrown'
local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

RegisterNetEvent('Nc_Pepe')
AddEventHandler('Nc_Pepe', function()
local ped = 'Pepe'
local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

RegisterNetEvent('pove')
AddEventHandler('pove', function()
local ped = 'Pove'
local hash = GetHashKey(ped)
  RequestModel(hash)
  while not HasModelLoaded(hash)
      do RequestModel(hash)
        Citizen.Wait(0)
      end	
      SetPlayerModel(PlayerId(), hash)
    end)
    
    
    
    