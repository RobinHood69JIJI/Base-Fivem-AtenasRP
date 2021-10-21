local name = GetPlayerName(PlayerId())
ESX = nil

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1)
    end

    while ESX.GetPlayerData() == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
    trabajoActual = PlayerData.job.label
    trabajoActualGrado = PlayerData.job.grade_label
    trabajoActualGradoRaw = PlayerData.job.grade_name
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    trabajoNombre = PlayerData.job.name
    trabajoActual = PlayerData.job.label
    trabajoActualGrado = PlayerData.job.grade_label
    trabajoActualGradoRaw = PlayerData.job.grade_name
    if trabajoActualGradoRaw ~= nil and trabajoActualGradoRaw == 'boss' then
        ESX.TriggerServerCallback('esx_society:getSocietyMoney',
            function(money) dineroSociedad = money end,
        trabajoNombre)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

function vermenu()
    local id = GetPlayerServerId(PlayerId())
    local elements = {}
    local ped = GetPlayerPed(-1)
    local trabajoActual = PlayerData.job.label
    local JobGrade = PlayerData.job.grade_label
    local JobGradeName = PlayerData.job.grade_name
    local name = GetPlayerName(PlayerId())
    
    table.insert(elements, {label = '<span style="color:#009BFF;">-- EMPLEO --'})
    table.insert(elements, {label = 'Empleo: '..PlayerData.job.label..' - '..PlayerData.job.grade_label})
    table.insert(elements, {label = '<span style="color:#00FF55;">-- DOCUMENTACIÓN --'})
    table.insert(elements, {label = '<span>Ver documentación', value = 'Trabajos_mostrar'})


    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_menu', {
        title = 'Mi información | ID: '..id,
        align = 'bottom-right',
        elements = elements
    }, function(data, menu)

        if data.current.value == 'Trabajos_mostrar' then
            verme()
        end
    end, function(data, menu) menu.close() end)
end

function verme()
    local id = GetPlayerServerId(PlayerId())
    local elements = {}
    local ped = GetPlayerPed(-1)
    local trabajoActual = PlayerData.job.label
    local JobGrade = PlayerData.job.grade_label
    local JobGradeName = PlayerData.job.grade_name

    table.insert(elements, {label = 'Mirar tu DNI', value = 'checkID'})
    table.insert(elements, {label = 'Enseñar tu DNI', value = 'showID'})
    table.insert(elements, {label = 'Mirar tu carnet de conducir', value = 'checkDriver'})
    table.insert(elements, {label = 'Enseñar tu carnet de conducir', value = 'showDriver'})
    -- table.insert(elements, {label = 'Mirar tu licencia de armas', value = 'checkFirearms'})
    -- table.insert(elements, {label = 'Enseñar tu licencia de armas', value = 'showFirearms'})    


    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_menu_2', {
        title = "Documentación",
        align = 'bottom-right',
        elements = elements
    }, function(data3, menu2)

        if data3.current.value == 'checkID' then
            ExecuteCommand('me mira su dni')
            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
        elseif data3.current.value == 'showID' then
            ExecuteCommand('me le enseña el dni')
            local player, distance = ESX.Game.GetClosestPlayer()
            if distance ~= -1 and distance <= 3.0 then
              TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
            else
              ESX.ShowNotification('No hay jugadores cerca')
            end

        elseif data3.current.value == 'checkDriver' then
            ExecuteCommand('me mira su carnet de conducir')
            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
        -- elseif data3.current.value == 'checkFirearms' then
        --     ExecuteCommand('me mira su licencia de armas')
        --     TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
        elseif data3.current.value == 'showDriver' then
            ExecuteCommand('me le enseña el carnet de conducir')
            local player, distance = ESX.Game.GetClosestPlayer()
            if distance ~= -1 and distance <= 3.0 then
                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
            else
                ESX.ShowNotification('No hay jugadores cerca')
            end

        -- elseif data3.current.value == 'showFirearms' then
        --     ExecuteCommand('me le enseña la licencia de armas')
        --     local player, distance = ESX.Game.GetClosestPlayer()
        --     if distance ~= -1 and distance <= 3.0 then
        --         TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
        --     else
        --         ESX.ShowNotification('No hay jugadores cerca')
        --     end
        else
            print("Error en el codigo")
        end
    end, function(data, menu) menu.close() end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, 288) then
			vermenu()
		end
	end
end)