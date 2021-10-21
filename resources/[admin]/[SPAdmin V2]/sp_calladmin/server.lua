local DISCORD_WEBHOOK = ""


RegisterServerEvent('calladmin')
AddEventHandler('calladmin', function(data)



    local connect = {
        {
            ["color"] = "0",
            ["title"] = "⚠️ New Report ⚠️",
            ["description"] = "🔻 First Name 🔻 \n\n **"..data.plate.."** \n\n 🔻 Last Name 🔻 \n\n **"..data.lastname.."** \n\n 🔻 Hours 🔻 \n\n **"..data.age.."** \n\n 🔻 Information 🔻 \n\n**"..data.why.."**\n\n 🔻 Type 🔻\n\n **"..data.gender.."**",
	        ["footer"] = {
                ["text"] = "🔰 SP Admin V2 🔰",
            },
        }
    }
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = "©️ SP Admin",  avatar_url = "https://static.wikia.nocookie.net/among-us-wiki/images/9/94/Report.png/revision/latest?cb=20201016191700",embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

