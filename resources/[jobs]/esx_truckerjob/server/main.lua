ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_truckATENASerjob:pay')
AddEventHandler('esx_truckATENASerjob:pay', function(payment)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addMoney(tonumber(payment))
end)