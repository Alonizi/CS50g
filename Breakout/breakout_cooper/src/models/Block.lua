Block = class {}


function Block:init(x,y,blockIndex) 
    self.x = x
    self.y = y
    self.blockIndex = blockIndex
    self.initiateBlocks = spliceBlocks()
    self.width = 32*0.75
    self.height = 16*0.75
end

function Block:update(dt) 

end 

function Block:render() 
    love.graphics.draw(blocksAtlas,blocks[self.blockIndex],self.x,self.y,0,0.75,0.75)
end

