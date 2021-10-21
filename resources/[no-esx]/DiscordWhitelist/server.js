//////////////////////////////////////////
//           Discord Whitelist          //
//////////////////////////////////////////

/// Config Area ///

var guild = "861764973578551316";
var botToken = "ODc0MDI3NzE4OTU2NzAzNzc0.YRA_vg.HDW8TuY34oLrayWoG83zWkNVcOg";

var whitelistRoles = [ // Roles by ID that are whitelisted.
    "861764973578551321"
]

var blacklistRoles = [ // Roles by Id that are blacklisted.
    ""
]

var notWhitelistedMessage = "Verificate en nuestro Discord. discord.gg/atenas"
var noGuildMessage = "Verificate en nuestro Discord. discord.gg/atenas"
var blacklistMessage = "Verificate en nuestro Discord. discord.gg/atenas"
var debugMode = true

/// Code ///
const axios = require('axios').default;
axios.defaults.baseURL = 'https://discord.com/api/v8';
axios.defaults.headers = {
    'Content-Type': 'application/json',
    Authorization: `Bot ${botToken}`
};
function getUserDiscord(source) {
    if(typeof source === 'string') return source;
    if(!GetPlayerName(source)) return false;
    for(let index = 0; index <= GetNumPlayerIdentifiers(source); index ++) {
        if (GetPlayerIdentifier(source, index).indexOf('discord:') !== -1) return GetPlayerIdentifier(source, index).replace('discord:', '');
    }
    return false;
}
on('playerConnecting', (name, setKickReason, deferrals) => {
    let src = global.source;
    deferrals.defer();
    var userId = getUserDiscord(src);

    setTimeout(() => {
        deferrals.update(`${name}, estás siendo verificado, espera un momento.`)
        setTimeout(async function() {
            if(userId) {
                axios(`/guilds/${guild}/members/${userId}`).then((resDis) => {
                    if(!resDis.data) {
                        // if(debugMode) console.log(`'${name}' with ID '${userId}' cannot be found in the assigned guild and was not granted access.`);
                        return deferrals.done(noGuildMessage);
                    }
                    const hasRole = typeof whitelistRoles === 'string' ? resDis.data.roles.includes(whitelistRoles) : resDis.data.roles.some((cRole, i) => resDis.data.roles.includes(whitelistRoles[i]));
                    const hasBlackRole = typeof blacklistRoles === 'string' ? resDis.data.roles.includes(blacklistRoles) : resDis.data.roles.some((cRole, i) => resDis.data.roles.includes(blacklistRoles[i]));
                    if(hasBlackRole) {
                        // if(debugMode) console.log(`'${name}' with ID '${userId}' is blacklisted to join this server.`);
                        return deferrals.done(blacklistMessage);
                    }
                    if(hasRole) {
                        // if(debugMode) console.log(`'${name}' with ID '${userId}' was granted access and passed the whitelist.`);
                        return deferrals.done();
                    } else {
                        // if(debugMode) console.log(`'${name}' with ID '${userId}' is not whitelisted to join this server.`);
                        return deferrals.done(notWhitelistedMessage);
                    }
                }).catch((err) => {
                    // if(debugMode) console.log(`^1There was an issue with the Discord API request. Is the guild ID & bot token correct?^7`);
                });
            } else {
                // if(debugMode) console.log(`'${name}' was not granted access as a Discord identifier could not be found.`);
                return deferrals.done(`Abre Discord y/o autorizale acceso a FiveM`);
            }
        }, 0)
    }, 0)
})