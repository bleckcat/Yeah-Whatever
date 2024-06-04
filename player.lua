require("animation_core")

player_sprite = love.graphics.newImage("sprites/characters/2 Punk/Punk_idle.png")

player = {}

function love.load()
    player.x = love.graphics.getWidth() / 2
    player.y = love.graphics.getHeight() / 2

    player.hp = 15
    player.strength = 20
    player.magic = 25

    player.img = player_sprite
    player.animation = animateSprite(player_sprite)
end

function love.update(dt)
    player.animation.currentTime = player.animation.currentTime + dt
    if player.animation.currentTime >= player.animation.duration then
        player.animation.currentTime = player.animation.currentTime - player.animation.duration
    end
end

function love.draw()
    local spriteNum = math.floor(player.animation.currentTime / player.animation.duration * #player.animation.quads) + 1
    love.graphics.draw(player.animation.spriteSheet, player.animation.quads[spriteNum], player.x, player.y, 0, 1, 1, 0, 0, 0, 0)
end