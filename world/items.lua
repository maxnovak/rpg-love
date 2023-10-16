Items = {}

function SpawnItems(object)
    local item = {}
    item.x = object.x + object.width/2
    item.y = object.y + object.height/2
    item.id = object.name
    item.status = 'ItemPresent'
    item.text = object.properties.actionText

    table.insert(Items, item)
end