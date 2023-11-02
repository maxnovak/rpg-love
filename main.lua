require 'keypressed'
require 'resize'
require 'combat/controls'
require 'combat/render'
require 'combat/setup'
require 'player/setup'
require 'world/controls'
require 'world/render'
require 'world/setup'

function love.load()
    STI = require 'submodules/simple-tiled-implementation/sti'
    Anim8 = require 'submodules/anim8/anim8'
    Windfield = require 'submodules/windfield/windfield'

    love.graphics.setDefaultFilter("nearest", "nearest")

    Window = {translateX = 0, translateY = 0, scale = 2.5, width = 1200, height = 800}
    love.window.setMode (Window.width, Window.height, {resizable=false, borderless=false})

    ItemToRemove = {}
    ItemToRemove.newImage = love.graphics.newImage('sprites/maps/mystic_woods_free_2.1/sprites/tilesets/plains.png')
    ItemToRemove.imageQuad = love.graphics.newQuad(32, 16, 16, 16, ItemToRemove.newImage)
    ItemToRemove.coordinates = {}

    SetupWorld()
    SetUpPlayer()
    LoadZone("House")
end

function love.draw()
    if Combat.active then
        DrawCombat()
        return
    end

    DrawWorld()
end

function love.update(dt)
    if Combat.active then
        return
    end

    ControlOverworld(dt)
end
