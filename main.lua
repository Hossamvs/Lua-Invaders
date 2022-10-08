require("player")
require("enemy")

enemies = {}
function love.load()
    Player:load()
    Enemy:load()
    enemies_controller.image= love.graphics.newImage('images/enemy.png')
    enemies_controller:spawnEnemies(5, 11)
end

function enemies_controller:spawnEnemies(row, column)
	offSetX = love.graphics.getWidth() / 2 - (column * 75) / 2
	for i = 0, column-1 do
		for j = 0, row-1 do
			enemies_controller:spawnEnemy(offSetX + i * 75, j * 75);
		end
	end
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