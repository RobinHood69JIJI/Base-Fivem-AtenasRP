ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_banco:deposit')
AddEventHandler('esx_banco:deposit', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	amount = tonumber(amount)

	if not tonumber(amount) then return end
	amount = ESX.Math.Round(amount)

	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		xPlayer.showNotification(_U('invalid_amount'))
	else
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', amount)
		xPlayer.showNotification(_U('deposit_money', amount))
	end
end)

RegisterServerEvent('esx_banco:withdraw')
AddEventHandler('esx_banco:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	amount = tonumber(amount)
	local accountMoney = xPlayer.getAccount('bank').money

	if not tonumber(amount) then return end
	amount = ESX.Math.Round(amount)

	if amount == nil or amount <= 0 or amount > accountMoney then
		xPlayer.showNotification(_U('invalid_amount'))
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
		xPlayer.showNotification(_U('withdraw_money', amount))
	end
end)
