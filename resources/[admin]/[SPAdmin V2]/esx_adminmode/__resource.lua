description 'esx_adminmode - Made with love by Frkz'

version '1.0.0'

server_scripts {

  '@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'server/server.lua',
  'config.lua'

}

client_scripts {

  '@es_extended/locale.lua',
  'config.lua',
  'client/client.lua'

}
