Config                            = {}

Config.DrawDistance               = 30.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).

Config.Marker                     = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 255, g = 0, b = 0, a = 100, rotate = false}

Config.ReviveReward               = 700  -- Revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- Enable anti-combat logging? (Removes Items when a player logs back after intentionally logging out while dead.)
Config.LoadIpl                    = true -- Disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'es'

Config.EarlyRespawnTimer          = 60000 * 5  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 10 -- time til the player bleeds out

Config.EnablePlayerManagement     = false -- Enable society managing (If you are using esx_society).

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 5000

Config.RespawnPoint = {coords = vector3(338.69, -1394.51, 32.51), heading = 51.9}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(338.69, -1394.51, 32.51),
			sprite = 61,
			scale  = 0.8,
			color  = 1
		},

		AmbulanceActions = {
			vector3(375.66, -1434.35, 31.53)
		},

		Pharmacies = {
			vector3(361.99, -1418.21, 31.53)
		},

		Vehicles = {
			{
				Spawner = vector3(396.22, -1428.62, 29.44),
				InsideShop = vector3(293.85, -1432.83, 29.8),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 255, g = 0, b = 0, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(408.75, -1436.76, 29.39), heading = 31.00, radius = 1.0 },
					{ coords = vector3(412.83, -1434.64, 29.39), heading = 29.03, radius = 0.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(312.86, -1452.6, 46.51),
				InsideShop = vector3(351.88, -588.02, 74.17),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 255, g = 0, b = 0, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(313.24, -1465.15, 46.51), heading = 140.36, radius = 10.0},
					{coords = vector3(299.46, -1453.34, 46.51), heading = 140.36, radius = 10.0}
				}
			}
		},
		
		Deleters = {
			vector3(331.29, -1477.24, 28.75), -- Coches
			vector3(313.31, -1465.14, 45.51) -- Heli
		},
		
		FastTravels = {},

		FastTravelsPrompt = {
			{
				From = vector3(372.35, -1421.03, 32.51),
				To = { coords = vector3(334.69, -1432.81, 45.51), heading = 143.12 },
				Marker = { type = 21, x = 1.0, y = 1.0, z = 0.7, r = 230, g = 230, b = 20, a = 100, rotate = true },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(334.69, -1432.81, 46.51),
				To = { coords = vector3(372.35, -1421.03, 31.51), heading = 332.68 },
				Marker = { type = 21, x = 1.0, y = 1.0, z = 0.7, r = 230, g = 230, b = 20, a = 100, rotate = true },
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {
	car = {
		ambulance = {
			{model = 'ambulance', price = 1}
		},

		doctor = {
			{model = '19transitcr', price = 1},
			{model = 'ambulance', price = 1},
			{model = 'ems1200rt', price = 1}
		},

		chief_doctor = {
			{model = '19transitcr', price = 1},
			{model = 'ambulance', price = 1},
			{model = 'ems1200rt', price = 1},
			{model = '50thpolstang', price = 1},
			{model = 'pol718', price = 1},
			{model = 'kurumacre', price = 1}
		},

		boss = {
			{model = '19transitcr', price = 1},
			{model = 'ambulance', price = 1},
			{model = 'ems1200rt', price = 1},
			{model = '50thpolstang', price = 1},
			{model = 'pol718', price = 1},
			{model = 'kurumacre', price = 1}
		}
	},

	helicopter = {
		ambulance = {},

		doctor = {
			{model = 'frogger', price = 2}
		},

		chief_doctor = {
			{model = 'frogger', price = 2}
		},

		boss = {
			{model = 'frogger', price = 2}
		}
	}
}
