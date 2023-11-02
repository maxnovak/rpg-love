function ControlCombat(key)
    if key == "escape" then
        Combat.subselection = false
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
            return
        end
        if key == "space" and Combat.selectedAction == "Run" then
            TextToRender = "Got away"
            Combat.active = false
            return
        end
    end

end