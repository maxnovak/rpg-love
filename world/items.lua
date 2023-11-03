Items = {}
Carrot = {
    name="carrot",
    amount = 1,
    healAmount = 10,
}

function SpawnItems(object)
    local item = {}
    item.x = object.x + object.width/2
    item.y = object.y + object.height/2
    item.id = object.name
    item.status = 'ItemPresent'
    item.text = object.properties.actionText

    table.insert(Items, item)
end

function AddItemToInventory(object)
    local found = false
    for i, item in ipairs(Player.inventory) do
        if item.name == object.name then
            found = true
            item.amount = item.amount + 1
        end
    end
    if found == false then
        table.insert(Player.inventory, {
            name = object.name,
            amount = object.amount,
        })
    end
end