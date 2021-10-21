--Configuración básica del servidor
Config = {}

Config.Vehicle = 'boxville4'
Config.ExperienceSystem = false
Config.IsMyClothActive = false

Config.MaxPackages = 5

Config.NPCs = {
    {
        coords = {
            x = -17.28,  
            y = 6303.32,  
            z = 30.36,
            h = 0.0
        },
        text = 'Paco el mensajero',
        distance = 3.0,
        func = 'createJob',
        hash = -1922568579
    }
}

Config.Points = {
    ['warehouse'] = {
        x = 3.36,  
        y = 6310.68,  
        z = 31.24
    },
    ['spawner'] = {
        x = -5.72,  
        y = 6330.68,  
        z = 31.24
    }
}

Config.Blips = {
    {name = 'Amazon', display = 4,colour = 44, id = 76, coords = vector3(-17.28, 6303.32, 30.36)}
}

Config.Destinations = {
    {x = -237.76,  y = 6423.0,  z = 31.28},
    {x = -214.32,  y = 6396.64,  z = 33.08},
    {x = -189.4,  y = 6409.92,  z = 32.2},
    {x = -157.32,  y = 6409.64,  z = 31.92},
    {x = -150.76,  y = 6421.84,  z = 31.92},
    {x = -159.92,  y = 6431.48,  z = 31.92},
    {x = -105.44,  y = 6529.16,  z = 30.16},
    {x = -41.0,  y = 6637.0,  z = 31.08},
    {x = -26.84,  y = 6597.72,  z = 31.88},
    {x = -8.76,  y = 6653.04,  z = 31.12},
    {x = 35.16,  y = 6662.16,  z = 32.2},
    {x = 32.64,  y = 6595.6,  z = 32.48},
    {x = 13.08,  y = 6577.2,  z = 32.72},
    {x = 4.28,  y = 6568.04,  z = 32.88},
    {x = -14.96,  y = 6557.76,  z = 33.24},
    {x = -11.6,  y = 6500.12,  z = 31.48},
    {x = -21.2,  y = 6490.88,  z = 31.48},
    {x = -31.52,  y = 6481.24,  z = 31.48},
    {x = -39.88,  y = 6472.36,  z = 31.52},
    {x = -50.92,  y = 6459.72,  z = 31.52},
    {x = -333.24,  y = 6302.68,  z = 33.08},
}