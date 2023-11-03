function DoCombatDamage(unitID, maxDamage)
    local damageToDeal = maxDamage - math.random(0,4)
    local unit = Combat.enemies[unitID]
    unit.health = unit.health - damageToDeal
    if unit.health <= 0 then
        table.remove(Combat.enemies, unitID)
    end
end

function CheckCombatEnd()
    if #Combat.enemies == 0 then
        Combat.active = false
    end
end