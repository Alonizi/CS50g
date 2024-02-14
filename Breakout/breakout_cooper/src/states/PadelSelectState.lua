

PadelSelectState = class{__includes = BaseState}


function PadelSelectState:init()
    self.paddleNum = 1
    self.paddles = splicePaddles() 
    self.arrowsQuads = spliceArrows()
end
function PadelSelectState:enter(params) end
function PadelSelectState:exit()end

function PadelSelectState:update(dt)

    if love.keyboard.keysPressed['right'] then
        self.paddleNum = math.min(self.paddleNum +1,#paddles)
         love.keyboard.keysPressed['right'] = false 
 
    end
    if love.keyboard.keysPressed['left'] then
         self.paddleNum = math.max(self.paddleNum -1,1)
         love.keyboard.keysPressed['left'] = false 
    end

    if  love.keyboard.keysPressed['return'] then
        love.keyboard.keysPressed['return'] = false
        gStateMachine:change('Play',self.paddleNum)
    end


end

function PadelSelectState:render() 
    

    --render arrows
    love.graphics.draw(arrowsAtlas,arrowsQuads[1],10,50)
    love.graphics.draw(arrowsAtlas,arrowsQuads[2],VIRTUAL_WIDTH-50,50)

    --render paddles
    love.graphics.printf('PadelSelect', 0, 64+100, VIRTUAL_WIDTH, 'center')
    love.graphics.draw(blocksAtlas , paddles[self.paddleNum],200,100)
end
