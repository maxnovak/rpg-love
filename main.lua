require 'resize'
require 'player/setup'
require 'world/setup'
require 'world/dialogue'

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
    Zone:draw(0, 0, Window.scale, Window.scale)
    Player.anim:draw(Player.spriteSheet, Player.x-12.5, Player.y-25, nil, Window.scale, Window.scale)
    if TextToRender then
        love.graphics.print(TextToRender)
    end
end

function love.update(dt)
    local isMoving = false
    local vx = 0
    local vy = 0

    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        vx = Player.speed
        Player.anim = Player.animations.right
        isMoving = true
        Player.direction = "right"
    end
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        vx = -Player.speed
        Player.anim = Player.animations.left
        isMoving = true
        Player.direction = "left"
    end
    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        vy = Player.speed
        Player.anim = Player.animations.down
        isMoving = true
        Player.direction = "down"
    end
    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        vy = -Player.speed
        Player.anim = Player.animations.up
        isMoving = true
        Player.direction = "up"
    end

    if love.keyboard.isDown("space") then
        local px, py = Player.collider:getPosition()
        if Player.direction == "right" then
            px = px + 60
        elseif Player.direction == "left" then
            px = px - 60
        elseif Player.direction == "up" then
            py = py - 60
        elseif Player.direction == "down" then
            py = py + 60
        end
        local colliders = World:queryCircleArea(px, py, 5, {"Chest", "Sign"})
        if #colliders > 0 then
            for i, chest in pairs(Chests) do
                if chest.x*Window.scale == colliders[1]:getX()
                 and chest.y*Window.scale == colliders[1]:getY() then
                    print(chest.id)
                end
            end
            for i, sign in pairs(Signs) do
                if sign.x*Window.scale == colliders[1]:getX()
                 and sign.y*Window.scale == colliders[1]:getY() then
                    print(sign.id)
                end
            end
            local itemToRemove
            for i, item in pairs(Items) do
                if item.x*Window.scale == colliders[1]:getX()
                 and item.y*Window.scale == colliders[1]:getY()
                 and item.status == "ItemPresent" then
                    TextToRender = Dialogue[item.status]
                    itemToRemove = colliders[1]
                end
            end
            if itemToRemove then
                itemToRemove:destroy()
            end
        end
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
