function animateSprite(image)
    local animation = {}
    local divisionRest = image:getWidth() / image:getHeight()

    animation.animationFrames = image:getWidth() / divisionRest
    animation.spriteSheet = image;
    animation.quads = {};
    animation.duration = duration or 1
    animation.currentTime = 0
    animation.side = 1

    for x = 0, image:getWidth() - animation.animationFrames, animation.animationFrames do
        table.insert(animation.quads,
            love.graphics.newQuad(x, 0, animation.animationFrames, image:getHeight(), image:getDimensions()))
    end

    return animation
end
