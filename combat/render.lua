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
    SelectionX = 0
    SelectionY = Window.height - actionBox:getHeight()*Window.scale
    local actionX = actionBox:getWidth()*Window.scale/actionWidthScale
    local actionY = SelectionY

    local healthBoxX = Window.width - actionBox:getWidth()*Window.scale/healthWidthScale
    local healthBoxY = 0

    love.graphics.draw(actionBox, SelectionX, SelectionY, nil, Window.scale/actionWidthScale, Window.scale)
    love.graphics.draw(actionBox, actionX, actionY, nil, Window.scale, Window.scale)
    love.graphics.draw(actionBox, healthBoxX, healthBoxY, nil, Window.scale/healthWidthScale, Window.scale)

    DrawActions()
end

function DrawActions()
    for i, value in pairs(CombatActions) do
        if value == Combat.selectedAction then
            love.graphics.rectangle(
                "line",
                (i-1)%2*wordSpacingX*Window.scale+SelectionX+(edgeBuffer+highlightBuffer)*Window.scale,
                math.modf(i/3)*wordSpacingY*Window.scale+SelectionY+(edgeBuffer+highlightBuffer)*Window.scale,
                50*Window.scale,
                15*Window.scale,
                5
            )
        end
        love.graphics.printf(
            {{0, 0, 0, 1}, value},
            (i-1)%2*wordSpacingX*Window.scale+SelectionX+edgeBuffer*Window.scale,
            math.modf(i/3)*wordSpacingY*Window.scale+SelectionY+edgeBuffer*Window.scale,
            375, "left", nil, 2, 2)
    end
end