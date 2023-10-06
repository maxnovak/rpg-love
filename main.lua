require 'resize'

function love.load()
    sti = require 'submodules/simple-tiled-implementation/sti'
    anim8 = require 'submodules/anim8/anim8'
    windfield = require 'submodules/windfield/windfield'
    love.graphics.setDefaultFilter("nearest", "nearest")

    window = {translateX = 0, translateY = 0, scale = 2.5, width = 480, height = 320}
    love.window.setMode (1200, 800, {resizable=true, borderless=false})
    resize (1200, 800)

    world = windfield.newWorld(0, 0)
    road = sti('sprites/maps/road.lua')

    player = {x = 530, y = 20, speed = 300}
    player.collider = world:newBSGRectangleCollider(player.x, player.y, 30, 40, 10)
    player.collider:setFixedRotation(true)
    player.spriteSheet = love.graphics.newImage('sprites/characters/player-sheet.png')
    player.grid = anim8.newGrid(12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight(), 1)
    player.animations = {}
    player.animations.down = anim8.newAnimation(player.grid('1-4', 1), 0.2)
    player.animations.left = anim8.newAnimation(player.grid('1-4', 2), 0.2)
    player.animations.right = anim8.newAnimation(player.grid('1-4', 3), 0.2)
    player.animations.up = anim8.newAnimation(player.grid('1-4', 4), 0.2)
    player.anim = player.animations.down

    walls = {}
    if road.layers["Walls"] then
        for i, wall in pairs(road.layers["Walls"].objects) do
            local collider = world:newRectangleCollider(wall.x*window.scale, wall.y*window.scale, wall.width*window.scale, wall.height*window.scale)
            collider:setType('static')
            table.insert(walls, collider)
        end
    end
end

function love.draw()
    road:draw(0, 0, window.scale, window.scale)
    player.anim:draw(player.spriteSheet, player.x-12.5, player.y-25, nil, window.scale, window.scale)
end

function love.update(dt)
    local isMoving = false
    local vx = 0
    local vy = 0

    if love.keyboard.isDown("right") then
        vx = player.speed
        player.anim = player.animations.right
        isMoving = true
    end
    if love.keyboard.isDown("left") then
        vx = -player.speed
        player.anim = player.animations.left
        isMoving = true
    end
    if love.keyboard.isDown("down") then
        vy = player.speed
        player.anim = player.animations.down
        isMoving = true
    end
    if love.keyboard.isDown("up") then
        vy = -player.speed
        player.anim = player.animations.up
        isMoving = true
    end

    player.collider:setLinearVelocity(vx, vy)

    if isMoving == false then
        player.anim:gotoFrame(2)
    end

    world:update(dt)
    player.x = player.collider:getX()
    player.y = player.collider:getY()

    player.anim:update(dt)
end