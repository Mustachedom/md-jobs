fx_version 'cerulean'
game 'gta5'

description 'md-jobs'
version '1.0.0'

shared_scripts {
    'shared/**.lua',
    '@ox_lib/init.lua',
}

client_script {
    'client/**.lua',
    '@qbx_core/modules/playerdata.lua', -- uncomment out if you're using qbx
}
server_script{
    '@oxmysql/lib/MySQL.lua',
    'server/locations/**.lua',
    'server/functions.lua',
    'server/jobs.lua',
    'server/catering.lua',
    'server/closedshops.lua',
    'server/consumables.lua',
}

lua54 'yes'
