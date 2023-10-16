MapName = {
    House = "sprites/maps/house.lua",
    Road = "sprites/maps/road.lua",
    RoadMid = "sprites/maps/road-mid.lua",
}

function SpawnExit(collider, exit)
    collider.id = exit.name
    collider.nextX = exit.properties.NextZoneX
    collider.nextY = exit.properties.NextZoneY
    if exit.properties.blockingEvent then
        collider.blockingEvents = {}
        for event in string.gmatch(exit.properties.blockingEvent, '([^,]+)') do
            table.insert(collider.blockingEvents, event)
        end
    end
    collider.blockingText = exit.properties.blockingText
end

function HandleExit(vx, vy)
    local collisionData = Player.collider:getEnterCollisionData('Exit')
    if collisionData.collider.blockingEvents then
        for i, event in ipairs(collisionData.collider.blockingEvents) do
            if Event.status == event then
                TextToRender = collisionData.collider.blockingText
                return -vx*2, -vy*2
            end
        end
    end
    LoadZone(collisionData.collider.id, collisionData.collider.nextX, collisionData.collider.nextY)
    return vx, vy
end