isFishing = false

RegisterNetEvent("xPeche:useCanne")
AddEventHandler("xPeche:useCanne", function()
    if GetEntityCoords(PlayerPedId()).z > -1 and GetEntityCoords(PlayerPedId()).z < 2 then
        if not isFishing then
            ESX.TriggerServerCallback("xPeche:getItem", function(haveItem) 
                if haveItem then
                    isFishing = true
                    TriggerServerEvent("xPeche:removeItem", "appat", 1)
                    TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_STAND_FISHING', 0, true)
                    startFishing()
                end
            end, "appat")
        else
            ESX.ShowNotification("(~r~Erreur~s~)\nVous pêchez déjà.")
        end
    else
        ESX.ShowNotification("(~r~Erreur~s~)\nVous devez être dans l'eau.")
    end
end)

--- Xed#1188 | https://discord.gg/HvfAsbgVpM
