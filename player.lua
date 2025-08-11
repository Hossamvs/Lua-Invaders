local Bullet = require("bullet")

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

    Bullet.updateAll(dt)
end

function Player:shoot()
    Bullet.spawn(self.x + self.width/2, self.y)
end

function Player:draw()
    love.graphics.draw(self.img, self.x, self.y)
    --love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

    --draw bullets
    Bullet.drawAll()
end