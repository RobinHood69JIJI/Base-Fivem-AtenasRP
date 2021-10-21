author 'DaniFligk'
description 'Admin Menu for ESX'

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_script {
    'Client/*.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'Server/server.lua',
    'Server/Configserver.lua',
    'Server/Serverlogs.lua'
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/jquery.js',
	'html/init.js',
}