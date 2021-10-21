--Variables
ESX = nil
UniqueSessionID = math.random(1000, 9999) --Sirve para evitar LUA INJECTOR
Multiplier = 2.0
Kilometers = {}

--LLamadas a eventos
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--Registrar eventos
RegisterServerEvent('tm1_package:initializer')
RegisterServerEvent('tm1_package:destinationCompleted')
RegisterServerEvent('tm1_package:earn')

--Declaración de eventos
AddEventHandler('tm1_package:initializer', function()
    local data = {
        source = source,
        uniqueID = UniqueSessionID
    } 
    TriggerClientEvent('tm1_package:initializer', source, data)
end)

AddEventHandler('tm1_package:destinationCompleted', function(distance, data)
    local source = source
    local xPlayer  = ESX.GetPlayerFromId(source)
    if auth(data.uniqueID, source) then
        if Kilometers[source] == nil or Kilometers[source] == 0 then
            Kilometers[source] = distance
        else
            Kilometers[source] = Kilometers[source] + distance
        end
    end
end)

AddEventHandler('tm1_package:earn', function(data)
    local source = source
    local xPlayer  = ESX.GetPlayerFromId(source)
    if auth(data.uniqueID, source) then
        if Kilometers[source] == nil or Kilometers[source] == 0 then
            TriggerClientEvent('esx:showNotification', source, 'No tienes ~o~kilómetros ~w~acumulados. Empieza a repartir!!')
        else
            local amount = Kilometers[source] * Multiplier
            TriggerClientEvent('esx:showNotification', source, 'Tienes acumulados ~y~'..tonumber(round(Kilometers[source], 0))..'~w~ kilómetros. Se te pagará : '..tonumber(round(amount, 0)).."~g~€")
            Kilometers[source] = 0
            xPlayer.addMoney(tonumber(amount))
        end
    end
end)

--Funciones
function auth(unique, source)
    if unique == UniqueSessionID then
        print('Evento autorizado : '..unique)
        return true
    end
    local xPlayer  = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier
    print(identifier..' : No autorizado')
    return false
end

function round(num, numDecimalPlaces)
	local mult = 5^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end