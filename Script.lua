local TAMANO_HITBOX = 10
local ACTUALIZAR_CADA = 1

local function esMoneda(objeto)
    if not objeto:IsA("BasePart") then return false end
    
    local nombre = string.lower(objeto.Name)
    if string.find(nombre, "coin") or string.find(nombre, "moneda") then
        return true
    end
    
    if objeto:FindFirstChild("TouchInterest") then
        return true
    end
    
    return false
end

local function expandirHitboxMonedas()
    for _, objeto in pairs(workspace:GetDescendants()) do
        if esMoneda(objeto) then
            pcall(function()
                objeto.Size = Vector3.new(TAMANO_HITBOX, TAMANO_HITBOX, TAMANO_HITBOX)
            end)
        end
    end
end

task.spawn(function()
    while true do
        expandirHitboxMonedas()
        task.wait(ACTUALIZAR_CADA)
    end
end)

print("[Hitbox Coins] Script cargado. Solo las monedas serán agrandadas.")
