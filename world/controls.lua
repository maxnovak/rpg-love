require 'world/dialogue'
require 'world/events'
require 'world/items'

function PlayerInteract(key)
    if TextToRender then
        TextToRender = nil
        if #Event.queuedEvents > 0 then
            TextToRender = EventPrompt[Event.queuedEvents[1]]
            Event.status = Event.queuedEvents[1]
            table.remove(Event.queuedEvents)
        end
        return
    end

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
    local colliders = World:queryCircleArea(px, py, 5, {"Sign", "Item"})
    if #colliders > 0 then
        for i, sign in pairs(Signs) do
            if sign.x*Window.scale == colliders[1]:getX()
                and sign.y*Window.scale == colliders[1]:getY() then
                TextToRender = sign.text
                if sign.triggerEvent and Event.status == sign.requiredStatus then
                    if sign.replaceText then
                        TextToRender = EventPrompt[sign.triggerEvent]
                    else
                        table.insert(Event.queuedEvents, sign.triggerEvent)
                    end
                end
            end
        end
        for i, item in pairs(Items) do
            if item.x*Window.scale == colliders[1]:getX()
                and item.y*Window.scale == colliders[1]:getY()
                and Event.status == "farmTime"
                and item.status == "ItemPresent" then
                AddItemToInventory(Carrot)
                item.status = "ItemConsumed"
                TextToRender = item.text
                colliders[1]:setCollisionClass('ItemConsumed')
                table.insert(ItemToRemove.coordinates, {x = colliders[1]:getX(), y = colliders[1]:getY(), zone = Zone.name})
                for index, object in ipairs(Player.inventory) do
                    if object.name == "carrot" and Event.carrotCount == object.amount then
                        Event.status = "cowTime"
                        TextToRender = EventPrompt[Event.status]
                    end
                end
            end
        end
    end
end

function ControlOverworld(dt)
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

    if Player.collider:enter('Exit') then
        vx, vy = HandleExit(vx, vy)
        isMoving = false
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