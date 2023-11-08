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
    math.randomseed(os.time())
    STI = require 'submodules/simple-tiled-implementation/sti'
    Anim8 = require 'submodules/anim8/anim8'
    Windfield = require 'submodules/windfield/windfield'
    Flux = require 'submodules/flux/flux'

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
    if not Combat.active then
        DrawWorld()
    end

    if Combat.active then
        DrawCombat()
    end

    if TextToRender then
        DrawDialog(TextToRender)
    end
end

function love.update(dt)
    Flux.update(dt)
    if Zone.alpha == 0 then
        Player.stop = false
    end

    if Combat.active or TextToRender then
        return
    end

    ControlOverworld(dt)
end
