ESX = nil

ENP_noclip = false
ENP_godmode = false
ENP_vanish = false
ENP_noclipSpeed = 3.0
ENP = {}
Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)


local isAdmin

Citizen.CreateThread(function()
	ENP.CheckAdmin()
    while true do 
        Wait(150)
    end
end)

ENP.CheckAdmin = function()
    isAdmin = nil
    TriggerServerEvent('enp-admin:isAdministrator')
    while (isAdmin == nil) do
        Citizen.Wait(1)
    end
end

RegisterNetEvent('enp-admin:checkAdmin')
AddEventHandler('enp-admin:checkAdmin', function(state)
    isAdmin = state 
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if IsControlJustReleased(0, 58) and isAdmin then 
			MunuAdmin()
		elseif IsControlJustReleased(0, 58) and not isAdmin then 
			ESX.ShowNotification('No tienes permisos para ver esto')
        end 
        if ENP_noclip then
            local ped = GetPlayerPed(-1)
            local x,y,z = getPosition()
            local dx,dy,dz = getCamDirection()
            local speed = ENP_noclipSpeed
        
  
            SetEntityVelocity(ped, 0.05,  0.05,  0.05)
  
            if IsControlPressed(0, 32) then
                x = x + speed * dx
                y = y + speed * dy
                z = z + speed * dz
            end
  
            if IsControlPressed(0, 269) then
                x = x - speed * dx
                y = y - speed * dy
                z = z - speed * dz
            end
  
            SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
        end
	end
end)


function MunuAdmin()
    local elements = {}

    local elements = {
		{label = "Noclip", value = "noclip"},
    }


    ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'adminMenu',
		{
			title  = "Atenas Noclip",
			elements = elements
		},
		function(data, menu)
			if data.current.value == "noclip" then
				TriggerEvent('enp-admin:nocliped')
				ESX.UI.Menu.CloseAll()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end


RegisterNetEvent('enp-admin:nocliped')
AddEventHandler('enp-admin:nocliped',function()
	ENP_noclip = not ENP_noclip
    local ped = GetPlayerPed(-1)

    if ENP_noclip then
    	SetEntityInvincible(ped, true)
    	SetEntityVisible(ped, false, false)
    else
    	SetEntityInvincible(ped, false)
    	SetEntityVisible(ped, true, false)
    end

    if ENP_noclip == true then 
        ESX.ShowNotification('Has activado el ~g~noclip.')
    else
        ESX.ShowNotification('Has desactivado el ~r~noclip.')
    end
end)


getPosition = function()
	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
  	return x,y,z
end

getCamDirection = function()
	local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
	local pitch = GetGameplayCamRelativePitch()
  
	local x = -math.sin(heading*math.pi/180.0)
	local y = math.cos(heading*math.pi/180.0)
	local z = math.sin(pitch*math.pi/180.0)
  
	local len = math.sqrt(x*x+y*y+z*z)
	if len ~= 0 then
	  x = x/len
	  y = y/len
	  z = z/len
	end
  
	return x,y,z
end