Config                            = {}

Config.DrawDistance               = 30.0
Config.MarkerType                 = 27
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 20, g = 245, b = 170 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = false -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale = 'es'

Config.tequilalaStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(-445.71, 6013.51, 31.72),
			Sprite  = -1,
			Display = 0,
			Scale   = 0.0,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(-576.24, 286.75, 79.18)
		},

		Armories = {
			vector3(-562.1, 289.07, 82.18)
		},

		Vehicles = {
			{
				Spawner = vector3(-557.14, 298.01, 83.05),
				InsideShop = vector3(-548.0, 303.1, 83.04),
				SpawnPoints = {
					{ coords = vector3(-563.72, 302.26, 83.16), heading = 88.19, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(-1101.59, 4941.01, 218.35),
				InsideShop = vector3(-1092.94, 4948.73, 218.35),
				SpawnPoints = {
					{ coords = vector3(-1095.66, 4936.64, 217.6), heading = 161.14, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(102.89, -1287.53, 35.01),
				InsideShop = vector3(107.62, -1310.14, 41.27),
				SpawnPoints = {
					{ coords = vector3(107.62, -1310.14, 41.27), heading = 123.92, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(575.42, 291.33, 79.18)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
	},

	officer = {
	},

	sergeant = {
	},

	intendent = {
	},

	lieutenant = {
	},

	cabo1 = {
	},

	boss = {
		{ weapon = 'WEAPON_SWITCHBLADE',      price = 10000 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		{ model = 'bmx', label = 'BMX', price = 1 }
	},

	recruit = {
	},

	officer = {
	},

	sergeant = {
	},

	intendent = {
	},

	lieutenant = {
	},

	chef = {
	},

	boss = {
	}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {},

	chef = {},

	boss = {}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	uniformebase = {
		male = {
			['tshirt_1'] = 57,  ['tshirt_2'] = 0,
            ['torso_1'] = 55,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 41,
            ['pants_1'] = 33,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['mask_1'] = 0,     ['mask_2'] = 0,
            ['bproof_1'] = 0,   ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 37,  ['tshirt_2'] = 1,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 32,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	
	ropaseguridad = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 95,   ['torso_2'] = 1,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 11,
            ['pants_1'] = 24,   ['pants_2'] = 5,
            ['shoes_1'] = 18,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['mask_1'] = 0,     ['mask_2'] = 0,
            ['bproof_1'] = 0,   ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 68,  ['tshirt_2'] = 0,
            ['torso_1'] = 79,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 11,
            ['pants_1'] = 97,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0

		}
	},
	
	ropacamarero = {
		male = {
			['tshirt_1'] = 60,  ['tshirt_2'] = 0,
            ['torso_1'] = 59,   ['torso_2'] = 6,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 4,
            ['pants_1'] = 50,   ['pants_2'] = 7,
            ['shoes_1'] = 20,   ['shoes_2'] = 7,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 14,  ['tshirt_2'] = 0,
            ['torso_1'] = 13,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 15,
            ['pants_1'] = 16,   ['pants_2'] = 8,
            ['shoes_1'] = 0,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	ropabalasera = {
		male = {
			['tshirt_1'] = 131,   ['tshirt_2'] = 0,
			['torso_1'] = 139,  ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 77,
			['pants_1'] = 59,   ['pants_2'] = 9,
			['shoes_1'] = 7,   ['shoes_2'] = 2,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,    ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 161,  ['tshirt_2'] = 0,
            ['torso_1'] = 136,   ['torso_2'] = 3,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 18,
            ['pants_1'] = 61,   ['pants_2'] = 9,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0
		}
	}
	
}