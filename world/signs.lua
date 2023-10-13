Signs = {}

function SpawnSign(x, y, width, height, id, text)
    local sign = {}
    sign.x = x + width/2
    sign.y = y + height/2
    sign.id = id
    sign.text = text

    table.insert(Signs, sign)
end