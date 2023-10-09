Signs = {}

function SpawnSign(x, y, width, height, id)
    local sign = {}
    sign.x = x + width/2
    sign.y = y + height/2
    sign.id = id

    table.insert(Signs, sign)
end