   PowerUp = Class{} 

   function PowerUp:init(index,x,y) 

    self.x = x 
    self.y = y
    self.index = index

    end

    function PowerUp:collides(target)
    
        -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
    end

   function PowerUp:update() 
    
    end 

   function PowerUp:render() 
    love.graphics.draw(gTextures['main'],gFrames['powers'][self.index],self.x , self.y)

    end 

