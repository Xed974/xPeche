local open = false
local mainMenu = RageUI.CreateMenu("Acheteur poisson", "Interaction", nil, nil, "root_cause5", xPeche.Banner)
mainMenu.Closed = function() open = false FreezeEntityPosition(PlayerPedId(), false) end

local function menuVente()
    if open then
        open = false
        RageUI.Visible(mainMenu, false)
    else
        open = true
        RageUI.Visible(mainMenu, true)
        Citizen.CreateThread(function()
            while open do
                Wait(0)
                RageUI.IsVisible(mainMenu, function()
                    for _,v in pairs(xPeche.dealerFish.list) do
                        RageUI.Button(v.Label, v.Description, {RightLabel = ("~g~%s$~s~/u"):format(v.Price)}, true, {
                            onSelected = function()
                                ESX.TriggerServerCallback("xPeche:getItem", function(haveItem) 
                                    if haveItem then
                                        TriggerServerEvent("xPeche:removeItem", v.Name, 1)
                                        TriggerServerEvent("xPeche:addMoney", v.Price)
                                    end
                                end, v.Name)
                            end
                        })
                    end
                end)
            end
        end)
    end
end

CreateThread(function()
    while true do
        local wait = 1000
        local pos = xPeche.dealerFish.pos
        local pPos = GetEntityCoords(PlayerPedId())
        local dst = Vdist(pPos, pos)

        if dst <= 3.0 then
            wait = 0
            DrawMarker(xPeche.MarkerType, pos.x, pos.y, pos.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, xPeche.MarkerSizeLargeur, xPeche.MarkerSizeEpaisseur, xPeche.MarkerSizeHauteur, xPeche.MarkerColorR, xPeche.MarkerColorG, xPeche.MarkerColorB, xPeche.MarkerOpacite, xPeche.MarkerSaute, true, p19, xPeche.MarkerTourne)
        end
        if dst <= 1.0 then
            wait = 0
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour intéragir.")
            if IsControlJustPressed(1, 51) then
                FreezeEntityPosition(PlayerPedId(), true)
                menuVente()
            end
        end

        Wait(wait)
    end
end)