local Text               = {}
local BanList            = {}
local BanListLoad        = false
local BanListHistory     = {}
local BanListHistoryLoad = false
if Config.Lang == "fr" then Text = Config.TextFr elseif Config.Lang == "en" then Text = Config.TextEn else print("FIveM-BanSql : Invalid Config.Lang") end

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

CreateThread(function()
	while true do
		Wait(1000)
        if BanListLoad == false then
			loadBanList()
			if BanList ~= {} then
				print(Text.banlistloaded)
				BanListLoad = true
			else
				print(Text.starterror)
			end
		end
		if BanListHistoryLoad == false then
			loadBanListHistory()
            if BanListHistory ~= {} then
				print(Text.historyloaded)
				BanListHistoryLoad = true
			else
				print(Text.starterror)
			end
		end
	end
end)


RegisterCommand("sqlbanreload", function(source, args, rawCommand)	-- /tpm		teleport to waypoint
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			BanListLoad        = false
			BanListHistoryLoad = false
			Wait(5000)
			if BanListLoad == true then
				TriggerEvent('bansql:sendMessage', xPlayer.source, Text.banlistloaded)
				if BanListHistoryLoad == true then
					TriggerEvent('bansql:sendMessage', xPlayer.source, Text.historyloaded)
				end
			else
				TriggerEvent('bansql:sendMessage', xPlayer.source, Text.loaderror)
			end
		end
	end
	
end, false)

RegisterCommand("sqlbanhistory", function(source, args, rawCommand)	-- /tpm		teleport to waypoint
	if args[1] and BanListHistory then
		local nombre = (tonumber(args[1]))
		local name   = table.concat(args, " ",1)
		if name ~= "" then
	
				if nombre and nombre > 0 then
						local expiration = BanListHistory[nombre].expiration
						local timeat     = BanListHistory[nombre].timeat
						local calcul1    = expiration - timeat
						local calcul2    = calcul1 / 86400
						local calcul2 	 = math.ceil(calcul2)
						local resultat   = tostring(BanListHistory[nombre].targetplayername.." , "..BanListHistory[nombre].sourceplayername.." , "..BanListHistory[nombre].reason.." , "..calcul2..Text.day.." , "..BanListHistory[nombre].added)
						
						TriggerEvent('bansql:sendMessage', xPlayer.source, (nombre .." : ".. resultat))
				else
						for i = 1, #BanListHistory, 1 do
							if (tostring(BanListHistory[i].targetplayername)) == tostring(name) then
								local expiration = BanListHistory[i].expiration
								local timeat     = BanListHistory[i].timeat
								local calcul1    = expiration - timeat
								local calcul2    = calcul1 / 86400
								local calcul2 	 = math.ceil(calcul2)					
								local resultat   = tostring(BanListHistory[i].targetplayername.." , "..BanListHistory[i].sourceplayername.." , "..BanListHistory[i].reason.." , "..calcul2..Text.day.." , "..BanListHistory[nombre].added)
	
								TriggerEvent('bansql:sendMessage', xPlayer.source, (i .." : ".. resultat))
							end
						end
				end
		else
			TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidname)
		end
	  else
		TriggerEvent('bansql:sendMessage', xPlayer.source, Text.cmdhistory)
	  end
	  
end, false)

RegisterCommand("sqlunban", function(source, args, rawCommand)	-- /tpm		teleport to waypoint
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			if args[1] then
				local target = table.concat(args, " ")
				MySQL.Async.fetchAll('SELECT * FROM banlist WHERE targetplayername like @playername', 
				{
					['@playername'] = ("%"..target.."%")
				}, function(data)
					if data[1] then
						if #data > 1 then
							TriggerEvent('bansql:sendMessage', xPlayer.source, Text.toomanyresult)
							for i=1, #data, 1 do
								TriggerEvent('bansql:sendMessage', xPlayer.source, data[i].targetplayername)
							end
						else
							MySQL.Async.execute(
							'DELETE FROM banlist WHERE targetplayername = @name',
							{
							  ['@name']  = data[1].targetplayername
							},
								function ()
								loadBanList()
								TriggerEvent('bansql:sendMessage', xPlayer.source, data[1].targetplayername .. Text.isunban)
							end)
						end
					else
						TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidname)
					end
			
				end)
			  else
				TriggerEvent('bansql:sendMessage', xPlayer.source, Text.cmdunban)
			  end
		end
	end
	
