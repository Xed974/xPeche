ESX.RegisterUsableItem("cannepeche", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end
    TriggerClientEvent("xPeche:useCanne", xPlayer.source)
end)

ESX.RegisterServerCallback("xPeche:getItem", function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end if type(item) ~= "string" then return end
    if xPlayer.getInventoryItem(item).count > 0 then
        cb(true)
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, ('(~r~Erreur~s~)\nVouns n\'avez pas assez de ~r~%s~s~.'):format(ESX.GetItemLabel(item)))
    end
end)

RegisterNetEvent("xPeche:removeItem")
AddEventHandler("xPeche:removeItem", function(item, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end if type(item) ~= "string" or type(cb) ~= "number" then return end
    xPlayer.removeInventoryItem(item, cb)
end)

RegisterNetEvent("xPeche:addItem")
AddEventHandler("xPeche:addItem", function(item, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end if type(item) ~= "string" or type(cb) ~= "number" then return end
    xPlayer.addInventoryItem(item, cb)
    TriggerClientEvent('esx:showNotification', xPlayer.source, ('(~g~Succès~s~)\nVous avez ramasser ~%s~x%s %s~s~.'):format(xPeche.ColorMenu, cb, ESX.GetItemLabel(item)))
end)

RegisterNetEvent("xPeche:addMoney")
AddEventHandler("xPeche:addMoney", function(cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end if type(cb) ~= "number" then return end
    if #(xPeche.dealerFish.pos - GetEntityCoords(GetPlayerPed(xPlayer.source))) < 1.0  then
        xPlayer.addMoney(cb)
    end
end)

--- Xed#1188 | https://discord.gg/HvfAsbgVpM
