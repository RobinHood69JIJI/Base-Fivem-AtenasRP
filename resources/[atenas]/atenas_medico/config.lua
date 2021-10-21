Config = {}
Config.Locale = 'en'

Config.Price = 5000

Config.DrawDistance = 40.0
Config.MarkerSize   = {x = 1.5, y = 1.5, z = 1.5}
Config.MarkerColor  = {r = 20, g = 245, b = 170}
Config.MarkerType   = 27

Config.Zones = {}

Config.Hosp = {
	{x = 353.15, y = -1387.76, z = 31.53},
}

for i=1, #Config.Hosp, 1 do
	Config.Zones['Private Doc_' .. i] = {
		Pos   = Config.Hosp[i],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType
	}
end
