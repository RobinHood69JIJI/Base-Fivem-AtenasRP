ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


local admins = {
    'steam:110000132d65ae6', -- AJ
    'steam:11000011ca109cd'  -- COLD
}

RegisterServerEvent("sp_admin:giveCash")
AddEventHandler("sp_admin:giveCash", function(money)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local total = money
	
	xPlayer.addMoney((total))
	local item = ' $'
	local message = '+'
	TriggerClientEvent('esx:showNotification', _source, message.." "..total.." "..item)

end)

RegisterServerEvent("sp_admin:giveBank")
AddEventHandler("sp_admin:giveBank", function(money)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local total = money
	
	xPlayer.addAccountMoney('bank', total)
	local item = ' $'
	local message = '+'
	TriggerClientEvent('esx:showNotification', _source, message.." "..total.." "..item)

end)

RegisterServerEvent("sp_admin:giveDirtyMoney")
AddEventHandler("sp_admin:giveDirtyMoney", function(money)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local total = money
	
	xPlayer.addAccountMoney('black_money', total)
	local item = ' $'
	local message = '+'
	TriggerClientEvent('esx:showNotification', _source, message.." "..total.." "..item)

end)

function isAdmin(player)
    local allowed = false
    for i,id in ipairs(admins) do
        for x,pid in ipairs(GetPlayerIdentifiers(player)) do
            if string.lower(pid) == string.lower(id) then
                allowed = true
            end
        end
    end
    return allowed
end

local function checkAdmin(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local result = {}
	if xPlayer ~= nil then
		result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {['identifier'] = xPlayer.identifier})
	end
	if result[1].group ~= nil and result[1].group == "superadmin" then
		return true
	end
	return false
end

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end



RegisterServerEvent('checkadmin')
AddEventHandler('checkadmin', function()
	local id = source
	if isAdmin(id) then
		TriggerClientEvent("setgroup", source)
	end
end)

