require 'resize'

function love.load()
    sti = require 'submodules/simple-tiled-implementation/sti'
    anim8 = require 'submodules/anim8/anim8'
    love.graphics.setDefaultFilter("nearest", "nearest")

    window = {translateX = 0, translateY = 0, scale = 2.5, width = 480, height = 320}
    love.window.setMode (1200, 800, {resizable=true, borderless=false})
    resize (1200, 800)

    road = sti('sprites/maps/road.lua')

    player = {x = 400,y = 200,speed = 5}
    player.spriteSheet = love.graphics.newImage('sprites/characters/player-sheet.png')
    player.grid = anim8.newGrid(12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())
    player.animations = {}
    player.animations.down = anim8.newAnimation(player.grid('1-4', 1), 0.2)
    player.animations.left = anim8.newAnimation(player.grid('1-4', 2), 0.2)
    player.animations.right = anim8.newAnimation(player.grid('1-4', 3), 0.2)
    player.animations.up = anim8.newAnimation(player.grid('1-4', 4), 0.2)
    player.anim = player.animations.left
end

function love.draw()
    road:draw(0, 0, window.scale, window.scale)
    player.anim:draw(player.spriteSheet, player.x, player.y, nil, window.scale, window.scale)
end

function love.update(dt)
    local isMoving = false
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed
        player.anim = player.animations.right
        isMoving = true
    end
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed
        player.anim = player.animations.left
        isMoving = true
    end
    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
        player.anim = player.animations.down
        isMoving = true
    end
    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
        player.anim = player.animations.up
        isMoving = true
    end

    if isMoving == false then
        player.anim:gotoFrame(2)
    end

    player.anim:update(dt)
end