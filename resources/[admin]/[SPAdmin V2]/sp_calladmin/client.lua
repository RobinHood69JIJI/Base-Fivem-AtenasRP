local display = false


RegisterCommand("calladmindiscord", function(source, args)
    SetDisplay(not display)
end)

--very important cb 
RegisterNUICallback("exit", function(data)

    SetDisplay(false)
end)


RegisterNUICallback("main", function(data)
    SetDisplay(false)
end)


function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)

        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)




RegisterNUICallback('name', function(data, cb)
    TriggerServerEvent("calladmin" , data)

end)
