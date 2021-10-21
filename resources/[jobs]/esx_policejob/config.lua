Config                            = {}

Config.DrawDistance               = 30.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType                 = {Cloakrooms = 20, Armories = 21, BossActions = 22, Vehicles = 36, Helicopters = 34}
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 10, g = 85, b = 255}

Config.EnablePlayerManagement     = false -- Enable if you want society managing.
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = false -- Enable if you're using esx_identity.
Config.EnableLicenses             = false -- Enable if you're using esx_license.

Config.EnableHandcuffTimer        = false -- Enable handcuff timer? will unrestrain player after the time ends.
Config.HandcuffTimer              = 10 * 60000 -- 10 minutes.

Config.EnableJobBlip              = true -- Enable blips for cops on duty, requires esx_society.
Config.EnableCustomPeds           = false -- Enable custom peds in cloak room? See Config.CustomPeds below to customize peds.

Config.EnableESXService           = false -- Enable esx service?
Config.MaxInService               = -1 -- How much people can be in service at once?

Config.Locale                     = 'es'

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(-1098.22, -834.0, 37.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.8,
			Colour  = 0
		},

		Cloakrooms = {
			vector3(-1098.28, -831.96, 14.18)
		},

		Armories = {
			vector3(-1102.49, -830.03, 14.28)
		},

		Vehicles = {
			{
				Spawner = vector3(-1113.0, -841.88, 13.24),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(-1125.21, -841.58, 13.42), heading = 135.0, radius = 8.0},
					{coords = vector3(-468.86, 6020.33, 31.34), heading = 135.0, radius = 8.0}
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0},
					{coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-1106.77, -832.83, 37.7),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(-1096.55, -832.52, 37.37), heading = 363.1, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(-1085.01, -821.29, 14.88)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_COMBATPISTOL', price = 0},
		{weapon = 'WEAPON_SMG', price = 0}
	},

	officer = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_COMBATPISTOL', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', price = 0},
		{weapon = 'WEAPON_FLAREGUN', price = 0},
		{weapon = 'GADGET_PARACHUTE', price = 0}
	},

	sergeant = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_COMBATPISTOL', price = 0},
		{weapon = 'WEAPON_HEAVYPISTOL', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', price = 0},
		{weapon = 'WEAPON_SPECIALCARBINE', price = 0},
		{weapon = 'WEAPON_FLAREGUN', price = 0},
		{weapon = 'GADGET_PARACHUTE', price = 0}
	},

	lieutenant = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_COMBATPISTOL', price = 0},
		{weapon = 'WEAPON_HEAVYPISTOL', price = 0},
		{weapon = 'WEAPON_APPISTOL', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_COMBATPDW', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', price = 0},
		{weapon = 'WEAPON_SPECIALCARBINE', price = 0},
		{weapon = 'WEAPON_SNIPERRIFLE', price = 0},
		{weapon = 'WEAPON_FLAREGUN', price = 0},
		{weapon = 'GADGET_PARACHUTE', price = 0}
	},

	boss = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_COMBATPISTOL', price = 0},
		{weapon = 'WEAPON_HEAVYPISTOL', price = 0},
		{weapon = 'WEAPON_APPISTOL', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_ASSAULTSMG', price = 0},
		{weapon = 'WEAPON_COMBATPDW', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', price = 0},
		{weapon = 'WEAPON_SPECIALCARBINE', price = 0},
		{weapon = 'WEAPON_BULLPUPRIFLE', price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 0},
		{weapon = 'WEAPON_SNIPERRIFLE', price = 0},
		{weapon = 'WEAPON_FLAREGUN', price = 0},
		{weapon = 'GADGET_PARACHUTE', price = 0}
	}
}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{model = 'police', price = 1}, -- Seat Leon
			{model = 'cnp_qashqai', price = 1}, -- Nissan Qashqai
			{model = 'policebike', price = 1}, -- Moto carretera
			{model = 'cnpsanchez', price = 1} -- Moto montaña
		},

		officer = {
			{model = 'police', price = 1}, -- Seat Leon
			{model = 'cnp_qashqai', price = 1}, -- Nissan Qashqai
			{model = '16bemetax1pol', price = 1}, -- BMW X1
			{model = 'policebike', price = 1}, -- Moto carretera
			{model = 'cnpsanchez', price = 1} -- Moto montaña
		},

		sergeant = {
			{model = 'police', price = 1}, -- Seat Leon
			{model = 'cnp_qashqai', price = 1}, -- Nissan Qashqai
			{model = 'polgs351', price = 1}, -- Lexus
			{model = '16bemetax1pol', price = 1}, -- BMW X1
			{model = 'policebike', price = 1}, -- Moto carretera
			{model = 'cnpsanchez', price = 1}, -- Moto montaña
			{model = 'kurumacnp', price = 1} -- Coche Blindado
		},

		lieutenant = {
			{model = 'police', price = 1}, -- Seat Leon
			{model = 'cnp_qashqai', price = 1}, -- Nissan Qashqai
			{model = 'polgs351', price = 1}, -- Lexus
			{model = '16bemetax1pol', price = 1}, -- BMW X1
			{model = '2015polstang', price = 1}, -- Mustang
			{model = 'policebike', price = 1}, -- Moto carretera
			{model = 'cnpsanchez', price = 1}, -- Moto montaña
			{model = 'kurumacnp', price = 1}, -- Coche Blindado
			{model = 'insGEO', price = 1}, -- Furgon Blindado
			{model = 'gc_laguna', price = 1}, -- Secreta Laguna
			{model = 'bemetax6mum', price = 1}, -- Secreta BMW
			{model = '00passatb5um', price = 1}, -- Secreta Passat
			{model = '04astraum', price = 1}, -- Secreta Astra
			{model = '06xc90um', price = 1}, -- Secreta Volvo
			{model = '09astraum', price = 1} -- Secreta Astra Oscuro
		},

		boss = {
			{model = 'police', price = 1}, -- Seat Leon
			{model = 'cnp_qashqai', price = 1}, -- Nissan Qashqai
			{model = 'polgs351', price = 1}, -- Lexus
			{model = '16bemetax1pol', price = 1}, -- BMW X1
			{model = '2015polstang', price = 1}, -- Mustang
			{model = 'policebike', price = 1}, -- Moto carretera
			{model = 'cnpsanchez', price = 1}, -- Moto montaña
			{model = 'kurumacnp', price = 1}, -- Coche Blindado
			{model = 'insGEO', price = 1}, -- Furgon Blindado
			{model = 'gc_laguna', price = 1}, -- Secreta Laguna
			{model = 'bemetax6mum', price = 1}, -- Secreta BMW
			{model = '00passatb5um', price = 1}, -- Secreta Passat
			{model = '04astraum', price = 1}, -- Secreta Astra
			{model = '06xc90um', price = 1}, -- Secreta Volvo
			{model = '09astraum', price = 1} -- Secreta Astra Oscuro
		}
	},

	helicopter = {
		recruit = {},

		officer = {
			{model = 'polmavp', props = {modLivery = 0}, price = 2}
		},

		sergeant = {
			{model = 'polmavp', props = {modLivery = 0}, price = 2}
		},

		lieutenant = {
			{model = 'polmavp', props = {modLivery = 0}, price = 2}
		},

		boss = {
			{model = 'polmavp', props = {modLivery = 0}, price = 2}
		}
	}
}

