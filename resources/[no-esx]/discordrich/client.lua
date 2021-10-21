Citizen.CreateThread(function()
	while true do
		SetDiscordAppId(881529183707213855)
		SetDiscordRichPresenceAsset('logo_atenascommunity')
        SetDiscordRichPresenceAssetText('AtenasCommunity')
        SetDiscordRichPresenceAssetSmall('logo_atenascommunity')
        SetDiscordRichPresenceAssetSmallText('https://discord.gg/atenas')
		Citizen.Wait(60000)
	end
end)
Citizen.CreateThread(function()
	while true do
		local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
		if VehName == "NULL" then VehName = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))) end
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
		local StreetHash = GetStreetNameAtCoord(x, y, z)
		local pId = GetPlayerServerId(PlayerId())
		local pName = GetPlayerName(PlayerId())
		Citizen.Wait(15000)
		if StreetHash ~= nil then
			StreetName = GetStreetNameFromHashKey(StreetHash)
			if IsPedOnFoot(PlayerPedId()) and not IsEntityInWater(PlayerPedId()) then
				if IsPedSprinting(PlayerPedId()) then
					SetRichPresence("ID: "..pId.." | "..pName.." corto en "..StreetName)
				elseif IsPedRunning(PlayerPedId()) then
					SetRichPresence("ID: "..pId.." | "..pName.." se acaba en "..StreetName)
				elseif IsPedWalking(PlayerPedId()) then
					SetRichPresence("ID: "..pId.." | "..pName.." caminando "..StreetName)
				elseif IsPedStill(PlayerPedId()) then
					SetRichPresence("ID: "..pId.." | "..pName.." está parado en "..StreetName.."")
				end
			elseif GetVehiclePedIsUsing(PlayerPedId()) ~= nil and not IsPedInAnyHeli(PlayerPedId()) and not IsPedInAnyPlane(PlayerPedId()) and not IsPedOnFoot(PlayerPedId()) and not IsPedInAnySub(PlayerPedId()) and not IsPedInAnyBoat(PlayerPedId()) then
				local MPH = math.ceil(GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId())) * 2.236936)
				if MPH > 50 then
					SetRichPresence("ID: "..pId.." | "..pName.." acelera en "..StreetName.." a "..MPH.."KM/H en una "..VehName)
				elseif MPH <= 50 and MPH > 0 then
					SetRichPresence("ID: "..pId.." | "..pName.." está conduciendo "..StreetName.." a "..MPH.."KM/H en una "..VehName)
				elseif MPH == 0 then
					SetRichPresence("ID: "..pId.." | "..pName.." está estacionado en "..StreetName.." en una "..VehName)
				end
			elseif IsPedInAnyHeli(PlayerPedId()) or IsPedInAnyPlane(PlayerPedId()) then
				if IsEntityInAir(GetVehiclePedIsUsing(PlayerPedId())) or GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) > 5.0 then
					SetRichPresence("ID: "..pId.." | "..pName.." está volando sobre "..StreetName.." en una "..VehName)
				else
					SetRichPresence("ID: "..pId.." | "..pName.." aterrizó en "..StreetName.." en una "..VehName)
				end
			elseif IsEntityInWater(PlayerPedId()) then
				SetRichPresence("ID: "..pId.." | "..pName.." que")
			elseif IsPedInAnyBoat(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				SetRichPresence("ID: "..pId.." | "..pName.." navega en un "..VehName)
			elseif IsPedInAnySub(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				SetRichPresence("ID: "..pId.." | "..pName.." está en un submarino amarillo")
			end
		end
	end
end)

---------------------------------
--------- AJ#0001 ------------
---------------------------------