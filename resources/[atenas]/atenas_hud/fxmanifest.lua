fx_version 'adamant'
game 'gta5'

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/main.css',
	'html/app.js'
}

shared_scripts {
	'config.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

dependencies {
	'es_extended'
}