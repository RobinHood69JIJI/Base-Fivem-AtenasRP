ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- menu de admin by shr

ESX.RegisterServerCallback('admin:grupo', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local grupo = xPlayer.getGroup()
    cb(grupo)
end)


RegisterServerEvent('Zod-Admin:delallveh')
AddEventHandler('Zod-Admin:delallveh', function()
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('Zod-Admin:delallveh', -1)
    end
    TriggerEvent('Zod-Admin:SendDiscordLogs','adminlogs', ConfigServer.LanguageSv["logveh"], 'green', ConfigServer.LanguageSv["theadmin"]..'**'..GetPlayerName(source)..'** '..ConfigServer.LanguageSv["delallveh"]..'' , false)  --You can put true for @everyone.
end, false)


RegisterServerEvent('Zod-Admin:delallobj')
AddEventHandler('Zod-Admin:delallobj', function()
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('Zod-Admin:delallobj', -1)
    end
    TriggerEvent('Zod-Admin:SendDiscordLogs','adminlogs', ConfigServer.LanguageSv["logobj"], 'green', ConfigServer.LanguageSv["theadmin"]..'**'..GetPlayerName(source)..'** '..ConfigServer.LanguageSv["delallobj"]..'' , false)
end, false)


RegisterServerEvent('Zod-Admin:AnnounceServer')
AddEventHandler('Zod-Admin:AnnounceServer', function(Reason)

    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('Zod-Admin:announce', xPlayers[i], Reason)
    end
    TriggerEvent('Zod-Admin:SendDiscordLogs','adminlogs', ConfigServer.LanguageSv["logannounce"], 'green', ConfigServer.LanguageSv["theadmin"]..'**'..GetPlayerName(source)..'** '..ConfigServer.LanguageSv["sendannounce"]..' **'..Reason..'**' , false)

end, false)

RegisterServerEvent('Zod-Admin:delallped')
AddEventHandler('Zod-Admin:delallped', function()
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('Zod-Admin:delallped', -1)
    end
    TriggerEvent('Zod-Admin:SendDiscordLogs','adminlogs', ConfigServer.LanguageSv["logped"], 'green', ConfigServer.LanguageSv["theadmin"]..'**'..GetPlayerName(source)..'** '..ConfigServer.LanguageSv["delallped"]..'' , false)

end, false)

RegisterServerEvent('Zod-Admin:clearchat')
AddEventHandler('Zod-Admin:clearchat', function()
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('Zod-Admin:clearchat', xPlayers[i], -1)
    end

    TriggerEvent('Zod-Admin:SendDiscordLogs','adminlogs', ConfigServer.LanguageSv["logchat"], 'green', ConfigServer.LanguageSv["theadmin"]..'**'..GetPlayerName(source)..'** '..ConfigServer.LanguageSv["delallchat"]..'' , false)

end, false)


ESX.RegisterServerCallback('Zod-Admin:playersonline', function(source, cb)
	local xPlayers = ESX.GetPlayers()
	local players  = {}

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		table.insert(players, {
			source      = xPlayer.source,
			identifier  = xPlayer.getIdentifier(),
            name        = GetPlayerName(xPlayers[i]),
			job         = xPlayer.getJob(),
            group       = xPlayer.getGroup()
		})
	end
	cb(players)
end)


RegisterServerEvent('Zod-Admin:kickPlayer')
AddEventHandler('Zod-Admin:kickPlayer', function(Playerid, name)
    local razon = name
    
    if ConfigServer.MythicSv then 
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = ConfigServer.LanguageSv["kicksv"]..GetPlayerName(Playerid)..' '..ConfigServer.LanguageSv["reasonsv"]..' '..razon..'', style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
    else
        ESX.ShowNotification(ConfigServer.LanguageSv["kicksv"]..GetPlayerName(Playerid)..' '..ConfigServer.LanguageSv["reasonsv"]..' '..razon..'')
        DrawNotification(false, true)
    end

    TriggerEvent('Zod-Admin:SendDiscordLogs','adminlogs', ConfigServer.LanguageSv["logkick"], 'green', ConfigServer.LanguageSv["theadmin"]..'**'..GetPlayerName(source)..'** '..ConfigServer.LanguageSv["kicktoplayer"]..' **'..GetPlayerName(Playerid)..'** '..ConfigServer.LanguageSv["kickreason"]..' **'..razon..'**' , false)
    DropPlayer(Playerid, ConfigServer.LanguageSv["kickreason"]..razon)
end, false)


