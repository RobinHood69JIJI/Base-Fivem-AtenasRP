ESX = nil
local open_assists,active_assists = {},{}
local registeredSuggestions = {}

function SendToDiscord(tittle,message)
    _var = {
        {
            ["color"] = Config.WebhookColor,
            ["title"] = tittle,
            ["description"] = message,
            ["footer"] = { 
                ["text"] = "JIMMY REPORTS",       
                ["icon_url"] = "https://cdn.discordapp.com/icons/861764973578551316/a_6287a942466ec7f7dc0bf7c5090b778e.png?size=4096"
            },
        }
    }
    PerformHttpRequest(
        Config.Webhook,
        function(err, text, headers) end, 'POST', 
        json.encode(
            {
                username = "JIMMY REPORTS - LOGS", 
                embeds = _var, 
                avatar_url = "https://cdn.discordapp.com/icons/861764973578551316/a_6287a942466ec7f7dc0bf7c5090b778e.png?size=4096"
            }
        ), 
        {
            ['Content-Type'] = 'application/json'
        }
    )
end

Citizen.CreateThread(function()
    TriggerEvent(Config.SharedObject, function(obj) ESX = obj end)
    while ESX==nil do Wait(0) end
    
    RegisterCommand(Config.Comando, function(source, args, rawCommand)
        local reason = table.concat(args," ")
        if reason=="" or not reason then TriggerClientEvent("chat:addMessage",source,{color={255,0,0},multiline=false,args={Config.Server,_U('razon')}}); return end
        -- if not open_assists[source] and not active_assists[source] then
            local ac = execOnAdmins(function(admin) TriggerClientEvent("jimmy_reports:requestedAssist",admin,source); TriggerClientEvent("chat:addMessage",admin,{color={0,255,255},multiline=Config.Report:find("\n")~=nil,args={Config.Server,Config.Report:format(GetPlayerName(source),source,reason)}}) end)
            if ac>0 then
                open_assists[source]=reason
                TriggerClientEvent("chat:addMessage",source,{color={0,255,0},multiline=false,args={Config.Server,_U('reportenviado')}})
                SendToDiscord('Nuevo report de: '..source..' - '..GetPlayerName(source), 'Reporte: ' ..reason)
            else
                TriggerClientEvent("chat:addMessage",source,{color={255,0,0},multiline=false,args={Config.Server,_U('nostaff')}})
            -- end
        -- else
            -- TriggerClientEvent("chat:addMessage",source,{color={255,0,0},multiline=false,args={Config.Server,_U('reportyaenviado')}})
        end
    -- end
end)

    function isAdmin(xPlayer)
        for k,v in ipairs(Config.Staff) do
            if xPlayer.getGroup()==v then return true end
        end
        return false
    end

    function execOnAdmins(func)
        local ac = 0
        for k,v in ipairs(ESX.GetPlayers()) do
            if isAdmin(ESX.GetPlayerFromId(v)) then
                ac = ac + 1
                func(v)
            end
        end
        return ac
    end
    
end)

AddEventHandler('chat:addSuggestion', function(commandName, commandDescription, commandParameters)
    local exists = false
    for key, suggestion in pairs(registeredSuggestions) do
        if suggestion.commandName == commandName then
            exists = true
        end
    end
    if not exists then
        table.insert(registeredSuggestions, {commandName = commandName, commandDescription = commandDescription, commandParameters = commandParameters})
        TriggerClientEvent('chat:addSuggestion', -1, commandName, commandDescription, commandParameters)
    end
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', _U('comando'), _U('significado'),{{name=_U('motivo'), help=_U('pregunta')}})
end)