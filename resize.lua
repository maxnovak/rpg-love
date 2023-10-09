function love.resize (w, h)
    resize (w, h)
end

function resize (w, h)
    local w1, h1 = Window.width, Window.height
    local scale = math.min (w/w1, h/h1)
    Window.translateX, Window.translateY, Window.scale = (w-w1*scale)/2, (h-h1*scale)/2, scale
end
