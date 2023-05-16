function startFishing()
    isFishing = true
    Wait(math.random(4000, 6000))
    local timeEnd, currentTime = math.random(800, 1000), 0
    ESX.ShowNotification(("Des poissons ont mordu à l'appât, appuyez sur ~%s~G~s~ pour le remonter."):format(xPeche.ColorMenu))
    while isFishing do
        currentTime = currentTime + 1
        if IsControlJustPressed(1, 47) then
            TriggerServerEvent("xPeche:addItem", xPeche.listFish[math.random(#xPeche.listFish)], math.random(2, 3))
            ClearPedTasksImmediately(PlayerPedId())
            isFishing = false
        end
        if timeEnd == currentTime then isFishing = false ClearPedTasksImmediately(PlayerPedId()) ESX.ShowNotification("(~y~Information~s~)\nVous avez échouez les poissons se sont enfuis.") end
        Wait(0)
    end
end

--- Xed#1188 | https://discord.gg/HvfAsbgVpM
