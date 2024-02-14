Padel = class {}


function Padel:init(x,y,padelIndex)
    self.x = x 
    self.y = y
    self.padelIndex = padelIndex
    self.width = 62 *0.75
    self.height = 16 *0.75
end

function Padel:update(dt) 
    if love.keyboard.isDown('d') then
        self.x = math.min(self.x +(dt*200),VIRTUAL_WIDTH-self.width) 
    end

    if love.keyboard.isDown('a') then
        self.x = math.max(0,self.x -(dt*200)) 
    end
end

function Padel:render() 
    love.graphics.draw(blocksAtlas , paddles[self.padelIndex],self.x,self.y,0,0.75,0.75)
end

