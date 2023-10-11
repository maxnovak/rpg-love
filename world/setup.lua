require "world/chests"
require "world/items"
require "world/signs"

Zone = {}
World = {}

function SetupWorld()
    World = Windfield.newWorld(0, 0)
    Zone = STI('sprites/maps/house.lua')
    Zone.name = "house"
    World:addCollisionClass('Wall')
    World:addCollisionClass('Chest')
    World:addCollisionClass('Item')
    World:addCollisionClass('Sign')
    World:addCollisionClass('Exit')

    if Zone.layers["Walls"] then
        for i, wall in pairs(Zone.layers["Walls"].objects) do
            local collider = World:newRectangleCollider(wall.x*Window.scale, wall.y*Window.scale, wall.width*Window.scale, wall.height*Window.scale)
            collider:setType('static')
            collider:setCollisionClass('Wall')
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
                SpawnSign(object.x, object.y, object.width, object.height, object.name)
            end
            if object.type == 'Item' then
                collider:setCollisionClass('Sign')
                SpawnItems(object.x, object.y, object.width, object.height, object.name)
            end
        end
    end
end