PlayState = class {__includes = BaseState}

function PlayState:init() 
    self.health = 3 
    self.playerPadel = Padel(200,200,1)
    self.blocks = {}
    for y= 1 , 3 do 
        for i=0 , 12 do
            table.insert(self.blocks,Block((i*30)+20,y*25,math.random(2,3)))
        end
    end
    self.ball = Ball(150,150)
    self.start = false 
    self.firstTime = true
    self.score = 0 
    self.heartsQuads = spliceHearts()
end

function PlayState:enter(params) 
    self.playerPadel.padelIndex = params
end

function PlayState:exit() end

function PlayState:update(dt) 
    -- if self.firstTime then
        if love.keyboard.keysPressed['return'] then
            self.start = true 
            love.keyboard.keysPressed['return'] = false
            self.firstTime = false
        end
    -- end

    if self.start then
        self.playerPadel:update(dt)
        self.ball:update(dt)
    
    end

    if self.ball.y > VIRTUAL_HEIGHT then
        self.start = false 
        self.ball.x = 150 
        self.ball.y = 150
        self.health = self.health -1 
    end

    local  ballPadelCollision = self.ball:collision(self.playerPadel)
    -- if self.ball:collision(self.playerPadel) then 
    --     self.ball.y = self.ball.y -5
    --     self.ball.verticalDirection = -1 * self.ball.verticalDirection
    -- end
    if ballPadelCollision['objectTop']  then
        self.ball:reverseVerticalDirection(self.playerPadel.y-particleHeight)
    end

    for i,value in ipairs (self.blocks) do

        self.blocks[i]:update(dt)
        local ballBlockCollision = self.ball:collision(self.blocks[i])

        if  ballBlockCollision['objectLeft'] then
            self.ball:reverseHorizontalDirection(self.blocks[i].x -particleWidth)
        end
        if  ballBlockCollision['objectRight'] then
            self.ball:reverseHorizontalDirection(self.blocks[i].x +(self.blocks[i].width))
        end
        if ballBlockCollision['objectBottom']  then
            self.ball:reverseVerticalDirection(self.blocks[i].y +(self.blocks[i].height))    
        end
        if  ballBlockCollision['objectTop'] then
            self.ball:reverseVerticalDirection(self.blocks[i].y -particleHeight)
        end

        if ballBlockCollision['objectRight'] or ballBlockCollision['objectLeft'] or ballBlockCollision['objectTop'] or ballBlockCollision['objectBottom'] then
            self.score = self.score + (50*(1/i))
            self.blocks[i].blockIndex = self.blocks[i].blockIndex -1 
            if self.blocks[i].blockIndex == 0 then
                table.remove(self.blocks,i)
            end
        end
    end

end

function PlayState:render()

    if not self.start then
        love.graphics.printf('Press Enter To Start!', 0, 64+100, VIRTUAL_WIDTH, 'center')
    end

    for i = 1, self.health do 
        love.graphics.draw(heartsAtlas,heartsQuads[1],i*10,10,0,0.75,0.75)
    end

    love.graphics.printf(self.score, 0, 20, VIRTUAL_WIDTH-20)
 
    for i = 1 , #self.blocks do
        self.blocks[i]:render()
    end

    self.playerPadel:render()
    self.ball:render()
end