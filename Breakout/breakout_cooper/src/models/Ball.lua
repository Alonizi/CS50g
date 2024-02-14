particle = love.graphics.newImage('graphics/particle.png')
particleWidth = particle:getWidth() *0.3
particleHeight = particle:getHeight()*0.3

Ball = class{}


function Ball:init(x,y) 
    self.x = x
    self.y = y 
    self.verticalDirection = -1
    self.horizontalDirection = 1
    self.sidesCollision = {
        ['right'] = false , 
        ['left'] = false ,
        ['top'] = false , 
        ['bottom'] = false 
    }
end 

function Ball:update(dt) 
    self.x = self.x + (self.horizontalDirection*dt*80)
    self.y = self.y + (self.verticalDirection*dt*80)

    if ( self.x >= VIRTUAL_WIDTH ) then
        self.x = self.x -5
        self.horizontalDirection = -1 * self.horizontalDirection
    end

    if (  self.x <= 0  ) then
        self.x = self.x +5
        self.horizontalDirection = -1 * self.horizontalDirection
    end

    if (self.y <= 0 ) then
        self.y = self.y +5
        self.verticalDirection = -1 * self.verticalDirection
    end
    


end

function Ball:render() 
    love.graphics.draw(particle,self.x,self.y,0,0.3,0.3)
    -- love.graphics.printf(self.x, 0, 64+100, VIRTUAL_WIDTH, 'center')
    -- love.graphics.printf(self.y, 0, 64+100, 100, 'center')


end 

-- function Ball:collision(object)

--     local sidesCollision = {
--         ['right'] = false , 
--         ['left'] = false ,
--         ['top'] = false , 
--         ['bottom'] = false 
--     }

--     sidesCollision['right']= (
--         self.x  < object.x+object.width 
--         and self.x  > object.x
--         and self.y > object.y
--         and self.y+particleHeight < object.y + object.height
--     ) 
--     sidesCollision['left']= (
--         self.x+particleWidth  < object.x+object.width 
--         and self.x+particleWidth > object.x
--         and self.y > object.y
--         and self.y+particleHeight < object.y + object.height
--     ) 
--     sidesCollision['bottom']= (
--         self.x < object.x+object.width 
--         and self.x > object.x
--         and self.y > object.y
--         and self.y  < object.y + object.height
--     ) 
--     sidesCollision['top']= (
--         self.x < object.x+object.width 
--         and self.x > object.x
--         and self.y+particleHeight > object.y
--         and self.y+particleHeight  < object.y + object.height
--     ) 

--     return sidesCollision
     
-- end 

function Ball:collision(object) 

    local sidesCollision = {
        ['objectRight'] = false , 
        ['objectLeft'] = false ,
        ['objectTop'] = false , 
        ['objectBottom'] = false 
    }

    if self.x + particleWidth < object.x or self.x > object.x +object.width then
        return sidesCollision
    end

    if self.y + particleHeight < object.y or self.y > object.y+object.height then
        return sidesCollision
    end


    sidesCollision['objectRight'] = self.horizontalDirection < 0 and self.x+particleWidth> object.x+object.width
    sidesCollision['objectLeft'] = self.horizontalDirection > 0 and self.x < object.x
    sidesCollision['objectTop'] = self.verticalDirection > 0 and self.y < object.y
    sidesCollision['objectBottom'] = self.verticalDirection < 0 and self.y+particleHeight > object.y+object.height

    return sidesCollision
end

function Ball:reverseVerticalDirection(shift) 
    self.verticalDirection = -1 * self.verticalDirection
    self.y = shift
    --self.x = self.x + (self.horizontalDirection*1)
end

function Ball:reverseHorizontalDirection(shift) 
    self.horizontalDirection = -1 * self.horizontalDirection
    self.x = shift
   -- self.y = self.y + (self.verticalDirection*1)
end



