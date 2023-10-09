Chests = {}

function SpawnChest(x, y, width, height, id)
    local chest = {}
    chest.stage = "closed"
    chest.x = x + width/2
    chest.y = y + height/2
    chest.id = id

    table.insert(Chests, chest)
end