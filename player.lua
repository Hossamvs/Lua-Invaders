Player = {}          

function Player:load()
    width = love.graphics.getWidth( )
    height = love.graphics.getHeight( )
    self.x = width/2
    self.y = height-100
    --self.width = 50
    --self.height = 10
    self.img = love.graphics.newImage("images/player.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.speed = 200


    self.bullets = {}

end

function Player:update(dt)
    if love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
    end

    if self.x < 0 then
        self.x = 0
    elseif self.x + self.width > width then
        self.x = width - self.width
    end

    if love.keyboard.isDown("space") then
        self:shoot()
    end

    for i, bullet in pairs(self.bullets) do
        bullet.y = bullet.y + bullet.speed * dt
        if bullet.y > height then
            table.remove(self.bullets, i)
        end
    end
end

function Player:shoot()
    bullet = {}
    bullet.x = self.x + self.width/2
    bullet.y = self.y
    bullet.width = 5
    bullet.height = 5
    bullet.speed = -500
    table.insert(self.bullets, bullet)
end

function Player:draw()
    love.graphics.draw(self.img, self.x, self.y)
    --love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

    --draw bullets
    for i, bullet in pairs(self.bullets) do
        love.graphics.rectangle("fill", bullet.x, bullet.y, bullet.width, bullet.height)
    end
end