end, false)

RegisterCommand("sqlban", function(source, args, rawCommand)	-- /tpm		teleport to waypoint
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			local license,identifier,liveid,xblid,discord
	local target    = tonumber(args[1])
	local duree     = tonumber(args[2])
	local reason    = table.concat(args, " ",3)

	if args[1] then		
		if reason == "" then
			reason = Text.noreason
		end
		if target and target > 0 then
			local ping = GetPlayerPing(target)
        
			if ping and ping > 0 then
				if duree and duree < 365 then
					local sourceplayername = GetPlayerName(xPlayer.source)
					local targetplayername = GetPlayerName(target)
						for k,v in ipairs(GetPlayerIdentifiers(target))do
							if string.sub(v, 1, string.len("license:")) == "license:" then
								license = v
							elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
								identifier = v
							elseif string.sub(v, 1, string.len("live:")) == "live:" then
								liveid = v
							elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
								xblid  = v
							elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
								discord = v
							end
						end
				
					if duree > 0 then
						ban(xPlayer.source,license,identifier,liveid,xblid,discord,targetplayername,sourceplayername,duree,reason,0) --Timed ban here
						DropPlayer(target, Text.yourban .. reason)
					else
						ban(xPlayer.source,license,identifier,liveid,xblid,discord,targetplayername,sourceplayername,duree,reason,1) --Perm ban here
						DropPlayer(target, Text.yourpermban .. reason)
					end
				
				else
					TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidtime)
				end	
			else
				TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidid)
			end
		else
			TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidid)
		end
	else
		TriggerEvent('bansql:sendMessage', xPlayer.source, Text.cmdban)
	end
		end
	end
	
end, false)

RegisterCommand("sqlsearch", function(source, args, rawCommand)	-- /tpm		teleport to waypoint
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			if args ~= "" then
				local target = table.concat(args, " ")
				if target ~= "" then
					MySQL.Async.fetchAll('SELECT * FROM baninfo WHERE playername like @playername', 
					{
						['@playername'] = ("%"..target.."%")
					}, function(data)
						if data[1] then
							if #data < 50 then
								for i=1, #data, 1 do
									TriggerEvent('bansql:sendMessage', xPlayer.source, data[i].id.." "..data[i].playername)
								end
							else
								TriggerEvent('bansql:sendMessage', xPlayer.source, Text.toomanyresult)
							end
						else
							TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidname)
						end
					end)
				else
					TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidname)
				end
			else
				TriggerEvent('bansql:sendMessage', xPlayer.source, Text.cmdbanoff)
			end
		end
	end
	
end, false)

RegisterCommand("sqlbanoffline", function(source, args, rawCommand)	-- /tpm		teleport to waypoint
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then
			if args ~= "" then
				local target           = tonumber(args[1])
				local duree            = tonumber(args[2])
				local reason           = table.concat(args, " ",3)
				local sourceplayername = GetPlayerName(xPlayer.source)
		
				if duree ~= "" then
					if target ~= "" then
						MySQL.Async.fetchAll('SELECT * FROM baninfo WHERE id = @id', 
						{
							['@id'] = target
						}, function(data)
							if data[1] then
								if duree and duree < 365 then
									if reason == "" then
										reason = Text.noreason
									end
									if duree > 0 then --Here if not perm ban
										ban(xPlayer.source,data[1].license,data[1].identifier,data[1].liveid,data[1].xblid,data[1].discord,data[1].playername,sourceplayername,duree,reason,0) --Timed ban here
									else --Here if perm ban
										ban(xPlayer.source,data[1].license,data[1].identifier,data[1].liveid,data[1].xblid,data[1].discord,data[1].playername,sourceplayername,duree,reason,1) --Perm ban here
									end
								else
									TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidtime)
								end
							else
								TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidid)
							end
						end)
					else
						TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidname)
					end
				else
					TriggerEvent('bansql:sendMessage', xPlayer.source, Text.invalidtime)
					TriggerEvent('bansql:sendMessage', xPlayer.source, Text.cmdbanoff)
				end
			else
				TriggerEvent('bansql:sendMessage', xPlayer.source, Text.cmdbanoff)
			end
		end
	end
	
