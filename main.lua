require 'resize'
require 'player/dialogueBox'
require 'player/setup'
require 'world/setup'
require 'world/dialogue'

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
    Zone:draw(0, 0, Window.scale, Window.scale)
    if #ItemToRemove.coordinates > 0 then
        for i, item in ipairs(ItemToRemove.coordinates) do
            if item.zone == Zone.name then
                love.graphics.draw(ItemToRemove.newImage, ItemToRemove.imageQuad, item.x-20, item.y-20, nil,  Window.scale, Window.scale)
            end
        end
    end
    Player.anim:draw(Player.spriteSheet, Player.x-12.5, Player.y-25, nil, Window.scale, Window.scale)
    if TextToRender then
        DrawDialog(TextToRender)
    end
end

function love.update(dt)
    local isMoving = false
    local vx = 0
    local vy = 0

    if TextToRender and Dialogue.timer > 0 then
        Dialogue.timer = Dialogue.timer - dt
        return
    end

    if TextToRender then
        if love.keyboard.isDown("space") then
            TextToRender = nil
        end
        return
    end

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
        local colliders = World:queryCircleArea(px, py, 5, {"Chest", "Sign", "Item"})
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
            for i, item in pairs(Items) do
                if item.x*Window.scale == colliders[1]:getX()
                 and item.y*Window.scale == colliders[1]:getY()
                 and item.status == "ItemPresent" then
                    TextToRender = Dialogue[item.status]
                    Dialogue.timer = 0.3
                    ItemToRemove.collider = colliders[1]
                    table.insert(ItemToRemove.coordinates, {x = colliders[1]:getX(), y = colliders[1]:getY(), zone = Zone.name})
                end
            end
            if ItemToRemove.collider then
                ItemToRemove.collider:destroy()
            end
        end
    end

    if Player.collider:enter('Exit') then
        local collisionData = Player.collider:getEnterCollisionData('Exit')
        LoadZone(collisionData.collider.id, collisionData.collider.nextX, collisionData.collider.nextY)
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
