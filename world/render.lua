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

    if Zone.alpha > 0 then
        love.graphics.setColor(0, 0, 0, Zone.alpha)
        love.graphics.rectangle("fill", -10, -10, love.graphics.getWidth() + 20, love.graphics.getHeight() + 20)
        love.graphics.setColor(1, 1, 1, 1)
    end
end