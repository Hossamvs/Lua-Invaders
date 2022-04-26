
Enemy = {}
enemy={}
enemies_controller = {}
enemies_controller.enemies ={}
function Enemy:load()
    width = love.graphics.getWidth( )
    height = love.graphics.getHeight( )
    self.x = 0
    self.y = 10
    self.img = love.graphics.newImage("images/enemy.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.speed = 100
    
    self.direction = 0

end

function Enemy:update(dt)
    --self.x = self.x + self.speed * dt
    if self.x > (width - self.width) then
        self.direction = 1
        self.y = self.y + 10
    elseif self.x < 0 then
        self.direction = 0
    end
    
    if self.direction == 0 then
        self.x = self.x + self.speed * dt
    else
        self.x = self.x - self.speed * dt
    end
end

function Enemy:spawn(x,y)
    self.x = x
    self.y = y
end



function Enemy:draw()
    love.graphics.draw(self.img, self.x, self.y)
--[[
    xoffset = 0
    yoffset = 0
    for i = 0, 4 do
        for j = 0, 9 do
            love.graphics.draw(self.img, self.x + xoffset, self.y + yoffset)
            xoffset = xoffset + self.width
        end
        xoffset = 0
        yoffset = yoffset + self.height
    end

]]

    --love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

