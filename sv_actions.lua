ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)





RegisterServerEvent('curse:SetBuy')
AddEventHandler('curse:SetBuy', function(itemName, price)
	local xPlayer  = ESX.GetPlayerFromId(source)
	if xPlayer.canCarryItem(itemName, 1) then
		if xPlayer.getMoney() > price then
			xPlayer.addInventoryItem(itemName,1)
			xPlayer.removeMoney(price)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You paid ' .. price, })
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Not enough money', })
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Can not carry', })
	end
end)	
