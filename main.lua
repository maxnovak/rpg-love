function love.load()
    sti = require 'submodules/simple-tiled-implementation/sti'

    windowWidth  = love.graphics.getWidth()
    windowHeight = love.graphics.getHeight()
    love.window.setMode(1200, 800)
    print(windowHeight, windowWidth)

    road = sti('maps/road.lua')
end

function love.draw()
    road:draw(0, 0, 2.5, 2.5)
end
