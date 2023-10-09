require 'resize'
require 'player/setup'
require 'world/setup'

function love.load()
    STI = require 'submodules/simple-tiled-implementation/sti'
    Anim8 = require 'submodules/anim8/anim8'
    Windfield = require 'submodules/windfield/windfield'

    love.graphics.setDefaultFilter("nearest", "nearest")

    Window = {translateX = 0, translateY = 0, scale = 2.5, width = 480, height = 320}
    love.window.setMode (1200, 800, {resizable=false, borderless=false})

    SetupWorld()
    SetUpPlayer()
end

function love.draw()
    Road:draw(0, 0, Window.scale, Window.scale)
    Player.anim:draw(Player.spriteSheet, Player.x-12.5, Player.y-25, nil, Window.scale, Window.scale)
end

function love.update(dt)
    local isMoving = false
    local vx = 0
    local vy = 0

    if love.keyboard.isDown("right") then
        vx = Player.speed
        Player.anim = Player.animations.right
        isMoving = true
    end
    if love.keyboard.isDown("left") then
        vx = -Player.speed
        Player.anim = Player.animations.left
        isMoving = true
    end
    if love.keyboard.isDown("down") then
        vy = Player.speed
        Player.anim = Player.animations.down
        isMoving = true
    end
    if love.keyboard.isDown("up") then
        vy = -Player.speed
        Player.anim = Player.animations.up
        isMoving = true
    end

    Player.collider:setLinearVelocity(vx, vy)

    if isMoving == false then
        Player.anim:gotoFrame(2)
    end

    World:update(dt)
    Player.x = Player.collider:getX()
    Player.y = Player.collider:getY()

    Player.anim:update(dt)
end
