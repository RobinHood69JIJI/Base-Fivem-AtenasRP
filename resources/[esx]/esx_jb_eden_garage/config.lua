Config = {}
Config.Blip			= {sprite= 50, color = 3}
Config.BoatBlip		= {sprite= 410, color = 30}
Config.AirplaneBlip	= {sprite= 90, color = 5}
Config.MecanoBlip	= {sprite= 357, color = 26}
Config.Price		= 3000 -- pound price to get vehicle back
Config.SwitchGaragePrice		= 4000 -- price to pay to switch vehicles in garage
Config.StoreOnServerStart = true -- Store all vehicles in garage on server start?
Config.Locale = 'es'

Config.Garages = {
	Garage_Central = {
		Name = 'Garaje Central',
		-- IconColor = 26,
		Pos = {x=219.25, y=-810.86, z=30.69},
		Marker = { type = 25, w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		HelpPrompt = _U('open_car_garage'),
		SpawnPoint = {
			Pos = {x= 229.5388, y= -799.7523, z= 30.67},
			Heading = 159.37,
			Marker = { type = 25, w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = _U('spawn_car')
		},
		DeletePoint = {
			Pos = {x=214.08, y= -792.6, z= 30.95},
			Marker = { type = 25, w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = _U('store_car')
		}, 	
	},
	Garage_Sandy = {
		Name = 'Garaje de Sandy Shores',
		-- IconColor = 47,
		Pos = {x=1983.06, y=3709.42, z=32.12},
		Marker = { type = 25, w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		HelpPrompt = _U('open_car_garage'),
		SpawnPoint = {
			Pos = {x=1974.8, y= 3713.27, z= 32.20},
			Heading = 55.28,
			Marker = { type = 25, w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = _U('spawn_car')
		},
		DeletePoint = {
			Pos = {x=1965.55, y=3703.92, z=32.35},
			Marker = { type = 25, w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = _U('store_car')
		}, 	
	},
	Garage_Paleto = {
		Name = 'Garaje de Paleto Bay',
		-- IconColor = 1,
		Pos = {x= -136.97, y= 6356.64, z= 31.60},
		Marker = { type = 25, w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		HelpPrompt = _U('open_car_garage'),
		SpawnPoint = {
			Pos = {x= -143.69, y= 6350.66, z= 31.60},
			Heading = 135.84,
			Marker = { type = 25, w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = _U('spawn_car')
		},
		DeletePoint = {
			Pos = {x=-151.36, y= 6358.41, z= 31.60},
			Marker = { type = 25, w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = _U('store_car')
		}, 	
	},
	Garage_Aeropuerto = {
		Name = 'Garaje Aeropuerto',
		-- IconColor = 25,
		Pos = {x= -784.33, y= -2037.55, z= 8.92},
		Marker = { type = 25, w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		HelpPrompt = _U('open_car_garage'),
		SpawnPoint = {
			Pos = {x= -756.18, y= -2051.93, z= 8.92},
			Heading = 50.18,
			Marker = { type = 25, w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = _U('spawn_car')
		},
		DeletePoint = {
			Pos = {x= -756.02, y= -2027.96, z= 8.92},
			Marker = { type = 25, w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = _U('store_car')
		},
	},
	Garage_Bahamas = {
		Name = 'Garaje Comunitario',
		-- IconColor = 24,
		Pos = {x=-1131.53, y=-771.33, z=18.35},
		Marker = { type = 25, w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		HelpPrompt = _U('open_car_garage'),
		SpawnPoint = {
			Pos = {x= -1146.73, y= -753.07, z= 19.35},
			Heading = 211.65,
			Marker = { type = 25, w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = _U('spawn_car')
		},
		DeletePoint = {
			Pos = {x=-1150.09, y= -740.3, z= 20.15},
			Marker = { type = 25, w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = _U('store_car')
		},
	},
}

Config.GaragesMecano = {
	Bennys = {
		Name = _U('bennys_pound'),
		SpawnPoint = {
			Pos = {x = 477.729,y = -1888.856,z = 26.094},
			Heading = 303.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = _U('take_from_pound')
		},
		DeletePoint = {
			Pos = {x = 459.733,y = -1890.335,z = 25.776},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = _U('store_in_pound')
		}, 	
	},
	police = {
		Name = _U('police_pound'),
		SpawnPoint = {
			Pos = {x = 449.253,y = -1024.322,z = 28.57},
			Heading = 100.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = _U('take_from_pound')
		},
		DeletePoint = {
			Pos = {x = 452.305,y = -996.752,z = 25.776},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = _U('store_in_pound')
		}, 	
	},
	police2 = {
		Name = _U('police_pound'),
		SpawnPoint = {
			Pos = {x = 1868.325,y = 3694.566,z = 33.61},
			Heading = 100.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = _U('take_from_pound')
		},
		DeletePoint = {
			Pos = {x = 1860.925,y = 3706.958,z = 33.36},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = _U('store_in_pound')
		}, 	
	},
	police3 = {
		Name = _U('police_pound'),
		SpawnPoint = {
			Pos = {x = -474.000,y = 6029.71,z = 30.94},
			Heading = 226.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = _U('take_from_pound')
		},
		DeletePoint = {
			Pos = {x = -462.932,y = 60.41,z = 31.34},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = _U('store_in_pound')
		}, 	
	},
	-- Bennys2 = {
		-- Marker = 1,
		-- SpawnPoint = {
			-- Pos = {x=-190.455, y= -1290.654, z= 30.295},
			-- Color = {r=0,g=255,b=0},
			-- Size  = {x = 3.0, y = 3.0, z = 1.0},
			-- Marker = 1
		-- },
		-- DeletePoint = {
			-- Pos = {x=-190.379, y=-1284.667, z=30.233},
			-- Color = {r=255,g=0,b=0},
			-- Size  = {x = 3.0, y = 3.0, z = 1.0},
			-- Marker = 1
		-- }, 	
	-- },
}

Config.BoatGarages = {
	BoatGarage_Centre = {
		Pos = {x = -742.47064208984,y = -1332.4702148438,z = 1.59 },
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = _U('boat_garage_name'),
		HelpPrompt = _U('open_boat_garage'),
		SpawnPoint = {
			Pos = {x = -736.47064208984,y = -1342.4702148438,z = 1.0 },
			MarkerPos = {x = -733.58,y = -1338.62,z = 1.5 },
			Heading = 230.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = _U('spawn_boat')
		},
		DeletePoint = {
			Pos = {x = -740.06408691406,y = -1361.8474121094,z = 1.8801808655262 },
			Marker = { w= 3.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = _U('store_boat')
		}, 	
	},
}

Config.AirplaneGarages = {
	AirplaneGarage_Centre = {
		Pos = {x = -1280.1153564453,y = -3378.1647949219,z = 13.940155029297 },
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = _U('plane_garage_name'),
		HelpPrompt = _U('open_plane_garage'),
		SpawnPoint = {
			Pos = {x = -1285.1153564453,y = -3382.1647949219,z = 13.940155029297 },
			Heading = 160.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = _U('spawn_plane')
		},
		DeletePoint = {
			Pos = {x = -1287.5788574219,y = -3390.4025878906,z = 13.940155029297 },
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = _U('store_plane')
		}, 	
	},
}


Config.SocietyGarages = {
	police =  { -- database job name
		{
			Pos = {x = 446.39,y = -984.844,z = 30.696 },
			Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
			Name = _U('police_garage_name'),
			HelpPrompt = _U('open_police_garage'),
			SpawnPoint = {
				Pos = {x = -1285.1153564453,y = -3382.1647949219,z = 13.940155029297 },
				Heading = 160.0,
				Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
				HelpPrompt = _U('spawn_police_garage')
			},
			DeletePoint = {
				Pos = {x = -1287.5788574219,y = -3390.4025878906,z = 13.940155029297 },
				Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
				HelpPrompt = _U('store_police_garage')
			}, 	
		},
		{
			Pos = {x = 448.1153564453,y = -976.86,z = 30.696 },
			Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
			Name = _U('police_garage_name'),
			HelpPrompt = _U('open_police_garage'),
			SpawnPoint = {
				Pos = {x = -1285.1153564453,y = -3382.1647949219,z = 13.940155029297 },
				Heading = 160.0,
				Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
				HelpPrompt = _U('spawn_police_garage')
			},
			DeletePoint = {
				Pos = {x = -1287.5788574219,y = -3390.4025878906,z = 13.940155029297 },
				Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
				HelpPrompt = _U('store_police_garage')
			}, 	
		},
	},
	brinks =  {
		{
			Pos = {x = 443.1153564453,y = -993.86,z = 30.696 },
			Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
			Name = _U('brinks_garage_name'),
			HelpPrompt = _U('open_brinks_garage'),
			SpawnPoint = {
				Pos = {x = -1285.1153564453,y = -3382.1647949219,z = 13.940155029297 },
				Heading = 160.0,
				Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
				HelpPrompt = _U('spawn_brinks_garage')
			},
			DeletePoint = {
				Pos = {x = -1287.5788574219,y = -3390.4025878906,z = 13.940155029297 },
				Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
				HelpPrompt = _U('store_brinks_garage')
			}, 	
		},
    },
	ambulance =  {
		{
			Pos = {x = 443.1153564453,y = -993.86,z = 30.696 },
			Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
			Name = _U('ambulance_garage_name'),
			HelpPrompt = _U('open_ambulance_garage'),
			SpawnPoint = {
				Pos = {x = -1285.1153564453,y = -3382.1647949219,z = 13.940155029297 },
				Heading = 160.0,
				Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
				HelpPrompt = _U('spawn_ambulance_garage')
			},
			DeletePoint = {
				Pos = {x = -1287.5788574219,y = -3390.4025878906,z = 13.940155029297 },
				Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
				HelpPrompt = _U('store_ambulance_garage')
			}, 	
		},
	},
	taxi =  {
		{
			Pos = {x = 443.1153564453,y = -993.86,z = 30.696 },
			Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
			Name = _U('taxi_garage_name'),
			HelpPrompt = _U('open_taxi_garage'),
			SpawnPoint = {
				Pos = {x = -1285.1153564453,y = -3382.1647949219,z = 13.940155029297 },
				Heading = 160.0,
				Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
				HelpPrompt = _U('spawn_taxi_garage')
			},
			DeletePoint = {
				Pos = {x = -1287.5788574219,y = -3390.4025878906,z = 13.940155029297 },
				Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
				HelpPrompt = _U('store_taxi_garage')
			}, 	
		},
    },
}
