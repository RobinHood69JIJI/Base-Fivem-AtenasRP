ESX = nil
local Users = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_thief:getValue', function(source, cb, targetSID)
	if Users[targetSID] then
		cb(Users[targetSID])
	else
		cb({value = false, time = 0})
	end
end)

ESX.RegisterServerCallback('esx_thief:getOtherPlayerData', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	local data = {
		name = GetPlayerName(target),
		inventory = xPlayer.inventory,
		accounts = xPlayer.accounts,
		money = xPlayer.getMoney(),
		weapons = xPlayer.loadout
	}

	cb(data)
end)

RegisterNetEvent('esx_thief:stealPlayerItem')
AddEventHandler('esx_thief:stealPlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if itemType == 'item_standard' then

		local label = sourceXPlayer.getInventoryItem(itemName).label
		local canCarry = sourceXPlayer.canCarryItem(itemName, amount)
		local sourceItemCount = sourceXPlayer.getInventoryItem(itemName).count
		local targetItemCount = targetXPlayer.getInventoryItem(itemName).count

		if amount > 0 and targetItemCount >= amount then
			if canCarry then
				targetXPlayer.removeInventoryItem(itemName, amount)
				sourceXPlayer.addInventoryItem(itemName, amount)

				TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_stole') .. ' ~g~x' .. amount .. ' ' .. label .. ' ~w~' .. _U('from_your_target') )
				TriggerClientEvent('esx:showNotification', targetXPlayer.source, _U('someone_stole') .. ' ~r~x'  .. amount .. ' ' .. label )
				local persona = GetPlayerName(_source)
								local otra = GetPlayerName(target)
								local msj = '['..persona..'] Ha robado con menu de G a ['..otra..'] \n Item:'..itemName..' \n Cantidad:'..amount
								TriggerEvent('discordlogsnowi:sendToDiscordsnowi8', 'ROBO CON LA G', msj)
			else
				TriggerClientEvent('esx:showNotification', targetXPlayer.source, _U('ex_inv_lim_target'))
				TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('ex_inv_lim_source'))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('invalid_quantity'))
		end

	elseif itemType == 'item_money' then

		if amount > 0 and targetXPlayer.getMoney() >= amount then
			targetXPlayer.removeMoney(amount)
			sourceXPlayer.addMoney(amount)

			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_stole') .. ' ~g~$' .. amount .. ' ~w~' .. _U('from_your_target') )
			TriggerClientEvent('esx:showNotification', targetXPlayer.source, _U('someone_stole') .. ' ~r~$'  .. amount )
		else
			TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_amount'))
		end

	elseif itemType == 'item_account' then

		if amount > 0 and targetXPlayer.getAccount(itemName).money >= amount then
			targetXPlayer.removeAccountMoney(itemName, amount)
			sourceXPlayer.addAccountMoney(itemName, amount)

			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_stole') .. ' ~g~$' .. amount .. ' ~w~' .. _U('of_black_money') .. ' ' .. _U('from_your_target') )
			TriggerClientEvent('esx:showNotification', targetXPlayer.source, _U('someone_stole') .. ' ~r~$'  .. amount .. ' ~w~' .. _U('of_black_money') )
		else
			TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_amount'))
		end

	elseif itemType == 'item_weapon' then

		if (targetXPlayer.hasWeapon(itemName)) then
			targetXPlayer.removeWeapon(itemName)
			sourceXPlayer.addWeapon(itemName, amount)
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Has robado ' .. ESX.GetWeaponLabel(itemName) .. ' de ' .. targetXPlayer.name)
			TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. ' te ha robado ' .. ESX.GetWeaponLabel(itemName))
		else
			print('[' .. GetCurrentResourceName() .. ']: El jugador (' .. sourceXPlayer.getIdentifier() .. ') ' .. sourceXPlayer.getName() .. ' ha intentado robar al jugador (' .. targetXPlayer.getIdentifier() .. ') ' .. targetXPlayer.getName() .. ' un ' .. ESX.GetWeaponLabel(itemName) .. ' que no poseia!')
		end

	end
end)

RegisterNetEvent('esx_thief:update')
AddEventHandler('esx_thief:update', function(bool)
	local _source = source
	Users[_source] = {value = bool, time = os.time()}
end)

RegisterNetEvent('esx_thief:getValue')
AddEventHandler('esx_thief:getValue', function(targetSID)
	local _source = source
	if Users[targetSID] then
		TriggerClientEvent('esx_thief:returnValue', _source, Users[targetSID])
	else
		TriggerClientEvent('esx_thief:returnValue', _source, Users[targetSID])
	end
end)