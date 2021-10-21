
ENP = {}

local ENPAdmins = {
    'steam:11000013ebb89c7',   -- BLESSED
    'steam:110000132d65ae6',   -- AJ
    'steam:11000013386e22d',   -- JIMMY
    'steam:110000143f27b87',   -- JAVI
    'steam:1100001432cc0bd',   -- IVENNER
    'steam:110000148e4281c',   -- MARIO
    'steam:1100001150ed5e0',   -- EIOW
    'steam:11000011ca109cd',   -- COLD
    'steam:1100001355c4597',   -- BRISAS
    'steam:1100001491dbf4d',   -- ANDREA
    'steam:110000141786d9a',   -- LUISMI
    'steam:1100001169c9581',   -- PANTHER
    'steam:11000014490e362',   -- PISTOLAZO
    'steam:110000140dfd25e',   -- GALO
    'steam:11000014a32bbf4',   -- JASSCHIS
    'steam:110000141495ea2',   -- MYSTHYC
    'steam:1100001072df729',   -- XENON
    'steam:1100001136bd696',   -- DXDY
    'steam:1100001434b114d',   -- DANI
    'steam:1100001184ec290',   -- JERO
    'steam:11000013d1914d7',   -- PISTACHO
    'steam:1100001446f1a1d',   -- DOAR
    'steam:110000148b03fa4',   -- BANANITO
    'steam:11000013f5c4d35',   -- HUGO
    'steam:11000011aa6c792',   -- KICK
    'steam:1100001410d2367',   -- IVAN
    'steam:11000013d2c1b84',   -- ALEX
    'steam:1100001498a699c',   -- JON
    'steam:1100001428c5545',   -- JAIRO GUERRERO
    'steam:110000134b5a8c1',   -- PABLOO
    'steam:110000145140ecc'   -- ISMAA
}

ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ENP.isAdmin = function()
    local ENP_identifier = GetPlayerIdentifiers(src)
    ENP_identifier = ENP_identifier[1]
    for i, v in pairs(ENPAdmins) do 
        if v == ENP_identifier then 
            return true 
        end
    end 
    return false
end


RegisterServerEvent('enp-admin:isAdministrator')
AddEventHandler('enp-admin:isAdministrator', function()
    local ENPidentifier = GetPlayerIdentifiers(source)
    ENPidentifier = ENPidentifier[1]
    for a, v in pairs(ENPAdmins) do 
        if v == ENPidentifier then 
            TriggerClientEvent('enp-admin:checkAdmin', source, true)
            return true 
        end
    end 
    return false 
end)
