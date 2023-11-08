require "world/chests"
require "enemies/setup"
require "world/items"
require "world/signs"
require "world/map"

Zone = {}
World = {}
Walls = {}
Interactables = {}
Enemies = {}

function SetupWorld()
    World = Windfield.newWorld(0, 0)
    World:addCollisionClass('Player')
    World:addCollisionClass('Enemy')
    World:addCollisionClass('Wall')
    World:addCollisionClass('Chest')
    World:addCollisionClass('Item')
    World:addCollisionClass('ItemConsumed', {ignores = {'Player'}})
    World:addCollisionClass('Sign')
    World:addCollisionClass('Exit', {ignores = {'Player'}})
end

function LoadZone(zoneName, playerX, playerY)
    Player.stop = true
    colliderTableDestroy(Walls)
    colliderTableDestroy(Interactables)
    colliderTableDestroy(Enemies)

    if playerX == nil then
        playerX = Player.collider:getX()
    end
    if playerY == nil then
        playerY = Player.collider:getY()
    end
    Player.collider:setPosition(playerX, playerY)

    Zone = STI(MapName[zoneName])
    Zone.name = zoneName
    Zone.alpha = 1

    if Zone.layers["Walls"] then
        for i, wall in pairs(Zone.layers["Walls"].objects) do
            local collider = World:newRectangleCollider(wall.x*Window.scale, wall.y*Window.scale, wall.width*Window.scale, wall.height*Window.scale)
            collider:setType('static')
            collider:setCollisionClass('Wall')
            table.insert(Walls, collider)
        end
    end

    if Zone.layers["Interactable"] then
        for i, object in pairs(Zone.layers["Interactable"].objects) do
            local collider = World:newRectangleCollider(object.x*Window.scale, object.y*Window.scale, object.width*Window.scale, object.height*Window.scale)
            collider:setType('static')
            if object.type == 'Chest' then
                collider:setCollisionClass('Chest')
                SpawnChest(object.x, object.y, object.width, object.height, object.name)
            end
            if object.type == 'Sign' then
                collider:setCollisionClass('Sign')
                SpawnSign(object)
            end
            if object.type == 'Item' then
                collider:setCollisionClass('Item')
                SpawnItems(object)
            end
            if object.type == "Exit" then
                collider:setCollisionClass('Exit')
                SpawnExit(collider, object)
            end
            table.insert(Interactables, collider)
        end
    end

    if Zone.layers["Enemies"] then
        for i, enemy in pairs(Zone.layers["Enemies"].objects) do
            local collider = World:newRectangleCollider(enemy.x*Window.scale, enemy.y*Window.scale, 18*Window.scale, 18*Window.scale)
            collider:setType('static')
            collider:setCollisionClass('Enemy')
            enemy = CreateEnemy(enemy, collider)
            table.insert(Enemies, enemy)
        end
    end

    Flux.to(Zone, 0.5, {alpha = 0}):ease("linear")
end

-- Used for tables of colliders
function colliderTableDestroy(tableList)
    local i = #tableList
    while i > 0 do
        if tableList[i] ~= nil then
            tableList[i]:destroy()
        end
        table.remove(tableList, i)
        i = i - 1
    end
end

-- Used for tables of standard non-collider tables
function removeTable(tableList)
    local i = #tableList
    while i > 0 do
        table.remove(tableList, i)
        i = i - 1
    end
end
