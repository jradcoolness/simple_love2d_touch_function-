function love.load()
    love.graphics.setBackgroundColor(1, 1, 1) -- Set background to white
    touches = {}
end

function love.touchpressed(id, x, y, dx, dy, pressure)
    touches[id] = {x = x, y = y, pressure = pressure}
end

function love.touchreleased(id, x, y, dx, dy, pressure)
    touches[id] = nil
end

function love.update(dt)
    -- Update touch positions
    for id, touch in pairs(touches) do
        local x, y = love.touch.getPosition(id)
        touch.x, touch.y = x, y
        touch.pressure = love.touch.getPressure(id)
    end
end

function love.draw()
    love.graphics.setColor(0, 0, 0) -- Set text color to black
    love.graphics.print("Touch points:", 10, 10)
    
    local y = 30
    for id, touch in pairs(touches) do
        love.graphics.print("ID: " .. tostring(id), 10, y)
        love.graphics.print("Position: (" .. touch.x .. ", " .. touch.y .. ")", 10, y + 20)
        love.graphics.print("Pressure: " .. touch.pressure, 10, y + 40)
        y = y + 60
    end
end
