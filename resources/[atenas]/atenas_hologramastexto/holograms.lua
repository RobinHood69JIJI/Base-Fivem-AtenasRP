Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if GetDistanceBetweenCoords( -260.85, -965.64, 31.22, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			HL3D( -260.85, -965.64, 31.22  -1.400, "BIENVENIDO A ATENAS COMMUNITY", 4, 0.1, 0.1)
			HL3D( -260.85, -965.64, 31.22 -1.600, "RECUERDA UNIRTE AL DISCORD", 4, 0.1, 0.1)
			HL3D( -260.85, -965.64, 31.22 -1.800, "DISCORD: discord.gg/atenas", 4, 0.1, 0.1)
			HL3D( -260.85, -965.64, 31.22 -2.000, "WEB: www.atenasrp.com", 4, 0.1, 0.1)	
			HL3D( -260.85, -965.64, 31.22 -2.200, "TS3: atenas", 4, 0.1, 0.1)			
		end
		if GetDistanceBetweenCoords( -266.88, -968.46, 31.22, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			HL3D( -266.88, -968.46, 31.22  -1.400, "NO OLVIDES LEER LAS NORMAS", 4, 0.1, 0.1)
			HL3D( -266.88, -968.46, 31.22  -1.600, "RECUERDA PASARLO BIEN", 4, 0.1, 0.1)	
			HL3D( -266.88, -968.46, 31.22  -1.800, "Y EL MAS GRAVE ERROR ES NO ADMITIR LOS ERRORES", 4, 0.1, 0.1)	
		end		
	end
end)

function HL3D(x,y,z,textInput,fontId,scaleX,scaleY)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov   
    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(20, 245, 170, 255)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end