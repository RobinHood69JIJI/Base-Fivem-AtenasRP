local blips = {
	{title="McDonald's", colour=70, id=124, x = 275.61, y = -961.33, z = 28.36},
	{title="Casino", colour=1, id=89, x = 926.67, y = 47.08, z = 32.52},
	{title="Anfiteatro", colour=1, id=76, x = 683.5, y = 571.09, z = 32.52},

  {title="Tequi-LA-LA", colour=5, id=79, x = -565.03, y = 272.2, z = 83.02},
  {title="Galaxy", colour=1, id=93, x = 355.35, y = 302.18, z = 103.76},
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.8)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)
