function run(player, dt)
    player.is_moving = false
    if love.keyboard.isDown("d") then
        player.is_moving = true
        player.animation.side = 1
        player.x = player.x + player.move_speed
    end
    if love.keyboard.isDown("a") then
        player.is_moving = true
        player.animation.side = -1
        player.x = player.x - player.move_speed
    end
    if love.keyboard.isDown("w") then
        player.is_moving = true
        player.y = player.y - player.move_speed
    end
    if love.keyboard.isDown("s") then
        player.is_moving = true
        player.y = player.y + player.move_speed
    end

    if player.is_moving then
        player.animation = player.run
    else
        player.animation = player.idle
    end
end
