local xClose = 80
local YClose = 40
local edgeBuffer = 8

function DrawDialog(text)
    local box = love.graphics.newImage('sprites/HUD/DialogueBoxSimple.png')
    local xPlacement = (Window.width - box:getWidth()*Window.scale) / 2
    local yPlacement = (Window.height - box:getHeight()*Window.scale)
    print(100/Window.scale)
    local closeX = (Window.width + box:getWidth()*Window.scale) / 2 - xClose*Window.scale
    local closeY = (Window.height - box:getHeight()*Window.scale) + YClose*Window.scale
    love.graphics.draw(box, xPlacement, yPlacement, nil, Window.scale, Window.scale)
    love.graphics.print({{0, 0, 0, 1}, text}, xPlacement+edgeBuffer*Window.scale, yPlacement+edgeBuffer*Window.scale, nil, 2, 2)
    love.graphics.print({{0, 0, 0, 1}, "Space to close"}, closeX, closeY, nil, 2, 2)
end