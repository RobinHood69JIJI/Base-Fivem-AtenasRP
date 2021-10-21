ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('es:invalidCommandHandler', function(source, command_args, user)
	CancelEvent()
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', _U('unknown_command', command_args[1]) } })
end)


RegisterCommand('msg', function(source, args, user)

	if GetPlayerName(tonumber(args[1])) then
		local player = tonumber(args[1])
		table.remove(args, 1)
		
		TriggerClientEvent('chat:addMessage', player, {args = {"^5[MSG] "..GetPlayerName(source).. " [" .. source .. "] : ^7" ..table.concat(args, " ")}, color = {255, 255, 255}})
		TriggerClientEvent('chat:addMessage', source, {args = {"^1[MSG] a  ^4"..GetPlayerName(player).. "^6 [" .. player .. "] ^3[mensaje]: ^0" ..table.concat(args, " ")}, color = {255, 153, 0}})

	else
		TriggerClientEvent('chatMessage', source, "SISTEMA", {255, 0, 0}, "ID de jugador incorrecta!")
	end

end,false)

RegisterCommand('taxi', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "taxi" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('taxi_prefix', name), args }, color = { 255, 227, 51 } })

	end
end, false)

RegisterCommand('ayuda', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('ayuda_prefix', '['..source..'] '), args }, color = { 255, 0, 0 } })
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('meca', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "mechanic" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('samir_prefix', name), args }, color = { 255, 255, 255 } })

	end
end, false)

RegisterCommand('pol', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "police" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('pol_prefix', name), args }, color = { 94, 161, 224 } })

	end
end, false)

RegisterCommand('ems', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "ambulance" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('ems_prefix', name), args }, color = { 255, 51, 51 } })

	end
end, false)

RegisterCommand('me', function(playerId, args, rawCommand)
	rawCommand = string.sub(rawCommand, 3)
	local name = GetCharacterName(playerId)
	local id_label = " ["..playerId.."]"
	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('me_prefix', name..id_label), rawCommand, { 31, 206, 137 })
end, false)

RegisterCommand('oop', function(playerId, args, rawCommand)
	rawCommand = string.sub(rawCommand, 3)
	local name = GetPlayerName(playerId)
	local id_label = " ["..playerId.."]"
	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('oop_prefix', name..id_label), rawCommand, { 232, 40, 212 })
end, false)

ESX.RegisterCommand('giveskinmenu', 'admin', function(xPlayer, args, showError)
    args.playerId.triggerEvent('esx_skin:openSaveableMenu')
    args.playerId.triggerEvent('chat:addMessage', {args = {'[^1AVISO^0]', 'Un administrador te dio el skin menu.'}})
end, true, {help = 'Dale el menu de la skin al jugador o a ti mismo con "/giveskinmenu me"', validate = true, arguments = {
    {name = 'playerId', help = 'ID', type = 'player'}
}})

RegisterCommand('do', function(playerId, args, rawCommand)
	rawCommand = string.sub(rawCommand, 3)
	local name = GetCharacterName(playerId)
	local id_label = " ["..playerId.."]"
	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('do_prefix', name..id_label), rawCommand, { 0, 0, 255 })
end, false)

RegisterCommand('dados', function(playerId, args, rawCommand)
	local name = GetPlayerName(playerId)
	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, "Dados "..name.." | El resutlado es : ", math.random(1,6), { 255, 0, 0 })
end, false)

RegisterCommand('twt', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if true then name = GetCharacterName(source) end
	local id_label = " ["..source.."]"
	
	TriggerClientEvent('chat:addMessage', -1, { args = { _U('twt_prefix', ' '..name..id_label), args }, color = { 0, 153, 204 } }, source)
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('anon', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	local id_label = "["..source.."]"
	
	TriggerClientEvent('chat:addMessage', -1, { args = { _U('anon_prefix', ' '..id_label), args }, color = { 255, 0, 0 } }, source)
	--print(('%s: %s'):format(name, args))
end, false)

function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] and result[1].firstname and result[1].lastname then
		if Config.OnlyFirstname then
			return result[1].firstname
		else
			return ('%s %s'):format(result[1].firstname, result[1].lastname)
		end
	else
		return GetPlayerName(source)
	end
end
local logEnabled = true

function DrawOnHead(playerid, text, color)
	TriggerClientEvent('esx_rpchat:drawOnHead', -1, text, color, playerid)
end

AddEventHandler('chatMessage', function(source, name, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		if Config.EnableESXIdentity then name = GetPlayerName(source) end
		local id_label = " ["..source.."]"
		TriggerClientEvent('chat:addMessage', -1, { args = { _U('ooc_prefix', ' '..name.. id_label), message }, color = { 128, 128, 128 } }, source)
	end
end)