end, false)

AddEventHandler('bansql:sendMessage', function(source, message)
	if source ~= 0 then
		TriggerClientEvent('chat:addMessage', source, { args = { '^1BANGORDO ', message } } )
	else
		print('SqlBan: ' .. message)
	end
end)

AddEventHandler('playerConnecting', function (playerName,setKickReason)
	local license,steamID,liveid,xblid,discord  = "n/a","n/a","n/a","n/a","n/a"

	for k,v in ipairs(GetPlayerIdentifiers(source))do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			license = v
		elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
			steamID = v
		elseif string.sub(v, 1, string.len("live:")) == "live:" then
			liveid = v
		elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
			xblid  = v
		elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
			discord = v
		end
	end

	--Si Banlist pas chargée
	if (Banlist == {}) then
		Citizen.Wait(1000)
	end

    if steamID == "n/a" and Config.ForceSteam then
		setKickReason(Text.invalidsteam)
		CancelEvent()
    end

	for i = 1, #BanList, 1 do
		if 
			  ((tostring(BanList[i].license)) == tostring(license) 
			or (tostring(BanList[i].identifier)) == tostring(steamID) 
			or (tostring(BanList[i].liveid)) == tostring(liveid) 
			or (tostring(BanList[i].xblid)) == tostring(xblid) 
			or (tostring(BanList[i].discord)) == tostring(discord))
		then

			if (tonumber(BanList[i].permanent)) == 1 then

				setKickReason(Text.yourpermban .. BanList[i].reason)
				CancelEvent()
				break

			elseif (tonumber(BanList[i].expiration)) > os.time() then

				local tempsrestant     = (((tonumber(BanList[i].expiration)) - os.time())/60)
				if tempsrestant >= 1440 then
					local day        = (tempsrestant / 60) / 24
					local hrs        = (day - math.floor(day)) * 24
					local minutes    = (hrs - math.floor(hrs)) * 60
					local txtday     = math.floor(day)
					local txthrs     = math.floor(hrs)
					local txtminutes = math.ceil(minutes)
						setKickReason(Text.yourban .. BanList[i].reason .. Text.timeleft .. txtday .. Text.day ..txthrs .. Text.hour ..txtminutes .. Text.minute)
						CancelEvent()
						break
				elseif tempsrestant >= 60 and tempsrestant < 1440 then
					local day        = (tempsrestant / 60) / 24
					local hrs        = tempsrestant / 60
					local minutes    = (hrs - math.floor(hrs)) * 60
					local txtday     = math.floor(day)
					local txthrs     = math.floor(hrs)
					local txtminutes = math.ceil(minutes)
						setKickReason(Text.yourban .. BanList[i].reason .. Text.timeleft .. txtday .. Text.day .. txthrs .. Text.hour .. txtminutes .. Text.minute)
						CancelEvent()
						break
				elseif tempsrestant < 60 then
					local txtday     = 0
					local txthrs     = 0
					local txtminutes = math.ceil(tempsrestant)
						setKickReason(Text.yourban .. BanList[i].reason .. Text.timeleft .. txtday .. Text.day .. txthrs .. Text.hour .. txtminutes .. Text.minute)
						CancelEvent()
						break
				end

			elseif (tonumber(BanList[i].expiration)) < os.time() and (tonumber(BanList[i].permanent)) == 0 then

				deletebanned(license)
				break
			end
		end
	end
end)

