Config = {}
Config.Locale = 'es'

Config.Marker = {
	r = 20, g = 245, b = 170, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 2
Config.TimerBeforeNewRob    = 600 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

Stores = {
	["paleto_twentyfourseven"] = {
		position = { x = 1736.32, y = 6419.47, z = 35.03 },
		reward = math.random(20000, 40000),
		nameOfStore = "24/7. ~b~(Paleto Bay)",
		secondsRemaining = 500, -- seconds
		lastRobbed = 0,
		police = 2
	},
	["sandyshores_twentyfoursever"] = {
		position = { x = 1394.3, y = 3615.44, z = 37.94 },
		reward = math.random(20000, 40000),
		nameOfStore = "24/7. ~b~(Sandy Shores)",
		secondsRemaining = 500, -- seconds
		lastRobbed = 0,
		police = 2
	},
	["littleseoul_twentyfourseven"] = {
		position = { x = -709.17, y = -904.21, z = 19.21 },
		reward = math.random(20000, 40000),
		nameOfStore = "24/7. ~b~(Little Seoul)",
		secondsRemaining = 500, -- seconds
		lastRobbed = 0,
		police = 2
	},
	["bar_one"] = {
		position = { x = 1990.57, y = 3044.95, z = 47.21 },
		reward = math.random(50000, 80000),
		nameOfStore = "Yellow Jack. ~b~(Sandy Shores)",
		secondsRemaining = 500, -- seconds
		lastRobbed = 0,
		police = 2
	},
	["ocean_liquor"] = {
		position = { x = -2959.33, y = 388.21, z = 14.00 },
		reward = math.random(20000, 40000),
		nameOfStore = "Robs Liquor. ~b~(Great Ocean Highway)",
		secondsRemaining = 500, -- seconds
		lastRobbed = 0,
		police = 2
	},
	["rancho_liquor"] = {
		position = { x = 1126.80, y = -980.40, z = 45.41 },
		reward = math.random(20000, 40000),
		nameOfStore = "Robs Liquor. ~b~(El Rancho Blvd)",
		secondsRemaining = 500, -- seconds
		lastRobbed = 0,
		police = 2
	},
	["sanandreas_liquor"] = {
		position = { x = -1219.85, y = -916.27, z = 11.32 },
		reward = math.random(20000, 40000),
		nameOfStore = "Robs Liquor. ~b~(San Andreas Avenue)",
		secondsRemaining = 500, -- seconds
		lastRobbed = 0,
		police = 2
	},
	["grove_ltd"] = {
		position = { x = -43.40, y = -1749.20, z = 29.42 },
		reward = math.random(20000, 40000),
		nameOfStore = "LTD Gasoline. ~b~(Grove Street)",
		secondsRemaining = 500, -- seconds
		lastRobbed = 0,
		police = 2
	},
	["mirror_ltd"] = {
		position = { x = 1160.67, y = -314.40, z = 69.20 },
		reward = math.random(20000, 40000),
		nameOfStore = "LTD Gasoline. ~b~(Mirror Park Boulevard)",
		secondsRemaining = 500, -- seconds
		lastRobbed = 0,
		police = 2
	},
    ["shop"] = {
        position = { x = 6.37, y = 6508.74, z = 31.60 },
        reward = math.random(50000,65000),
        nameOfStore = "Tienda. ~b~(Tienda)",
        secondsRemaining = 500, -- seconds
        lastRobbed = 0,
        police = 2
	},
	["shop2"] = {
        position = { x = 30.05, y = -1340.22, z = 29.5 },
        reward = math.random(50000,65000),
        nameOfStore = "Tienda. ~b~(Tienda)",
        secondsRemaining = 500, -- seconds
        lastRobbed = 0,
        police = 2
	},
	["shop3"] = {
        position = { x = 379.68, y = -332.6, z = 103.57 },
        reward = math.random(50000,65000),
        nameOfStore = "Tienda. ~b~(Tienda)",
        secondsRemaining = 500, -- seconds
        lastRobbed = 0,
        police = 2
	},
	["shop4"] = {
        position = { x = 2549.94, y = 386.59, z = 108.62 },
        reward = math.random(50000,65000),
        nameOfStore = "Tienda Este. ~b~(Tienda Este)",
        secondsRemaining = 500, -- seconds
        lastRobbed = 0,
        police = 2
	},
	["shop5"] = {
        position = { x = 1706.95, y = 4920.07, z = 42.06 },
        reward = math.random(50000,65000),
        nameOfStore = "Tienda Norte. ~b~(Tienda Norte)",
        secondsRemaining = 500, -- seconds
        lastRobbed = 0,
        police = 2
    },
    ["blainecounty"] = {
        position = { x = -107.06505584717, y = 6474.8012695313, z = 31.63 },
        reward = math.random(120000,150000),
        nameOfStore = "Banco de Blaine Country. ~b~(Banco de Blaine Country)",
        secondsRemaining = 500, -- seconds
        lastRobbed = 0,
        police = 3
    },
    
    ["Pacific_Standart"] = {
        position = { x = 248.71, y = 230.08, z = 106.29 },
        reward = math.random(160000,200000),
        nameOfStore = "Gran Banco. ~b~(Gran Banco)",
        secondsRemaining = 900, -- seconds
        lastRobbed = 0,
        police = 5
    },

    ["Fleeca_bank"] = {
        position = { x = -2957.563, y = 481.5409, z = 15.71 },
        reward = math.random(100000,120000),
        nameOfStore = "Banco de Fleeca Norte. ~b~(Banco de Fleeca Norte)",
        secondsRemaining = 500, -- seconds
        lastRobbed = 0,
        police = 3
    },

    ["Fleeca_bank2"] = {
        position = { x = 147.0688, y = -1044.955, z = 29.37 },
        reward = math.random(100000,120000),
        nameOfStore = "Banco de Fleeca Sur. ~b~(Banco de Fleeca Sur)",
        secondsRemaining = 500, -- seconds
        lastRobbed = 0,
        police = 3
	},
	
	["Fleeca_bank3"] = {
        position = { x = 310.78, y = -282.99, z = 54.17 },
        reward = math.random(100000,120000),
        nameOfStore = "Banco de Fleeca Noreste. ~b~(Banco de Fleeca Noreste)",
        secondsRemaining = 500, -- seconds
        lastRobbed = 0,
        police = 3
	},
		
	["Fleeca_bank4"] = {
        position = { x = -353.66, y = -54.35, z = 49.04 },
        reward = math.random(100000,120000),
        nameOfStore = "Banco de Fleeca. ~b~(Banco de Fleeca)",
        secondsRemaining = 500, -- seconds
        lastRobbed = 0,
        police = 3
	},
			
	["Fleeca_bank5"] = {
        position = { x = -1211.49, y = -335.62, z = 37.78 },
        reward = math.random(100000,120000),
        nameOfStore = "Banco de Fleeca. ~b~(Banco de Fleeca)",
        secondsRemaining = 500, -- seconds
        lastRobbed = 0,
        police = 3
	},

}