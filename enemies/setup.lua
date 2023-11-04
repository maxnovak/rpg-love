function CreateEnemy(object, collider)
    collider.id = object.name
    collider.x = object.x * Window.scale
    collider.y = object.y * Window.scale
    collider.sprite = love.graphics.newImage('sprites/characters/Guy.png')
    collider.direction = object.properties.startDirection

    return collider
end
