Road = {}
World = {}

function SetupWorld()
    World = Windfield.newWorld(0, 0)
    Road = STI('sprites/maps/road.lua')
    local walls = {}
    if Road.layers["Walls"] then
        for i, wall in pairs(Road.layers["Walls"].objects) do
            local collider = World:newRectangleCollider(wall.x*Window.scale, wall.y*Window.scale, wall.width*Window.scale, wall.height*Window.scale)
            collider:setType('static')
            table.insert(walls, collider)
        end
    end
end