RegisterServerEvent('Zod-Admin:changename')
AddEventHandler('Zod-Admin:changename', function(Playerid, name, lastname)
	if source ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
            if Playerid and tonumber(Playerid) then
                local targetId = tonumber(Playerid)
                local nombre = name
                local apellido = lastname
                local xTarget = ESX.GetPlayerFromId(targetId)
                local steam = GetPlayerIdentifier(targetId)
                if steam then
                    MySQL.Async.execute(
                        'UPDATE users SET firstname= @first, lastname = @last WHERE identifier=@steam',
                        {
                            ['@steam'] = steam,
                            ['@first'] = nombre,
                            ['@last'] = apellido
                        })
                end
                TriggerEvent('Zod-Admin:SendDiscordLogs','adminlogs', ConfigServer.LanguageSv["logname"], 'green', ConfigServer.LanguageSv["theadmin"]..'**'..GetPlayerName(source)..'** '..ConfigServer.LanguageSv["nametoplayer"]..' **'..GetPlayerName(Playerid)..'** '..ConfigServer.LanguageSv["newname"]..' **'..nombre..' '..apellido..'**' , false)
  
            end
    end
end, false)


RegisterServerEvent('Zod-Admin:GiveMoney')
AddEventHandler('Zod-Admin:GiveMoney', function(Playerid, account, amount)
        local targetId = tonumber(Playerid)
        local xTarget = ESX.GetPlayerFromId(targetId)
    if xTarget ~= nil then   

        if account == 'money' or account == 'bank' or account == 'black_money' then

        xTarget.addAccountMoney(account, tonumber(amount))
      
        TriggerEvent('Zod-Admin:SendDiscordLogs','adminlogs', ConfigServer.LanguageSv["logmoney"], 'green', ConfigServer.LanguageSv["theadmin"]..'**'..GetPlayerName(source)..'** '..ConfigServer.LanguageSv["givemoney"]..' **'..amount..'$** '..ConfigServer.LanguageSv["toplayer"]..' **'..GetPlayerName(targetId)..'** '..ConfigServer.LanguageSv["theaccount"]..' **'..account..'**' , false)
  

        if ConfigServer.MythicSv then 
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = ConfigServer.LanguageSv["give"]..amount..'$ '..ConfigServer.LanguageSv["account"]..' ['..account..'] '..ConfigServer.LanguageSv["toplayer"]..' '..GetPlayerName(targetId)..'', style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
        else
            ESX.ShowNotification(ConfigServer.LanguageSv["give"]..amount..'$ '..ConfigServer.LanguageSv["account"]..' ['..account..'] '..ConfigServer.LanguageSv["toplayer"]..' '..GetPlayerName(targetId)..'')
            DrawNotification(false, true)
        end
    
        else
        
            if ConfigServer.MythicSv then 
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = ConfigServer.LanguageSv["novalid"], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
            else
                ESX.ShowNotification(ConfigServer.LanguageSv["novalid"])
                DrawNotification(false, true)
            end

        end
    else
       print('maybe a hacker.')
    end
end, false)