RegisterNetEvent('sp_admin:giveweapon')
AddEventHandler('sp_admin:giveweapon', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source) 
    xPlayer.addWeapon('WEAPON_KNIFE', 999)
    xPlayer.addWeapon('WEAPON_KNUCKLE', 999)
    xPlayer.addWeapon('WEAPON_CROWBAR', 999)
    xPlayer.addWeapon('WEAPON_GOLFCLUB', 999)
    xPlayer.addWeapon('WEAPON_BOTTLE', 999)
    xPlayer.addWeapon('WEAPON_DAGGER', 999)
    xPlayer.addWeapon('WEAPON_HATCHET', 999)
    xPlayer.addWeapon('WEAPON_KNUCKLEDUSTER', 999)
    xPlayer.addWeapon('WEAPON_FLASHLIGHT', 999)
    xPlayer.addWeapon('WEAPON_SWITCHBLADE', 999)
    xPlayer.addWeapon('WEAPON_POOLCUE', 999)
    xPlayer.addWeapon('WEAPON_WRENCH', 999)
    xPlayer.addWeapon('WEAPON_BATTLEAXE', 999)
    xPlayer.addWeapon('WEAPON_NIGHTSTICK', 999)
    xPlayer.addWeapon('WEAPON_HAMMER', 999)
    xPlayer.addWeapon('WEAPON_BAT', 999)
    xPlayer.addWeapon('WEAPON_MACHETE', 999)
    xPlayer.addWeapon('WEAPON_GRENADE', 999)
    xPlayer.addWeapon('WEAPON_STICKYBOMB', 999)
    xPlayer.addWeapon('WEAPON_PISTOL', 999)
    xPlayer.addWeapon('WEAPON_PISTOLMK2', 999)
    xPlayer.addWeapon('WEAPON_PISTOL50', 999)
    xPlayer.addWeapon('WEAPON_COMBATPISTOL', 999)
    xPlayer.addWeapon('WEAPON_SNSPISTOL', 999)
    xPlayer.addWeapon('WEAPON_HEAVYPISTOL', 999)
    xPlayer.addWeapon('WEAPON_VINTAGEPISTOL', 999)
    xPlayer.addWeapon('WEAPON_MARKSMANPISTOL', 999)
    xPlayer.addWeapon('WEAPON_REVOLVER', 999)
    xPlayer.addWeapon('WEAPON_APPISTOL', 999)
    xPlayer.addWeapon('WEAPON_STUNGUN', 999)
    xPlayer.addWeapon('WEAPON_FLAREGUN', 999)
    xPlayer.addWeapon('WEAPON_MICROSMG', 999)
    xPlayer.addWeapon('WEAPON_MACHINEPISTOL', 999)
    xPlayer.addWeapon('WEAPON_SMGMK2', 999)
    xPlayer.addWeapon('WEAPON_ASSAULTSMG', 999)
    xPlayer.addWeapon('WEAPON_COMBATPDW', 999)
    xPlayer.addWeapon('WEAPON_MG', 999)
    xPlayer.addWeapon('WEAPON_COMBATMG', 999)
    xPlayer.addWeapon('WEAPON_COMBATMGMK2', 999)
    xPlayer.addWeapon('WEAPON_KUSEMBERG', 999)
    xPlayer.addWeapon('WEAPON_MINISMG', 999)
    xPlayer.addWeapon('WEAPON_SMG', 999)
    xPlayer.addWeapon('WEAPON_ASSAULTRIFLE', 999)
    xPlayer.addWeapon('WEAPON_ASSAULTRIFLEMK2', 999)
    xPlayer.addWeapon('WEAPON_CARBINERIFLE', 999)
    xPlayer.addWeapon('WEAPON_CARBINERIFLEMK2', 999)
    xPlayer.addWeapon('WEAPON_ADVANCEDRIFLE', 999)
    xPlayer.addWeapon('WEAPON_GUSENBERG', 999)
    xPlayer.addWeapon('WEAPON_RAYCARBINE', 999)
    xPlayer.addWeapon('WEAPON_SPECIALCARBINE', 999)
    xPlayer.addWeapon('WEAPON_BULLPUPRIFLE', 999)
    xPlayer.addWeapon('WEAPON_COMPACTRIFLE', 999)
    xPlayer.addWeapon('WEAPON_SNIPERRIFLE', 999)
    xPlayer.addWeapon('WEAPON_HEAVYSHOTGUN', 999)
    xPlayer.addWeapon('WEAPON_HEAVYSNIPER', 999)
    xPlayer.addWeapon('WEAPON_HEAVYSNIPERMK2', 999)
    xPlayer.addWeapon('WEAPON_MARKSMANRIFLE', 999)
    xPlayer.addWeapon('WEAPON_DBSHOTGUN', 999)
    xPlayer.addWeapon('WEAPON_SNIPERRIFLE', 999)
    xPlayer.addWeapon('WEAPON_PUMPSHOTGUN', 999)
    xPlayer.addWeapon('WEAPON_SAWNOFFSHOTGUN', 999)
    xPlayer.addWeapon('WEAPON_BULLPUPSHOTGUN', 999)
    xPlayer.addWeapon('WEAPON_ASSAULTSHOTGUN', 999)
    xPlayer.addWeapon('WEAPON_MUSKET', 999)
    xPlayer.addWeapon('WEAPON_DOUBLEBARRELSHOTGUN', 999)
    xPlayer.addWeapon('WEAPON_AUTOSHOTGUN', 999)
    xPlayer.addWeapon('WEAPON_GRENADELAUNCHER', 999)
    xPlayer.addWeapon('WEAPON_RPG', 999)
    xPlayer.addWeapon('WEAPON_MINIGUN', 999)
    xPlayer.addWeapon('WEAPON_FIREWORK', 999)
    xPlayer.addWeapon('WEAPON_RAILGUN', 999)
    xPlayer.addWeapon('WEAPON_HOMINGLAUNCHER', 999)
    xPlayer.addWeapon('WEAPON_GRENADELAUNCHERSMOKE', 999)
    xPlayer.addWeapon('WEAPON_COMPACTLAUNCHER', 999)
    xPlayer.addWeapon('WEAPON_PROXIMITYMINE', 999)
    xPlayer.addWeapon('WEAPON_BZGAS', 999)
    xPlayer.addWeapon('WEAPON_MOLOTOV', 999)
    xPlayer.addWeapon('WEAPON_FIREEXTINGUISHER', 999)
    xPlayer.addWeapon('WEAPON_PETROLCAN', 999)
    xPlayer.addWeapon('WEAPON_FLARE', 999)
    xPlayer.addWeapon('WEAPON_BALL', 999)
    xPlayer.addWeapon('WEAPON_SNOWBALL', 999)
    xPlayer.addWeapon('WEAPON_SMOKEGRENADE', 999)
    xPlayer.addWeapon('WEAPON_PIPEBOMB', 999)
    xPlayer.addWeapon('WEAPON_PARACHUTE', 999)
end)

RegisterServerEvent('haciadmin:kickjoueur')
AddEventHandler('haciadmin:kickjoueur', function(player)
    DropPlayer(player, "You were kicked! More information on our discord.")
end)

RegisterNetEvent('sp_admin:removeweapon')
AddEventHandler('sp_admin:removeweapon', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source) 
      for i=1, #xPlayer.loadout, 1 do
      xPlayer.removeWeapon(xPlayer.loadout[i].name)
    end
end)