AddEventHandler('esx:playerLoaded',function(source)
	CreateThread(function()
	Wait(5000)
		local license,steamID,liveid,xblid,discord
		local playername = GetPlayerName(source)

		for k,v in ipairs(GetPlayerIdentifiers(source))do
			if string.sub(v, 1, string.len("license:")) == "license:" then
				license = v
			elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
				steamID = v
			elseif string.sub(v, 1, string.len("live:")) == "live:" then
				liveid = v
			elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
				xblid  = v
			elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
				discord = v
			end
		end

		MySQL.Async.fetchAll('SELECT * FROM `baninfo` WHERE `license` = @license', {
			['@license'] = license
		}, function(data)
		local found = false
			for i=1, #data, 1 do
				if data[i].license == license then
					found = true
				end
			end
			if not found then
				MySQL.Async.execute('INSERT INTO baninfo (license,identifier,liveid,xblid,discord,playername) VALUES (@license,@identifier,@liveid,@xblid,@discord,@playername)', 
					{ 
					['@license']    = license,
					['@identifier'] = steamID,
					['@liveid']     = liveid,
					['@xblid']      = xblid,
					['@discord']    = discord,
					['@playername'] = playername
					},
					function ()
				end)
			else
				MySQL.Async.execute('UPDATE `baninfo` SET `identifier` = @identifier, `liveid` = @liveid, `xblid` = @xblid, `discord` = @discord, `playername` = @playername WHERE `license` = @license', 
					{ 
					['@license']    = license,
					['@identifier'] = steamID,
					['@liveid']     = liveid,
					['@xblid']      = xblid,
					['@discord']    = discord,
					['@playername'] = playername
					},
					function ()
				end)
			end
		end)
		if Config.MultiServerSync then
			doublecheck(source)
		end
	end)
end)


RegisterServerEvent('BanSql:CheckMe')
AddEventHandler('BanSql:CheckMe', function()
	doublecheck(source)
end)

function ban(source,license,identifier,liveid,xblid,discord,targetplayername,sourceplayername,duree,reason,permanent)
--calcul total expiration (en secondes)
	local expiration = duree * 86400
	local timeat     = os.time()
	local added      = os.date()

	if expiration < os.time() then
		expiration = os.time()+expiration
	end
	
		table.insert(BanList, {
			license    = license,
			identifier = identifier,
			liveid     = liveid,
			xblid      = xblid,
			discord    = discord,
			reason     = reason,
			expiration = expiration,
			permanent  = permanent
			})

		MySQL.Async.execute(
				'INSERT INTO banlist (license,identifier,liveid,xblid,discord,targetplayername,sourceplayername,reason,expiration,timeat,permanent) VALUES (@license,@identifier,@liveid,@xblid,@discord,@targetplayername,@sourceplayername,@reason,@expiration,@timeat,@permanent)',
				{ 
				['@license']          = license,
				['@identifier']       = identifier,
				['@liveid']           = liveid,
				['@xblid']            = xblid,
				['@discord']          = discord,
				['@targetplayername'] = targetplayername,
				['@sourceplayername'] = sourceplayername,
				['@reason']           = reason,
				['@expiration']       = expiration,
				['@timeat']           = timeat,
				['@permanent']        = permanent,
				},
				function ()
		end)

		if permanent == 0 then
			TriggerEvent('bansql:sendMessage', source, (Text.youban .. targetplayername .. Text.during .. duree .. Text.forr .. reason))
		else
			TriggerEvent('bansql:sendMessage', source, (Text.youban .. targetplayername .. Text.permban .. reason))
		end

		MySQL.Async.execute(
				'INSERT INTO banlisthistory (license,identifier,liveid,xblid,discord,targetplayername,sourceplayername,reason,added,expiration,timeat,permanent) VALUES (@license,@identifier,@liveid,@xblid,@discord,@targetplayername,@sourceplayername,@reason,@added,@expiration,@timeat,@permanent)',
				{ 
				['@license']          = license,
				['@identifier']       = identifier,
				['@liveid']           = liveid,
				['@xblid']            = xblid,
				['@discord']          = discord,
				['@targetplayername'] = targetplayername,
				['@sourceplayername'] = sourceplayername,
				['@reason']           = reason,
				['@added']            = added,
				['@expiration']       = expiration,
				['@timeat']           = timeat,
				['@permanent']        = permanent,
				},
				function ()
		end)
		
		BanListHistoryLoad = false
