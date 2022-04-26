local bullet = {}

bullet.current_speed = -200
bullet.width = 2
bullet.height = 2
bullet.current_bullets = {}


function bullet.destory_bullet(bullet_i)
    bullet.current_bullets[bullet_i] = nil
end