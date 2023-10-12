MapName = {
    House = "sprites/maps/house.lua",
    Road = "sprites/maps/road.lua",
    RoadMid = "sprites/maps/road-mid.lua",
}

Exits = {}

function SpawnExit(collider, exit)
    collider.id = exit.name
    collider.nextX = exit.properties.NextZoneX
    collider.nextY = exit.properties.NextZoneY
end