RegisterServerEvent('Zod-Admin:set_job')
AddEventHandler('Zod-Admin:set_job', function(Playerid, job, grade)
    local targetId = tonumber(Playerid)
    local xTarget = ESX.GetPlayerFromId(targetId)

if ESX.DoesJobExist(job, grade)then   
     xTarget.setJob(job, grade)

     TriggerEvent('Zod-Admin:SendDiscordLogs','adminlogs', ConfigServer.LanguageSv["logjob"], 'green', ConfigServer.LanguageSv["theadmin"]..'**'..GetPlayerName(source)..'** '..ConfigServer.LanguageSv["setjob"]..' **'..job..'** '..ConfigServer.LanguageSv["setgrade"]..' **'..grade..'** '..ConfigServer.LanguageSv["toplayer"]..' **'..GetPlayerName(targetId)..'**' , false)
  
    if ConfigServer.MythicSv then 
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = ''..ConfigServer.LanguageSv["job"]..' ['..job..'] '..ConfigServer.LanguageSv["grade"]..' ('..grade..') '..ConfigServer.LanguageSv["toplayer"]..' '..GetPlayerName(targetId)..' ', style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
    else
        ESX.ShowNotification(ConfigServer.LanguageSv["job"])
        DrawNotification(false, true)
    end

else
    
    if ConfigServer.MythicSv then 
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = ConfigServer.LanguageSv["invalidjob"], style = { ['background-color'] = '#000000', ['color'] = '#f00000' } })
    else
        ESX.ShowNotification(ConfigServer.LanguageSv["invalidjob"])
        DrawNotification(false, true)
    end
end
end, false)


RegisterServerEvent('Zod-Admin:revivePlayer')
AddEventHandler('Zod-Admin:revivePlayer', function(Playerid, name)
    local Playerid = tonumber(Playerid)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent(ConfigServer.TriggerAmbulance, Playerid)

    TriggerEvent('Zod-Admin:SendDiscordLogs','adminlogs', ConfigServer.LanguageSv["logrevive"], 'green', ConfigServer.LanguageSv["theadmin"]..'**'..GetPlayerName(source)..'** '..ConfigServer.LanguageSv["revive"]..' **'..GetPlayerName(Playerid)..'**' , false)
  

    if ConfigServer.MythicSv then 
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = ConfigServer.LanguageSv["revplayerid"]..GetPlayerName(Playerid), style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
    else
        ESX.ShowNotification(ConfigServer.LanguageSv["revplayerid"])
        DrawNotification(false, true)
    end
end, false)


RegisterServerEvent('Zod-Admin:ckplayer')
AddEventHandler('Zod-Admin:ckplayer', function(Playerid, name)
	if source ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
            if Playerid and tonumber(Playerid) then
                local targetId = tonumber(Playerid)
                local xTarget = ESX.GetPlayerFromId(targetId)
                local steam = GetPlayerIdentifier(targetId)
                if steam then
                    MySQL.Async.execute(
                        'DELETE FROM users WHERE identifier = @identifier',
                        {['@identifier'] = steam})
                    MySQL.Async.execute(
                        'DELETE FROM owned_vehicles WHERE owner = @identifier',
                        {['@identifier'] = steam})
                    MySQL.Async.execute(
                        'DELETE FROM addon_account_data WHERE owner = @identifier',
                        {['@identifier'] = steam})
                        MySQL.Async.execute(
                        'DELETE FROM billing  WHERE identifier = @identifier',
                        {['@identifier'] = steam})
                    MySQL.Async.execute(
                        'DELETE FROM addon_inventory_items WHERE owner = @identifier',
                        {['@identifier'] = steam})
                    MySQL.Async.execute(
                        'DELETE FROM datastore_data WHERE owner = @identifier',
                        {['@identifier'] = steam})
                end
                TriggerEvent('Zod-Admin:SendDiscordLogs','adminlogs', ConfigServer.LanguageSv["logck"], 'green', ConfigServer.LanguageSv["theadmin"]..'**'..GetPlayerName(source)..'** '..ConfigServer.LanguageSv["dock"]..' **'..GetPlayerName(Playerid)..'**' , false)
 
            DropPlayer(targetId, 'Ck realizado.')
            end
    end
end, false)


RegisterServerEvent('Ra-Admin:reviveall')
AddEventHandler('Ra-Admin:reviveall', function()
	local xPlayers	= ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent(ConfigServer.TriggerAmbulance, xPlayers[i])
	end

    
    TriggerEvent('Zod-Admin:SendDiscordLogs','adminlogs', ConfigServer.LanguageSv["logreviveall"], 'green', ConfigServer.LanguageSv["theadmin"]..'**'..GetPlayerName(source)..'** '..ConfigServer.LanguageSv["reviveall"]..'' , false)

end, false)