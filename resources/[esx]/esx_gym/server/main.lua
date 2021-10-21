ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('esx_gym:hireBmx')
AddEventHandler('esx_gym:hireBmx', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 20) then
		xPlayer.removeMoney(20)
			
		notification("Has alquilado una ~g~BMX")
	else
		notification("Has robado una bicicleta porque no tenías ~r~dinero suficiente")
	end	
end)

RegisterServerEvent('esx_gym:hireCruiser')
AddEventHandler('esx_gym:hireCruiser', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 30) then
		xPlayer.removeMoney(30)
			
		notification("Has alquilado una ~g~bicicleta")
	else
		notification("Has robado una bicicleta porque no tenías ~r~dinero suficiente")
	end	
end)

RegisterServerEvent('esx_gym:hireFixter')
AddEventHandler('esx_gym:hireFixter', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 40) then
		xPlayer.removeMoney(40)
			
		notification("Has alquilado una ~g~fixter")
	else
		notification("Has robado una bicicleta porque no tenías ~r~dinero suficiente")
	end	
end)

RegisterServerEvent('esx_gym:hireScorcher')
AddEventHandler('esx_gym:hireScorcher', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 40) then
		xPlayer.removeMoney(40)
			
		notification("Has alquilado una ~g~scorsher")
	else
		notification("Has robado una bicicleta porque no tenías ~r~dinero suficiente")
	end	
end)

RegisterServerEvent('esx_gym:checkChip')
AddEventHandler('esx_gym:checkChip', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local oneQuantity = xPlayer.getInventoryItem('gym_membership').count
	
	if oneQuantity > 0 then
		TriggerClientEvent('esx_gym:trueMembership', source) -- true
	else
		TriggerClientEvent('esx_gym:falseMembership', source) -- false
	end
end)

ESX.RegisterUsableItem('gym_bandage', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('gym_bandage', 1)	
	
	TriggerClientEvent('esx_gym:useBandage', source)
end)

RegisterServerEvent('esx_gym:buyBandage')
AddEventHandler('esx_gym:buyBandage', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 50) then
		xPlayer.removeMoney(50)
		
		xPlayer.addInventoryItem('gym_bandage', 1)		
		notification("Has comprado una ~g~venda")
	else
		notification("No tienes suficiente ~r~dinero")
	end	
end)

RegisterServerEvent('esx_gym:buyMembership')
AddEventHandler('esx_gym:buyMembership', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 10) then
		xPlayer.removeMoney(10)
		
		xPlayer.addInventoryItem('gym_membership', 1)		
		notification("Has contratado la ~g~membresía")
		
		TriggerClientEvent('esx_gym:trueMembership', source) -- true
	else
		notification("No tienes suficiente ~r~dinero")
	end	
end)


RegisterServerEvent('esx_gym:buyProteinshake')
AddEventHandler('esx_gym:buyProteinshake', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 200) then
		xPlayer.removeMoney(200)
		
		xPlayer.addInventoryItem('protein_shake', 1)
		
		notification("Has comprado un ~g~batido de proteína")
	else
		notification("No tienes suficiente ~r~dinero")
	end	
end)

ESX.RegisterUsableItem('protein_shake', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('protein_shake', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido un ~g~batido de proteinas')

end)

RegisterServerEvent('esx_gym:buyWater')
AddEventHandler('esx_gym:buyWater', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 150) then
		xPlayer.removeMoney(150)
		
		xPlayer.addInventoryItem('water', 1)
		
		notification("Has comprado un ~g~agua")
	else
		notification("No tienes suficiente ~r~dinero")
	end		
end)

RegisterServerEvent('esx_gym:buySportlunch')
AddEventHandler('esx_gym:buySportlunch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 250) then
		xPlayer.removeMoney(250)
		
		xPlayer.addInventoryItem('sportlunch', 1)
		
		notification("Has comprado un ~g~barrita energética")
	else
		notification("No tienes suficiente ~r~dinero")
	end		
end)

ESX.RegisterUsableItem('sportlunch', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sportlunch', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido una ~g~barrita energética')

end)

RegisterServerEvent('esx_gym:buyPowerade')
AddEventHandler('esx_gym:buyPowerade', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 250) then
		xPlayer.removeMoney(250)
		
		xPlayer.addInventoryItem('powerade', 1)
		
		notification("Has comprado un ~g~powerade")
	else
		notification("No tienes suficiente ~r~dinero")
	end		
end)

ESX.RegisterUsableItem('powerade', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('powerade', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 300000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido un ~g~powerade')

end)

-- FUNCTIONS IN THE FUTURE (COMING SOON...)

--RegisterServerEvent('esx_gym:trainArms')
--AddEventHandler('esx_gym:trainArms', function()
	
--end)

--RegisterServerEvent('esx_gym:trainChins')
--AddEventHandler('esx_gym:trainArms', function()
	
--end)

--RegisterServerEvent('esx_gym:trainPushups')
--AddEventHandler('esx_gym:trainPushups', function()
	
--end)

--RegisterServerEvent('esx_gym:trainYoga')
--AddEventHandler('esx_gym:trainYoga', function()
	
--end)

--RegisterServerEvent('esx_gym:trainSitups')
--AddEventHandler('esx_gym:trainSitups', function()
	
--end)

function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end
