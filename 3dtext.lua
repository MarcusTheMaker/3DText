-- (Mitby jobcenter) <x,y,z>
local v1 = vector3(191.28843688965,-931.04290771484,31.686805725098)
-- (Politi våben) <x,y,z>
local v3 = vector3(451.7265625,-980.03564453125,30.989594268799)


--Udesende 
function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.40)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(20, 149, 0, 200)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end
--Distance for hvor langt væk man skal være for ikke at kunne se texten
local distance_until_text_disappears = 2000

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

            if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance_until_text_disappears then
                Draw3DText(v1.x,v1.y,v1.z, "Her kan du vælge et job")
            end
    end
end)


--Distance for hvor langt væk man skal være for ikke at kunne se texten
local text_distance = 16

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

            if Vdist2(GetEntityCoords(PlayerPedId(), false), v3) < text_distance then
                Draw3DText(v3.x,v3.y,v3.z, "Våbenskab")
            end
    end
end)