function ControlCombat(dt)
    if not Combat.subselection then
        if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
            Combat.selectedAction = "Run"
        end
        if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
            Combat.selectedAction = "Fight"
        end
        if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
            Combat.selectedAction = "Use Item"
        end
        if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
            Combat.selectedAction = "Fight"
        end

        if love.keyboard.isDown("space") then
            Combat.subselection = true
        end
    end

end