Config.CustomPeds = {
	shared = {
		{label = 'Guardia Civil Ped', maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01'},
		{label = 'Policia Nacional Ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'}
	},

	recruit = {},

	officer = {},

	sergeant = {},

	lieutenant = {},

	boss = {
		{label = 'GEO Ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	uniforme_uno = {
		male = {
			tshirt_1 = 57,  tshirt_2 = 0,
			torso_1 = 37,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 4,
			pants_1 = 84,   pants_2 = 7,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 84,  helmet_2 = 1,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 84,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	uniforme_dos = {
		male = {
			tshirt_1 = 57,  tshirt_2 = 0,
			torso_1 = 39,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 84,   pants_2 = 7,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 84,  helmet_2 = 1,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	uniforme_geo = {
		male = {
			tshirt_1 = 57,  tshirt_2 = 0,
			torso_1 = 44,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 4,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 88,  helmet_2 = 0,
			mask_1 = 35,    mash_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	uniforme_uotm = {
		male = {
			tshirt_1 = 57,  tshirt_2 = 0,
			torso_1 = 44,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 17,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 68,  helmet_2 = 0,
			mask_1 = 35,    mash_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	uniforme_sma = {
		male = {
			tshirt_1 = 57,  tshirt_2 = 0,
			torso_1 = 44,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 17,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 111,  helmet_2 = 14,
			mask_1 = 35,    mash_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	chaleco_uno = {
		male = {
			bproof_1 = 18,  bproof_2 = 0
		},
		female = {
			bproof_1 = 13,  bproof_2 = 0
		}
	},

	chaleco_dos = {
		male = {
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			bproof_1 = 13,  bproof_2 = 0
		}
	},

	cinturon_uno = {
		male = {
			tshirt_1 = 134,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 13,  tshirt_2 = 0
		}
	},

	cinturon_dos = {
		male = {
			tshirt_1 = 135,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 13,  tshirt_2 = 0
		}
	},

	boina = {
		male = {
			helmet_1 = 89,  helmet_2 = 0
		},
		female = {
			helmet_1 = 36,  helmet_2 = 1
		},
	}
}
