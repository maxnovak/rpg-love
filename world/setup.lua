require "world/chests"
require "world/items"
require "world/signs"
require "world/map"

Zone = {}
World = {}
Walls = {}
Interactables = {}

function SetupWorld()
    World = Windfield.newWorld(0, 0)
    World:addCollisionClass('Player')
    World:addCollisionClass('Wall')
    World:addCollisionClass('Chest')
    World:addCollisionClass('Item')
    World:addCollisionClass('ItemConsumed', {ignores = {'Player'}})
    World:addCollisionClass('Sign')
    World:addCollisionClass('Exit', {ignores = {'Player'}})
end

function LoadZone(zoneName, playerX, playerY)
    colliderTableDestroy(Walls)
    colliderTableDestroy(Interactables)

    if playerX == nil then
        playerX = Player.collider:getX()
    end
    if playerY == nil then
        playerY = Player.collider:getY()
    end
    Player.collider:setPosition(playerX, playerY)

    Zone = STI(MapName[zoneName])
    Zone.name = zoneName

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
                SpawnSign(object.x, object.y, object.width, object.height, object.name, object.properties.actionText)
            end
            if object.type == 'Item' then
                collider:setCollisionClass('Item')
                SpawnItems(object.x, object.y, object.width, object.height, object.name, object.properties.actionText)
            end
            if object.type == "Exit" then
                collider:setCollisionClass('Exit')
                SpawnExit(collider, object)
            end
            table.insert(Interactables, collider)
        end
    end
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
