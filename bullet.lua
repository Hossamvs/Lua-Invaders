local Bullet = {}

-- Active bullets managed by this module
Bullet.active = {}

-- Defaults for newly spawned bullets
Bullet.defaultSpeed = 500
Bullet.defaultSize = { width = 5, height = 5 }

-- Spawn a new bullet at x, y. Options may include width, height, speed, dx, dy
function Bullet.spawn(x, y, opts)
    opts = opts or {}
    local width = opts.width or Bullet.defaultSize.width
    local height = opts.height or Bullet.defaultSize.height
    local speed = opts.speed or Bullet.defaultSpeed
    local dx = opts.dx or 0
    -- By default bullets go upward
    local dy = opts.dy or -speed

    table.insert(Bullet.active, {
        x = x,
        y = y,
        dx = dx,
        dy = dy,
        width = width,
        height = height,
    })
end

-- Update all bullets; remove those that go off-screen
-- bounds is optional: { width = number, height = number }
function Bullet.updateAll(dt, bounds)
    local screenWidth = bounds and bounds.width or love.graphics.getWidth()
    local screenHeight = bounds and bounds.height or love.graphics.getHeight()

    for i = #Bullet.active, 1, -1 do
        local b = Bullet.active[i]
        b.x = b.x + b.dx * dt
        b.y = b.y + b.dy * dt

        -- Remove if completely out of the screen bounds
        local outTop = b.y + b.height < 0
        local outBottom = b.y > screenHeight
        local outLeft = b.x + b.width < 0
        local outRight = b.x > screenWidth
        if outTop or outBottom or outLeft or outRight then
            table.remove(Bullet.active, i)
        end
    end
end

-- Draw all bullets as rectangles
function Bullet.drawAll()
    for _, b in ipairs(Bullet.active) do
        love.graphics.rectangle("fill", b.x, b.y, b.width, b.height)
    end
end

-- Remove a bullet by index
function Bullet.removeAt(index)
    table.remove(Bullet.active, index)
end

-- Clear all bullets
function Bullet.clearAll()
    for i = #Bullet.active, 1, -1 do
        table.remove(Bullet.active, i)
    end
end

-- Iterate over bullets (useful for collision checks)
function Bullet.forEach(callback)
    for i, b in ipairs(Bullet.active) do
        callback(b, i)
    end
end

return Bullet