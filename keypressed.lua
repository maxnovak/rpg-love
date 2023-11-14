require 'menu/controls'

function love.keypressed(key, scancode, isrepeat)
    if Start and key == "space" then
        ControlStartMenu()
    end
    if isrepeat then
        return
    end
    if Combat.active then
        ControlCombat(key)
        return
    end
    if key == "space" then
        PlayerInteract(key)
    end
end