local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    xPlayerData = ESX.GetPlayerData()
    SetEntityMaxHealth(GetPlayerPed(-1), 200)
    Citizen.Wait(5000)
end)

local seatbeltIsOn = false

local vehicleCruiser = 'off'
local seatbeltEjectSpeed = 45.0
local seatbeltEjectAccel = 100.0
local beltWarningSet = false
local currSpeed = 0.0
local prevVelocity = {x = 0.0, y = 0.0, z = 0.0}
local speedBuffer = {}
local velBuffer = {}
local isBlackedOut = false
local seatbeltSpeedPedOut = 1.6
local MinSpeedBelt = 45
local lastVehCache
local PedVehIsHeli = false
local PedVehIsPlane = false
local PedVehIsBoat = false
local PedVehIsBike = false
local PedVehIsCar = false
local PedVehIsMotorcycle = false

WichVehicleItIs = function(veh)
    if (lastVehCache == nil or lastVehCache ~= veh) then
        lastVehCache = veh
        PedVehIsHeli = false
        PedVehIsPlane = false
        PedVehIsBoat = false
        PedVehIsBike = false
        PedVehIsCar = false
        PedVehIsMotorcycle = false
        local vc = GetVehicleClass(veh)
        if ((vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or
            (vc >= 17 and vc <= 20)) then
            PedVehIsCar = true
        elseif (vc == 8) then
            PedVehIsMotorcycle = true
            PedVehIsCar = true
        elseif (vc == 13) then
            PedVehIsBike = true
        elseif (vc == 14) then
            PedVehIsBoat = true
        elseif (vc == 15) then
            PedVehIsHeli = true
        elseif (vc == 16) then
            PedVehIsPlane = true
        end
    end
end

Fwv = function(entity)
    local hr = GetEntityHeading(entity) + 90.0
    if hr < 0.0 then hr = 360.0 + hr end
    hr = hr * 0.0174533
    return {x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0}

end

Citizen.CreateThread(function()

    while true do

        local MyPed = GetPlayerPed(-1)
        local MyPedVeh = GetVehiclePedIsIn(MyPed, false)

        if IsPedInAnyVehicle(MyPed, false) then
            s = 0
            WichVehicleItIs(MyPedVeh)
            speedBuffer[2] = speedBuffer[1]
            speedBuffer[1] = GetEntitySpeed(MyPedVeh)

            velBuffer[2] = velBuffer[1]
            velBuffer[1] = GetEntityVelocity(MyPedVeh)

        else
            s = 100
        end

        Citizen.Wait(s)
    end

end)

function round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

local function roundToNthDecimal(num, n)
    local mult = 10 ^ (n or 0)
    return math.floor(num * mult + 0.5) / mult
end

Citizen.CreateThread(function()
    while true do
        local player = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(player, false)
        local position = GetEntityCoords(player)
        local vehicleIsOn = GetIsVehicleEngineRunning(vehicle)
        local vehicleInfo

        if IsPedInAnyVehicle(player, false) then

            SendNUIMessage({quitarvelo = false})

            s = 70
            -- Vehicle Speed
            local vehicleSpeedSource = GetEntitySpeed(vehicle)
            local vehicleSpeed
            vehicleSpeed = math.ceil(vehicleSpeedSource * 3.6)
            -- Vehicle Nail Speed
            local vehicleNailSpeed
            vehicleNailSpeed = math.ceil(
                                   280 -
                                       math.ceil(
                                           math.ceil(vehicleSpeed * 205) /
                                               Config.vehicle.maxSpeed))

            rpm = GetVehicleCurrentRpm(vehicle)
            rpm = math.ceil(rpm * 10000, 2)
            vehicleNailRpm = 280 -
                                 math.ceil(math.ceil((rpm - 2000) * 140) / 10000)

            -- Vehicle Fuel and Gear
            local vehicleFuel = GetVehicleFuelLevel(vehicle)
            local vehicleGear = GetVehicleCurrentGear(vehicle)

            if (vehicleSpeed == 0 and vehicleGear == 0) or
                (vehicleSpeed == 0 and vehicleGear == 1) then
                vehicleGear = 'N'
            elseif vehicleSpeed > 0 and vehicleGear == 0 then
                vehicleGear = 'R'
            end

            -- Vehicle Seatbelt
            if PedVehIsCar == true then

                local prevSpeed = currSpeed
                currSpeed = vehicleSpeedSource

                SetPedConfigFlag(PlayerPedId(), 32, true)

                if not seatbeltIsOn then

                    local vehIsMovingFwd =
                        GetEntitySpeedVector(vehicle, true).y > 1.0
                    local vehAcc = (prevSpeed - currSpeed) / GetFrameTime()

                    if (vehIsMovingFwd and
                        (prevSpeed > (seatbeltEjectSpeed / 2.237)) and
                        (vehAcc > (seatbeltEjectAccel * 9.81))) then
                        SetEntityCoords(player, position.x, position.y,
                                        position.z - 0.47, true, true, true)
                        SetEntityVelocity(player, prevVelocity.x,
                                          prevVelocity.y, prevVelocity.z)
                        SetPedToRagdoll(player, 1000, 1000, 0, 0, 0, 0)
                    else

                        prevVelocity = GetEntityVelocity(vehicle)

                    end

                else

                    DisableControlAction(0, 75, true)

                end
            end

            rpm = GetVehicleCurrentRpm(vehicle)
            rpm = math.ceil(round(rpm, 2) * 10000)
            vehicleNailRpm = 280 -
                                 math.ceil(math.ceil((rpm - 2000) * 140) / 10000)
            local vehicleFuel2
            vehicleFuel2 = GetVehicleEngineHealth(vehicle)
            local vehicleFuel3
            vehicleFuel3 = GetVehicleDirtLevel(vehicle) * 2
            vehicleInfo = {
                currentKM = roundToNthDecimal(DecorGetFloat(vehicle, 'TOTALKM'),
                                              1),
                updateVehicle = true,
                status = true,
                speed = vehicleSpeed,
                nail = vehicleNailRpm,
                gear = vehicleGear,
                fuel = vehicleFuel,
                lights = vehicleIsLightsOn,
                signals = vehicleSignalIndicator,
                cruiser = vehicleCruiser,
                seatbelt = Config.vehicle.seatbelt,
                haveBelt = PedVehIsCar,
                fuel2 = vehicleFuel2,
                fuel3 = vehicleFuel3,
                rpmnail = vehicleNailRpm,
                rpm = rpm,
                config = {
                    speedUnit = Config.vehicle.speedUnit,
                    maxSpeed = Config.vehicle.maxSpeed
                }
            }
            vehicleInfo['seatbelt']['status'] = seatbeltIsOn
        else

            vehicleCruiser = 'off'
            vehicleNailSpeed = 0
            vehicleSignalIndicator = 'off'
            speedBuffer[1], speedBuffer[2] = 0.0, 0.0
            seatbeltIsOn = false
            beltWarningSet = false

            vehicleInfo = {
                updateVehicle = true,
                currentKM = 0,
                status = false,
                nail = 0,
                rpmnail = 0,
                seatbelt = {status = seatbeltIsOn},
                cruiser = vehicleCruiser,
                signals = vehicleSignalIndicator
            }
            s = 1000
        end
        SendNUIMessage(vehicleInfo)
        Citizen.Wait(s)
    end
end)

-- Everything that neededs to be at WAIT 0
Citizen.CreateThread(function()

    while true do

        local player = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(player, false)
        local vehicleClass = GetVehicleClass(vehicle)

        if seatbeltIsOn then
            DisableControlAction(0, 75, true)
            DisableControlAction(27, 75, true)
        end

        -- Vehicle Seatbelt
        if IsPedInAnyVehicle(player, false) then

            s = 10

            if IsControlJustReleased(0, Keys['Z']) and PedVehIsMotorcycle ~=
                true then

                WichVehicleItIs(vehicle)

                if (PedVehIsCar) then
                    seatbeltIsOn = not seatbeltIsOn
                    if seatbeltIsOn then
                        ESX.ShowNotification("Te pusiste el ~g~cinturon~s~")
                    else
                        ESX.ShowNotification("Te quitaste el ~r~cinturon~s~")
                        beltWarningSet = false
                    end
                end
            elseif IsControlJustReleased(0, Keys['Z']) and PedVehIsMotorcycle ==
                true then
                ESX.ShowNotification("No puedes ponerte en cinturon en la moto")

            end

        else
            s = 1000
        end

        -- Vehicle Cruiser
        if IsControlJustPressed(1, Config.vehicle.keys.cruiser) and
            GetPedInVehicleSeat(vehicle, -1) == player then
            local vehicleClass = GetVehicleClass(vehicle)
            if (vehicleClass ~= 13 and vehicleClass ~= 15 and vehicleClass ~= 16) then
                local vehicleSpeedSource = GetEntitySpeed(vehicle)
                local kmhSpeed = math.ceil(vehicleSpeedSource * 3.6)
                if vehicleCruiser == 'on' then
                    vehicleCruiser = 'off'
                    local handlingMaxSpeed = GetVehicleHandlingMaxSpeed(vehicle)
                    SetEntityMaxSpeed(vehicle, handlingMaxSpeed)
                else
                    if (kmhSpeed > 20) then
                        vehicleCruiser = 'on'
                        SetEntityMaxSpeed(vehicle, vehicleSpeedSource)
                    end
                end
            end
        end

        Citizen.Wait(s)
    end
end)

function GetVehicleHandlingMaxSpeed(vehicle)
    local kmAgeMultiplier = GetVehicleModificatorPercentageByKm(vehicle)
    local handlingMaxSpeed = GetVehicleHandlingFloat(vehicle, "CHandlingData",
                                                     "fInitialDriveMaxFlatVel")
    handlingMaxSpeed = handlingMaxSpeed -
                           ((handlingMaxSpeed * kmAgeMultiplier) / 100)
    return handlingMaxSpeed
end

function GetVehicleModificatorPercentageByKm(vehicle)
    local currentKM = DecorGetFloat(vehicle, 'TOTALKM') * 100
    local kmAgeMultiplier = 0
    if (currentKM > 300000) then
        kmAgeMultiplier = 50
    elseif (currentKM > 250000) then
        kmAgeMultiplier = 45
    elseif (currentKM > 200000) then
        kmAgeMultiplier = 40
    elseif (currentKM > 150000) then
        kmAgeMultiplier = 35
    elseif (currentKM > 125000) then
        kmAgeMultiplier = 30
    elseif (currentKM > 100000) then
        kmAgeMultiplier = 25
    elseif (currentKM > 50000) then
        kmAgeMultiplier = 20
    elseif (currentKM > 25000) then
        kmAgeMultiplier = 10
    elseif (currentKM > 10000) then
        kmAgeMultiplier = 5
    end
    return kmAgeMultiplier
end

local toggleui = false

Citizen.CreateThread(function() DecorRegister("TOTALKM", 1) end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1500)
        local MyPed = GetPlayerPed(-1)
        if (IsPedInAnyVehicle(MyPed, false)) then
            if (PedVehIsCar or PedVehIsMotorcycle) then
                local MyPedVeh = GetVehiclePedIsIn(MyPed, false)
                if (GetPedInVehicleSeat(MyPedVeh, -1) == MyPed) then
                    Speed = GetEntitySpeed(MyPedVeh)
                    local currentKM = DecorGetFloat(MyPedVeh, 'TOTALKM')
                    currentKM = currentKM + (Speed / 1000)
                    DecorSetFloat(MyPedVeh, 'TOTALKM', currentKM)
                    if (vehicleCruiser == 'off') then
                        local handlingMaxSpeed =
                            GetVehicleHandlingMaxSpeed(MyPedVeh)
                        SetEntityMaxSpeed(MyPedVeh, handlingMaxSpeed)
                    end
                end
            end
        end
    end
end)
