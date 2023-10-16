Signs = {}

function SpawnSign(object)
    local sign = {}
    sign.x = object.x + object.width/2
    sign.y = object.y + object.height/2
    sign.id = object.name
    sign.text = object.properties.actionText

    table.insert(Signs, sign)
end