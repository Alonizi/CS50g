
require 'class'
bird = require 'Bird'

Pipe = Class{}

pipeImage = love.graphics.newImage('pipe.png')

function Pipe:init(x,y)
    self.x = x 
    self.y = 100 
    self.rotation = 180 *(math.pi/180)
    self.verticalShift = 10*math.random(-6,6) 
    self.objectPassed = false 
    self.width = pipeImage:getWidth()
    self.height = pipeImage:getHeight()
    self.var = 0
    --self.rotationPoint = rotationPoint
    --self.distance = 30    
end

function Pipe:detectCollision(bird) 
    self.var = bird.y
    if self.x+(pipeImage:getWidth()*0.5)-5 <= bird.x or self.x+5 >= bird.x+bird.width then
        return false 
    end
        --DownPipe Collision
    if bird.y+bird.height <= ((self.y-self.verticalShift+25)+5) 
        -- UpPipe Collision
        and bird.y >= (self.y - self.verticalShift-25)-5 then
        return false 
    end


    return true 


end


function Pipe:update(dt)
    -- self.x = (self.x  -(dt * 200) ) % self.rotationPoint 
    self.x = (self.x  -(dt * 200 ) ) 

    --  if self.x > VIRTUAL_WIDTH+30 and self.x < self.rotationPoint-30 then
    --     self.verticalShift = 10*math.random(-9,9) 
    --     self.rotationPoint = VIRTUAL_WIDTH + 10*math.random(-9,9) 
    --  end
end

function Pipe:render()
    
    -- love.graphics.draw(pipeImage,self.x,self.y-self.verticalShift,self.rotation,0.5,0.8)
    -- love.graphics.draw(pipeImage,(self.x-pipeImage:getWidth()/2),self.y-self.verticalShift+50,0,0.5,0.8)
    love.graphics.print(self.var, 150, 0)
    love.graphics.print(self.y-self.verticalShift, 110, 0)


    -- love.graphics.print("xPos "..self.x, 50, 20)

    --DownPipe
    love.graphics.draw(pipeImage,self.x,self.y-self.verticalShift+25,0,0.5,0.8)
    --UpPipe 
    love.graphics.draw(pipeImage,self.x,self.y-self.verticalShift-25,0,0.5,-0.8)

end

