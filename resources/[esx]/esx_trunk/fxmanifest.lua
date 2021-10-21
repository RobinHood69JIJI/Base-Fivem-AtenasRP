fx_version 'adamant'
game 'gta5'

shared_scripts {
	'@es_extended/locale.lua',
	'locales/es.lua',
  'config.lua'
}

server_scripts {
  '@async/async.lua',
  '@mysql-async/lib/MySQL.lua',
  'server/classes/c_trunk.lua',
  'server/trunk.lua',
  'server/esx_trunk-sv.lua'
}

client_scripts {
  'client/esx_trunk-cl.lua'
}