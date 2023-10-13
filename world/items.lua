Items = {}

function SpawnItems(x, y, width, height, id, text)
    local item = {}
    item.x = x + width/2
    item.y = y + height/2
    item.id = id
    item.status = 'ItemPresent'
    item.text = text

    table.insert(Items, item)
end