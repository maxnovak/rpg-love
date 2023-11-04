require "combat/state"

function ControlCombat(key)
    if TextToRender then
        if key == "space" then
            if #Event.queuedEvents > 0 then
                TextToRender = Event.queuedEvents[1]
                table.remove(Event.queuedEvents)
            else
                TextToRender = nil
            end
        end
        return
    end
    if key == "escape" then
        Combat.subselection = false
    end

    if key == "space" and Combat.selectedAction == "Run" then
        TextToRender = "Got away"
        Combat.active = false
        return
    end

    if not Combat.subselection then
        if key == "down" or key == "s" then
            Combat.selectedAction = "Run"
        end
        if key == "up" or key == "w" then
            Combat.selectedAction = "Fight"
        end
        if key == "right" or key == "d" then
            Combat.selectedAction = "Use Item"
        end
        if key == "left" or key == "a" then
            Combat.selectedAction = "Fight"
        end
        if key == "space" then
            Combat.subselection = true
            Combat.subselectionItem = 1
            return
        end
    end

    if Combat.subselection then
        if key == "space" then
            if Combat.selectedAction == "Fight" then
                DoCombatDamage(Combat.subselectionItem, Combat.maxPlayerDamage)
                if CheckPlayerVictory() then
                    Combat.active = false
                    TextToRender = "You kicked their butts"
                    return
                end
                EnemyAction()
            end
            if Combat.selectedAction == "Use Item" then
                if #Player.inventory == 0 then
                    TextToRender = "You have nothing to use"
                    Combat.subselection = false
                    return
                end
                UseItem(Combat.subselectionItem)
            end
            CheckPlayerLoss()
            return
        end
        if key == "right" then
            if Combat.selectedAction == "Fight" then
                if Combat.subselectionItem == #Combat.enemies then
                    return
                end
            end
            if Combat.selectedAction == "Use Item" then
                if Combat.subselectionItem == #Player.inventory then
                    return
                end
            end
            Combat.subselectionItem = Combat.subselectionItem + 1
        end
        if key == "left" then
            if Combat.subselectionItem == 1 then
                return
            end
            Combat.subselectionItem = Combat.subselectionItem - 1
        end
    end
end