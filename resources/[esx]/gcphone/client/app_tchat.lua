RegisterNetEvent("gcPhone:tchat_receive")
AddEventHandler("gcPhone:tchat_receive", function(message)
  SendNUIMessage({event = 'tchat_receive', message = message})
end)

RegisterNetEvent("gcPhone:tchat_channelATENAS")
AddEventHandler("gcPhone:tchat_channelATENAS", function(channel, messages)
  SendNUIMessage({event = 'tchat_channel', messages = messages})
end)

RegisterNUICallback('tchat_addMessage', function(data, cb)
  TriggerServerEvent('gcPhone:tchat_addMessage', data.channel, data.message)
end)

RegisterNUICallback('tchat_getChannel', function(data, cb)
  TriggerServerEvent('gcPhone:tchat_channelATENAS', data.channel)
end)
