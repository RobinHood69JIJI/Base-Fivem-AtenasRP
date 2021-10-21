ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('pop_pizzero:propina')
AddEventHandler('pop_pizzero:propina',function(propina)
	local xPlayer = ESX.GetPlayerFromId(source)
	local rasin = " Intenta darse mucho dinero el pedazo de payaso"
	if propina > 3000 then
        TriggerEvent('CarlosLR-AC:BanMenu', source, rasin)
    else
		xPlayer.addMoney(propina)
    end
end)