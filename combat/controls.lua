require "combat/state"

function ControlCombat(key)
    if TextToRender then
        if key == "space" then
            if #Event.queuedEvents > 0 then
                TextToRender = Event.queuedEvents[1]
                table.remove(Event.queuedEvents, 1)
                return
            else
                TextToRender = nil
            end
            if Combat.runAttempts == 3 and #Event.queuedEvents == 0 then
                Combat.active = false
            end
        end
        return
    end
    if key == "escape" then
        Combat.subselection = false
    end

    if key == "space" and Combat.selectedAction == "Run" then
        if Combat.runAttempts == 0 then
            TextToRender = "Hey y'all I just want my cow back. Can you just hand it over?"
            table.insert(Event.queuedEvents, "Guy1: What cow? We were told to stop people from crossing here so just hangout.")
            table.insert(Event.queuedEvents, "Um no? I'm gunna beat you up until you give me my cow!")
        end
        if Combat.runAttempts == 1 then
            TextToRender = "Why did someone tell you to block this road? It only leads to my house..."
            table.insert(Event.queuedEvents, "Guy 2: Hmm great question. The boss just said wait here...")
            table.insert(Event.queuedEvents, "Guy 1: Yeah I guess he might not have said we need to block the road.")
        end
        if Combat.runAttempts == 2 then
            TextToRender = "So he didn't actually tell you to block people?"
            table.insert(Event.queuedEvents, "Guy 2: I guess, not?")
            table.insert(Event.queuedEvents, "So can I go through then?")
            table.insert(Event.queuedEvents, "Guy 1: Sure I guess. Good luck finding your cow!")
        end
        Combat.runAttempts = Combat.runAttempts + 1
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