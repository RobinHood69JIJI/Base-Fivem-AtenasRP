ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('duty:police')
AddEventHandler('duty:police', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == 'police' and xPlayer.job.grade == 0 then
            xPlayer.setJob('offpolice', 0)
            TriggerEvent('quitararmas:armas', xPlayer)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 1 then
            xPlayer.setJob('offpolice', 1)
            TriggerEvent('quitararmas:armas', xPlayer)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 2 then
            xPlayer.setJob('offpolice', 2)
            TriggerEvent('quitararmas:armas', xPlayer)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 3 then
            xPlayer.setJob('offpolice', 3)
            TriggerEvent('quitararmas:armas', xPlayer)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 4 then
            xPlayer.setJob('offpolice', 4)
            TriggerEvent('quitararmas:armas', xPlayer)
    end

    if xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 0 then
        xPlayer.setJob('police', 0)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 1 then
        xPlayer.setJob('police', 1)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 2 then
        xPlayer.setJob('police', 2)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 3 then
        xPlayer.setJob('police', 3)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 4 then
        xPlayer.setJob('police', 4)
    end
end)

RegisterServerEvent('quitararmas:armas')
AddEventHandler('quitararmas:armas', function(xPlayer)
    for k,v in ipairs(xPlayer.loadout) do
        xPlayer.removeWeapon(v.name)
    end
end)
RegisterServerEvent('duty:taxi')
AddEventHandler('duty:taxi', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'taxi' and xPlayer.job.grade == 0 then
            xPlayer.setJob('offtaxi', 0)
    elseif xPlayer.job.name == 'taxi' and xPlayer.job.grade == 1 then
            xPlayer.setJob('offtaxi', 1)
    elseif xPlayer.job.name == 'taxi' and xPlayer.job.grade == 2 then
            xPlayer.setJob('offtaxi', 2)
    elseif xPlayer.job.name == 'taxi' and xPlayer.job.grade == 3 then
            xPlayer.setJob('offtaxi', 3)
    elseif xPlayer.job.name == 'taxi' and xPlayer.job.grade == 4 then
            xPlayer.setJob('offtaxi', 4)
    end

    if xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 0 then
        xPlayer.setJob('taxi', 0)
    elseif xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 1 then
        xPlayer.setJob('taxi', 1)
    elseif xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 2 then
        xPlayer.setJob('taxi', 2)
    elseif xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 3 then
        xPlayer.setJob('taxi', 3)
    elseif xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 4 then
        xPlayer.setJob('taxi', 4)
    end
end)

RegisterServerEvent('duty:ambulance')
AddEventHandler('duty:ambulance', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == "ambulance" then
        for i=1, #xPlayer.inventory, 1 do
            if xPlayer.inventory[i].count > 0 then
                if (xPlayer.inventory[i].canRemove or Config.RemoveNonRemoveItemsAfterRPDeath) then
                    if xPlayer.inventory[i].name == "medikit" or xPlayer.inventory[i].name == "bandage" then
                        xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
                    end
                end
            end
        end


        for i=1, #xPlayer.loadout, 1 do
            xPlayer.removeWeapon(xPlayer.loadout[i].name)
        end
    end

    if xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 0 then
            xPlayer.setJob('offambulance', 0)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 1 then
            xPlayer.setJob('offambulance', 1)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 2 then
            xPlayer.setJob('offambulance', 2)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 3 then
            xPlayer.setJob('offambulance', 3)
    end

    if xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 0 then
        xPlayer.setJob('ambulance', 0)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 1 then
        xPlayer.setJob('ambulance', 1)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 2 then
        xPlayer.setJob('ambulance', 2)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 3 then
        xPlayer.setJob('ambulance', 3)
    end

    
end)
-- Duty mecanico nuevo
RegisterServerEvent('duty:mecanico')
AddEventHandler('duty:mecanico', function(job)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

if xPlayer.job.name == 'mechanic' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offmechanic', 0)
elseif xPlayer.job.name == 'mechanic' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offmechanic', 1)
elseif xPlayer.job.name == 'mechanic' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offmechanic', 2)
elseif xPlayer.job.name == 'mechanic' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offmechanic', 3)
elseif xPlayer.job.name == 'mechanic' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offmechanic', 4)
end

if xPlayer.job.name == 'offmechanic' and xPlayer.job.grade == 0 then
    xPlayer.setJob('mechanic', 0)
elseif xPlayer.job.name == 'offmechanic' and xPlayer.job.grade == 1 then
    xPlayer.setJob('mechanic', 1)
elseif xPlayer.job.name == 'offmechanic' and xPlayer.job.grade == 2 then
    xPlayer.setJob('mechanic', 2)
elseif xPlayer.job.name == 'offmechanic' and xPlayer.job.grade == 3 then
    xPlayer.setJob('mechanic', 3)
elseif xPlayer.job.name == 'offmechanic' and xPlayer.job.grade == 4 then
    xPlayer.setJob('mechanic', 4)
end
end)