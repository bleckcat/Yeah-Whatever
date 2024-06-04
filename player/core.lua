require("animation.core")
require("player.movement")

local player_sprites_table = {
    [1] = love.graphics.newImage("@sprites/characters/2 Punk/Punk_idle.png"),
    [2] = love.graphics.newImage("@sprites/characters/2 Punk/Punk_run.png"),
    [3] = love.graphics.newImage("@sprites/characters/2 Punk/Punk_death.png"),
    [4] = love.graphics.newImage("@sprites/characters/2 Punk/Punk_hurt.png")
}

player = {}

function love.load()
    player.x = love.graphics.getWidth() / 2
    player.y = love.graphics.getHeight() / 2

    player.hp = 15
    player.strength = 20
    player.magic = 25
    player.move_speed = 2
    player.is_moving = false
    player.is_alive = player.hp > 0
    player.is_hurt = false

    player.idle = animateSprite(player_sprites_table[1])
    player.run = animateSprite(player_sprites_table[2])
    player.death = animateSprite(player_sprites_table[3])
    player.hurt = animateSprite(player_sprites_table[4])

    player.animation = player.idle
end

function love.update(dt)
    animateFramesDeltaTime(player, dt)
    actions(player, dt)
end

function love.draw()
    local spriteNum = math.floor(player.animation.currentTime / player.animation.duration * #player.animation.quads) + 1
    love.graphics.draw(player.animation.spriteSheet, player.animation.quads[spriteNum], player.x, player.y, 0,
        player.animation.side, 1, 16, 0, 0, 0)
end

function love.keypressed(k)
    if k == "space" then
        player.when_got_hurt = love.timer.getTime()
        player.animation = player.hurt
        player.is_hurt = true
    end
end
