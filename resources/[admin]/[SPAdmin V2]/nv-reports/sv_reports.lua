ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local reports = {}
local discord = {}
local wait = {}
local blocked = {}
local hidden = {}

TriggerEvent('es:addGroupCommand', 'openreport', "mod", function(source, args, user)
	TriggerClientEvent("reports:openreport", source, args[1])
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end, {help = "Open admin report by admin"})

TriggerEvent('es:addGroupCommand', 'reports', "mod", function(source, args, user)
    hidden[source] = hidden[source] == nil and true or not hidden[source]
    TriggerClientEvent('notification', source, hidden[source] == true and 'Admin reports disabled!' or 'Admin reports enabled!', hidden[source] == true and 2 or 1)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end, {help = "Enable/Disable admin reports"})

TriggerEvent('es:addCommand', 'report', function(source, args, user)

    local xPlayers = ESX.GetPlayers()

    if ((wait[source]) and (wait[source]+Config.ReportCooldown > GetGameTimer())) then
        TriggerClientEvent('reports:error', source, 'Please wait a few seconds before submitting a report again.')
        return
    end

    if string.len(table.concat(args, " ")) < 5 then
        TriggerClientEvent('reports:error', source, 'A little more details please')
        return
    end

    if blocked[source] then
        TriggerClientEvent('reports:error', source, 'You are blocked in the reporting system')
        return
    end

    local report = #reports + 1
    reports[report] = { report = report, id = source, name = GetPlayerName(source), text = table.concat(args, " "), discord = discord[source] }
        
    for k,v in pairs(xPlayers) do
        local xPlayer = ESX.GetPlayerFromId(v)

        if xPlayer.getGroup() ~= 'user' or xPlayer.source == source then
            TriggerClientEvent("reports:addReport", v, reports[report])
        end
        
    end

    wait[source] = GetGameTimer()
end, {help = "Report a player or an issue", params = {{name = "report", help = "What you want to report"}}})

RegisterServerEvent("reports:bring")
AddEventHandler("reports:bring", function(id)
    TriggerClientEvent('reports:goto', id, source)
end)

RegisterServerEvent("reports:history")
AddEventHandler("reports:history", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getGroup() ~= 'user' then
        TriggerClientEvent("reports:history", source)
    end
end)

RegisterServerEvent("reports:delete")
AddEventHandler("reports:delete", function(id)
    reports[id] = nil
    TriggerClientEvent("reports:error", source, 'You deleted Report #' .. id)
    TriggerClientEvent("reports:delete", source, id)
end)

RegisterServerEvent("reports:init")
AddEventHandler("reports:init", function()
    local src = source
    local identifier = nil
    local data = nil

    for k,v in pairs(GetPlayerIdentifiers(src)) do
        if string.find(v,'discord') then
            identifier = string.sub(v, 9)
        end
    end

    if not identifier then
        discord[src] = GetPlayerName(src)
    else
        PerformHttpRequest("https://discordapp.com/api/users/"..identifier, function(err, text, headers)
            if err == 200 then
                discord[src] = json.decode(text).username .. '#' .. json.decode(text).discriminator
            else
                discord[src] = GetPlayerName(source)
            end
        end, "GET", "", {["Content-type"] = "application/json", ["Authorization"] = "Bot " .. Config.DiscordToken})
    end
end)

RegisterServerEvent("reports:block")
AddEventHandler("reports:block", function(id,name)
    blocked[id] = blocked[id] == nil and true or not blocked[id]

    if ESX.GetPlayerFromId(id) then
        TriggerClientEvent("reports:" .. (blocked[id] == true and 'error' or 'info'), id, "You're " .. (blocked[id] == true and 'Blocked' or 'Unblocked') .. " by " .. GetPlayerName(source) .. ".")
    end

    for k,v in pairs(ESX.GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(v)

        if xPlayer.getGroup() ~= 'user' then
            TriggerClientEvent("reports:" .. (blocked[id] == true and 'error' or 'info'), v, name .. " was " .. (blocked[id] == true and 'Blocked' or 'Unblocked') .. " by " .. GetPlayerName(source) .. ".")
        end
        
    end
end)

ESX.RegisterServerCallback("reports:IsBlocked", function(source, cb, id)
    cb(blocked[id] == true)
end)
