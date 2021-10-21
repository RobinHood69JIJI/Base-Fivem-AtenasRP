ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(10)
    end
end)


local identifiers = {
    'steam:110000132d65ae6', -- AJ
    'steam:1100001150ed5e0', --Rulexloko
    'steam:110000145140ecc', --Isma
    'steam:1100001478373aa', --d3kossitoz
    'steam:1100001184ec290', --Jxro
    'steam:110000147fa9aa9', --Skill
    'steam:110000146361af5', --kew3y
    'steam:1100001428c5545', --Povedilla
    'steam:11000013f5c4d35', --hugo
    'steam:1100001433d5a57', --pantluf
    'steam:1100001491dbf4d', --Andrea
    'steam:11000013e64b5ac', --EterNity_ReXo
    'steam:1100001355c4597', --Brisas
    'steam:110000143f27b87',  --Javi 
    'steam:110000148ae9fd2',  --KIWITOO
    'steam:110000142f8a464'  --Nerea
}

RegisterServerEvent('peds:checked')
AddEventHandler('peds:checked', function()
    local identifier = GetPlayerIdentifiers(source)
    identifier = identifier[1]
    for a, v in pairs(identifiers) do 
        if v == identifier then 
            TriggerClientEvent('peds:checkid', source, true)
            return true 
        end
    end 
    return false 
end)

