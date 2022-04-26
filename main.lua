require("player")
require("enemy")

enemies = {}
function love.load()
    Player:load()
    Enemy:load()
    enemies_controller.image= love.graphics.newImage('images/enemy.png')
    enemies_controller:spawnEnemy(0,0)
	enemies_controller:spawnEnemy(100,0)

end

function enemies_controller:spawnEnemy(x,y)

	--Section 1.3.1	
	enemy ={}
	enemy.x=x
	enemy.y=y
	enemy.width= 75
	enemy.height= 75
		--enemy.bullets={}
	--enemy.cooldown = 20
	enemy.speed = 0.2
	table.insert(self.enemies, enemy)

end

function love.update(dt)
    Player:update(dt)
    Enemy:update(dt)
    for _,e in pairs(enemies_controller.enemies)do
		e.y=e.y+e.speed
	end
end

function love.draw()
    Player:draw()
	for _,e in pairs(enemies_controller.enemies) do
		love.graphics.draw(enemies_controller.image, e.x,e.y,0,1.5)
	end
    --Enemy:draw()

   --[[
for i,enemy in ipairs(enemies) do
        Enemy:draw()
     end
   ]] 
end

function checkCollision(a,b)
        
end