Class = require "class"
rectangle = require "Rectangle"

Ball = Class {}

function Ball:init(x, y, size, speed)
    self.spawnx = x
    self.spawny = y
    self.x = x
    self.y = y
    self.size = size
    self.speed = speed

end

function Ball:detectCollision(rectangle)
    return (self.x + self.size) >= rectangle.x and (self.x <= rectangle.x + rectangle.width) and
               (self.y + self.size >= rectangle.y) and (self.y <= rectangle.y + rectangle.height)
end

-- function Ball:collides(rectangle)
--     -- first, check to see if the left edge of either is farther to the right
--     -- than the right edge of the other
--     if self.x > rectangle.x + rectangle.width or rectangle.x > self.x + self.size then
--         return false
--     end

--     -- then check to see if the bottom edge of either is higher than the top
--     -- edge of the other
--     if self.y > rectangle.y + rectangle.height or rectangle.y > self.y + self.size then
--         return false
--     end

--     -- if the above aren't true, they're overlapping
--     return true
-- end

function Ball:update(dt, directionX, directionY)
    self.x = self.x + (directionX * self.speed * dt)
    self.y = self.y + (directionY * self.speed * dt)
end

function Ball:render()
    love.graphics.rectangle("fill", self.x, self.y, self.size, self.size)
end

function Ball:reset()
    self.x = self.spawnx
    self.y = self.spawny

end
