function DoCombatDamage(unitID, maxDamage)
    local damageToDeal = maxDamage - math.random(0,4)
    local unit = Combat.enemies[unitID]
    unit.health = unit.health - damageToDeal
    if unit.health <= 0 then
        table.remove(Combat.enemies, unitID)
    end
end

function CheckPlayerVictory()
    if #Combat.enemies == 0 then
        Combat.active = false
        TextToRender = "You kicked their butts"
    end
end

function CheckPlayerLoss()
    if Combat.currentPlayerHealth <= 0 then
        Combat.active = false
        TextToRender = "You Died"
    end
end

function UseItem(itemID)
    local item = Player.inventory[itemID]
    if item.name == Carrot.name then
        if Combat.currentPlayerHealth == Combat.maxPlayerHealth then
            TextToRender = "You're full up and don't need to eat anything"
            return
        end
        TextToRender = "Carrot tastes pretty good, and you feel a little healthier"
        local healAmount = Carrot.healAmount
        if Carrot.healAmount + Combat.currentPlayerHealth > Combat.maxPlayerHealth then
            Combat.currentPlayerHealth = Combat.maxPlayerHealth
        else
            Combat.currentPlayerHealth = Combat.currentPlayerHealth + healAmount
        end
        item.number = item.number - 1
        if item.number <= 0 then
            table.remove(Player.inventory, itemID)
        end

    end
end

function EnemyAction()
    table.insert(Event.queuedEvents, "They hit you in the face for 5 damage")
    Combat.currentPlayerHealth = Combat.currentPlayerHealth - 5
end