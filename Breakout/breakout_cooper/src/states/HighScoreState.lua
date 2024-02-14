

HighScoreState = class{__includes = BaseState}


function HighScoreState:init() 
    self.score = 0
end
function HighScoreState:enter(params) 
    self.score = params
end
function HighScoreState:exit()end
function HighScoreState:update(dt) end
function HighScoreState:render()

    love.graphics.printf(self.score, 0, 64+100, VIRTUAL_WIDTH, 'center')
end
