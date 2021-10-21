ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local cantidad = math.random(1, 3) -- Cantidad de fruta que te puede tocar

RegisterNetEvent('ader_frutero:darHerramienta')
AddEventHandler('ader_frutero:darHerramienta', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.canCarryItem('tijeras', 1) and xPlayer.getInventoryItem('tijeras').count < 1 then 
        xPlayer.addInventoryItem('tijeras', 1)
    else
        xPlayer.showNotification('No tienes espacio en el inventario o ya tienes herramientas')
    end
end)

RegisterNetEvent('ader_frutero:recogerNaranjas')
AddEventHandler('ader_frutero:recogerNaranjas', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.canCarryItem('naranja', cantidad) then 
       xPlayer.addInventoryItem('naranja', cantidad)
       xPlayer.showNotification('Has recogido ' .. cantidad .. ' naranjas')
    else
        xPlayer.showNotification('No tienes espacio en el inventario')
    end
end)

RegisterNetEvent('ader_frutero:recogerMelocotones')
AddEventHandler('ader_frutero:recogerMelocotones', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.canCarryItem('melocoton', cantidad) then 
       xPlayer.addInventoryItem('melocoton', cantidad)
       xPlayer.showNotification('Has recogido ' .. cantidad .. ' melocotones')
    else
        xPlayer.showNotification('No tienes espacio en el inventario')
    end
end)

RegisterNetEvent('ader_frutero:recogerFresas')
AddEventHandler('ader_frutero:recogerFresas', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.canCarryItem('fresa', cantidad) then 
       xPlayer.addInventoryItem('fresa', cantidad)
       xPlayer.showNotification('Has recogido ' .. cantidad .. ' fresas')
    else
        xPlayer.showNotification('No tienes espacio en el inventario')
    end
end)

RegisterNetEvent('ader_frutero:procesarFruta')
AddEventHandler('ader_frutero:procesarFruta', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem('fresa').count >= 5 then
        xPlayer.removeInventoryItem('fresa', 5)
        xPlayer.addInventoryItem('cajafrutas', 1)
        xPlayer.showNotification('Has obtenido 1 caja de frutas')
        return
    end
    if xPlayer.getInventoryItem('naranja').count >= 5 then
        xPlayer.removeInventoryItem('naranja', 5)
        xPlayer.addInventoryItem('cajafrutas', 1)
        xPlayer.showNotification('Has obtenido 1 caja de frutas')
        return
    end
    if xPlayer.getInventoryItem('melocoton').count >= 5 then
        xPlayer.removeInventoryItem('melocoton', 5)
        xPlayer.addInventoryItem('cajafrutas', 1)
        xPlayer.showNotification('Has obtenido 1 caja de frutas')
    else
        xPlayer.showNotification('No tienes suficiente fruta para procesar')
        return
    end
end)

RegisterNetEvent('ader_frutero:venderFruta')
AddEventHandler('ader_frutero:venderFruta', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem('cajafrutas').count > 0 then
        xPlayer.addMoney(math.random(800, 900) * xPlayer.getInventoryItem('cajafrutas').count) -- Dinero que te da al vender las cajas. (Numero aleatorio de x a y)
        xPlayer.removeInventoryItem('cajafrutas', xPlayer.getInventoryItem('cajafrutas').count)
        xPlayer.removeInventoryItem('tijeras', 1)
        xPlayer.showNotification('Has vendido las cajas de fruta')
    else
        xPlayer.showNotification('No tienes cajas de fruta para vender')
        return
    end
end)

RegisterNetEvent('ader_frutero:checkTijeras')
AddEventHandler('ader_frutero:checkTijeras', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem('tijeras').count < 1 then
        xPlayer.showNotification('No tienes tijeras imbécil')
	end
end)