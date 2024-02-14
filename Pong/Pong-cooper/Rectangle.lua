Class = require "class"

Rectangle = Class {}

function Rectangle:init(x, y, width, height, speed)
    self.spawnX = x
    self.spawnY = y
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.speed = speed

end

function Rectangle:confineMovement(screenHeight, screenWidth)
    self.y = math.max(0, self.y)
    self.y = math.min(screenHeight - self.height, self.y)
end
function Rectangle:update(dt)
    -- self.x = self.x + (self.speed * dt) 
    self.y = self.y + (self.speed * dt)
end

function Rectangle:reset()
    love.graphics.rectangle("fill", self.spawnX, self.spawnY, self.width, self.height)

end

function Rectangle:render()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
