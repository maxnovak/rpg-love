require "world/chests"
require "world/items"
require "world/signs"

Road = {}
World = {}

function SetupWorld()
    World = Windfield.newWorld(0, 0)
    Road = STI('sprites/maps/house.lua')
    World:addCollisionClass('Wall')
    World:addCollisionClass('Chest')
    World:addCollisionClass('Item')
    World:addCollisionClass('Sign')

    if Road.layers["Walls"] then
        for i, wall in pairs(Road.layers["Walls"].objects) do
            local collider = World:newRectangleCollider(wall.x*Window.scale, wall.y*Window.scale, wall.width*Window.scale, wall.height*Window.scale)
            collider:setType('static')
            collider:setCollisionClass('Wall')
        end
    end

    if Road.layers["Interactable"] then
        for i, object in pairs(Road.layers["Interactable"].objects) do
            local collider = World:newRectangleCollider(object.x*Window.scale, object.y*Window.scale, object.width*Window.scale, object.height*Window.scale)
            collider:setType('static')
            if object.name == 'Chest' then
                collider:setCollisionClass('Chest')
                SpawnChest(object.x, object.y, object.width, object.height, object.id)
            end
            if object.name == 'Sign' then
                collider:setCollisionClass('Sign')
                SpawnSign(object.x, object.y, object.width, object.height, object.id)
            end
            if object.name == 'Item' then
                collider:setCollisionClass('Sign')
                SpawnItems(object.x, object.y, object.width, object.height, object.id)
            end
        end
    end
end