-- Variables

local active = false
local type = nil
local NP = {}

-- Registros

RegisterNetEvent('alertas:active')
AddEventHandler('alertas:active',function(typeA)
    SendNUIMessage({type = 'open'})
    type = typeA
    active = true
    -- print(type)
end)

RegisterNetEvent('alertas:disable')
AddEventHandler('alertas:disable',function()
    -- print('close')
    SendNUIMessage({type = 'closeUI'})
    active = false
end)

-- Hilos

Citizen.CreateThread(function()
    while true do
        local s = 1000
        if active == true then
            s = 0
            if type == 'green' then
                s = 0
                NP.DrawText("ALERTA 1",7, 1, 0.968, 0.44, 0.50, 40, 230, 25, 255)
            elseif type == 'yellow' then
                s = 0
                NP.DrawText("ALERTA 2",7, 1, 0.968, 0.44, 0.50, 230, 230, 25, 255)
            elseif type == 'orange' then
                s = 0
                NP.DrawText("ALERTA 3",7, 1, 0.968, 0.44, 0.50, 230, 130, 25, 255)
            elseif type == 'red' then
                s = 0
                NP.DrawText("ALERTA 4",7, 1, 0.968, 0.44, 0.50, 230, 25, 25, 255)
            end
        end
        Citizen.Wait(s)
    end
end)

-- Funciones

NP.DrawText = function(text, font, centre, x, y, scale, r, g, b, a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end