end
	
function loadBanList()
	MySQL.Async.fetchAll(
		'SELECT * FROM banlist',
		{},
		function (data)
			BanList = {}

			for i=1, #data, 1 do
			table.insert(BanList, {
				license    = data[i].license,
				identifier = data[i].identifier,
				liveid     = data[i].liveid,
				xblid      = data[i].xblid,
				discord    = data[i].discord,
				reason     = data[i].reason,
				expiration = data[i].expiration,
				permanent  = data[i].permanent
				})
			end
	end)
end
	
function loadBanListHistory()
	MySQL.Async.fetchAll(
		'SELECT * FROM banlisthistory',
		{},
		function (data)
			BanListHistory = {}

			for i=1, #data, 1 do
			table.insert(BanListHistory, {
				license          = data[i].license,
				identifier       = data[i].identifier,
				liveid           = data[i].liveid,
				xblid            = data[i].xblid,
				discord          = data[i].discord,
				targetplayername = data[i].targetplayername,
				sourceplayername = data[i].sourceplayername,
				reason           = data[i].reason,
				added            = data[i].added,
				expiration       = data[i].expiration,
				permanent        = data[i].permanent,
				timeat           = data[i].timeat
				})
			end
	end)
end
	
function deletebanned(license) 
	MySQL.Async.execute(
		'DELETE FROM banlist WHERE license=@license',
		{
			['@license']  = license
		},
		function ()
			loadBanList()
	end)
end
	
function doublecheck(player)
	if GetPlayerIdentifiers(player) then
		local license,steamID,liveid,xblid,discord  = "n/a","n/a","n/a","n/a","n/a"

		for k,v in ipairs(GetPlayerIdentifiers(player))do
			if string.sub(v, 1, string.len("license:")) == "license:" then
				license = v
			elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
				steamID = v
			elseif string.sub(v, 1, string.len("live:")) == "live:" then
				liveid = v
			elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
				xblid  = v
			elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
				discord = v
			end
		end

		for i = 1, #BanList, 1 do
			if 
					((tostring(BanList[i].license)) == tostring(license) 
				or (tostring(BanList[i].identifier)) == tostring(steamID) 
				or (tostring(BanList[i].liveid)) == tostring(liveid) 
				or (tostring(BanList[i].xblid)) == tostring(xblid) 
				or (tostring(BanList[i].discord)) == tostring(discord))
			then

				if (tonumber(BanList[i].permanent)) == 1 then
					DropPlayer(player, Text.yourban .. BanList[i].reason)
					break

				elseif (tonumber(BanList[i].expiration)) > os.time() then

					local tempsrestant     = (((tonumber(BanList[i].expiration)) - os.time())/60)
					if tempsrestant > 0 then
						DropPlayer(player, Text.yourban .. BanList[i].reason)
						break
					end

				elseif (tonumber(BanList[i].expiration)) < os.time() and (tonumber(BanList[i].permanent)) == 0 then

					deletebanned(license)
					break

				end
			end
		end
	end
end


function havePermission(xPlayer, exclude)	-- you can exclude rank(s) from having permission to specific commands 	[exclude only take tables]
	if exclude and type(exclude) ~= 'table' then exclude = nil;print("^3[esx_admin] ^1ERROR ^0exclude argument is not table..^0") end	-- will prevent from errors if you pass wrong argument

	local playerGroup = xPlayer.getGroup()
	for k,v in pairs(Config.adminRanks) do
		if v == playerGroup then
			if not exclude then
				return true
			else
				for a,b in pairs(exclude) do
					if b == v then
						return false
					end
				end
				return true
			end
		end
	end
	return false
end
