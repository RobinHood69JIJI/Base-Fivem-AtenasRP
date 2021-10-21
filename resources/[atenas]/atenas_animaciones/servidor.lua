ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('vaini_animaciones:cojertrabajo')
AddEventHandler('vaini_animaciones:cojertrabajo',function()
	local source = source
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayers[i] == source then
			TriggerClientEvent('vaini_animaciones:dartrabajo',xPlayers[i],xPlayer.job.name)
		end
	end
end)