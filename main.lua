require 'resize'

function love.load()
    sti = require 'submodules/simple-tiled-implementation/sti'

    window = {translateX = 0, translateY = 0, scale = 2.5, width = 480, height = 320}
    love.window.setMode (1200, 800, {resizable=true, borderless=false})
    resize (1200, 800)

    road = sti('sprites/maps/road.lua')
end

function love.draw()
    road:draw(0, 0, window.scale, window.scale)
end
