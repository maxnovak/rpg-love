local actionWidthScale = 1.9
local healthWidthScale = 1.5
local edgeBuffer = 12
local wordSpacingX = 80
local wordSpacingY = 25
local highlightBuffer = -2

function FadeInCombat()
    --todo figure out an animation into the scene below
end

function DrawCombat()
    love.graphics.setLineWidth(6)
    local actionBox = love.graphics.newImage('sprites/HUD/DialogueBoxSimple.png')
    local selectionX = 0
    local selectionY = Window.height - actionBox:getHeight()*Window.scale
    local actionX = actionBox:getWidth()*Window.scale/actionWidthScale
    local actionY = selectionY

    local healthBoxX = Window.width - actionBox:getWidth()*Window.scale/healthWidthScale
    local healthBoxY = 0
    DrawHealthBox(actionBox, healthBoxX, healthBoxY)

    DrawActions(actionBox, selectionX, selectionY)
    if Combat.subselection then
        DrawSubActions(actionBox, actionX, actionY)
    end
end

function DrawActions(boxImage, x, y)
    love.graphics.draw(boxImage, x, y, nil, Window.scale/actionWidthScale, Window.scale)
    for i, value in pairs(CombatActions) do
        if value == Combat.selectedAction then
            love.graphics.rectangle(
                "line",
                (i-1)%2*wordSpacingX*Window.scale+x+(edgeBuffer+highlightBuffer)*Window.scale,
                math.modf(i/3)*wordSpacingY*Window.scale+y+(edgeBuffer+highlightBuffer)*Window.scale,
                50*Window.scale,
                15*Window.scale,
                5
            )
        end
        love.graphics.printf(
            {{0, 0, 0, 1}, value},
            (i-1)%2*wordSpacingX*Window.scale+x+edgeBuffer*Window.scale,
            math.modf(i/3)*wordSpacingY*Window.scale+y+edgeBuffer*Window.scale,
            375, "left", nil, 2, 2)
    end
end

function DrawSubActions(boxImage, x, y)
    love.graphics.draw(boxImage, x, y, nil, Window.scale, Window.scale)
    if Combat.selectedAction == "Use Item" then
        Combat.subselectionItem = next(Player.inventory)
        for item, amount in pairs(Player.inventory) do
            if item == Combat.subselectionItem then
                love.graphics.rectangle(
                    "line",
                    x+edgeBuffer*Window.scale,
                    y+edgeBuffer*Window.scale,
                    50*Window.scale,
                    15*Window.scale,
                    5
                )
            end
            love.graphics.printf(
                {{0, 0, 0, 1}, string.format("%s x%s", item:gsub("^%l", string.upper), amount)},
                x+edgeBuffer*Window.scale,
                y+edgeBuffer*Window.scale,
                375, "left", nil, 2, 2)
        end
    end
    if Combat.selectedAction == "Fight" then
        Combat.subselectionItem = next(Combat.enemies)
        local iterator = 0
        for enemyName, enemyObject in pairs(Combat.enemies) do
            if enemyName == Combat.subselectionItem then
                love.graphics.rectangle(
                    "line",
                    iterator * wordSpacingX * Window.scale+x+edgeBuffer*Window.scale,
                    y+edgeBuffer*Window.scale,
                    50*Window.scale,
                    15*Window.scale,
                    5
                )
            end
            love.graphics.printf(
                {{0, 0, 0, 1}, enemyName},
                iterator * wordSpacingX * Window.scale+x+edgeBuffer*Window.scale,
                y+edgeBuffer*Window.scale,
                375, "left", nil, 2, 2)
            iterator = iterator + 1
        end
    end
end

function DrawHealthBox(boxImage, x, y)
    love.graphics.draw(boxImage, x, y, nil, Window.scale/healthWidthScale, Window.scale)
end
