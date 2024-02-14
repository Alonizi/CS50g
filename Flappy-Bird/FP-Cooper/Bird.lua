Class = require 'class'

Bird = Class{};

function Bird:init(x,y,dy,gravity) 
    self.x = x 
    self.y = y 
    self.gravity = gravity
    self.dy = dy 
    self.image = love.graphics.newImage( 'bird.png')
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

end

function Bird:update(dt)
    
    
    self.dy = self.dy + self.gravity
    self.y = self.y +  (self.dy * dt)

    if love.keyboard.keysPressed['space'] then
        self.dy = -140
        love.keyboard.keysPressed['space'] = false
    
    end
end

function Bird:jump()
    --self.y =  -30
end

function Bird:render() 
    love.graphics.draw(self.image, self.x, self.y)
end