require 'player/dialogueBox'

function DrawWorld()
    Zone:draw(0, 0, Window.scale, Window.scale)
    if #ItemToRemove.coordinates > 0 then
        for i, item in ipairs(ItemToRemove.coordinates) do
            if item.zone == Zone.name then
                love.graphics.draw(ItemToRemove.newImage, ItemToRemove.imageQuad, item.x-20, item.y-20, nil,  Window.scale, Window.scale)
            end
        end
    end
    Player.anim:draw(Player.spriteSheet, Player.x-12.5, Player.y-25, nil, Window.scale, Window.scale)
    for i, enemy in pairs(Enemies) do
        if enemy.direction == 'right' then
            love.graphics.draw(enemy.sprite, enemy.x+enemy.sprite:getWidth()*Window.scale, enemy.y, nil, -Window.scale, Window.scale)
        else
            love.graphics.draw(enemy.sprite, enemy.x, enemy.y, nil, Window.scale, Window.scale)
        end
    end
    if TextToRender then
        DrawDialog(TextToRender)
    end
end