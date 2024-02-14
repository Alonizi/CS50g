

MainMenuState = class{__includes = BaseState}


function MainMenuState:init()
    
    self.menuItems = {['start'] = true, ['highscore'] = false }
    self.test = "hi"
    self.colors = {
        ['white'] = love.graphics.setColor(1,0,0,1),
        ['blue'] = love.graphics.setColor(2,4,3,1)
    }

end 


function MainMenuState:enter(params) end

function MainMenuState:update(dt) 

    if (love.keyboard.keysPressed['s'] or love.keyboard.keysPressed['w']) then
        self.menuItems['start'] = not self.menuItems['start']
        self.menuItems['highscore'] = not self.menuItems['highscore']
        self.test = "pressesd"
        love.keyboard.keysPressed['s'] = false 
        love.keyboard.keysPressed['w'] = false

    end

    if (love.keyboard.keysPressed['return']) then
        
        if(self.menuItems['start']) then
            gStateMachine:change('PadelSelect')
        else
            gStateMachine:change('HighScore',100)
        end
    end

end

function MainMenuState:render()

    love.graphics.printf('Breakout', 0, 64, VIRTUAL_WIDTH, 'center')

    setColor(self.menuItems['start'])
    love.graphics.printf('start', 0, 64+80, VIRTUAL_WIDTH, 'center')

    setColor(self.menuItems['highscore'])
    love.graphics.printf('highscore', 0, 64+100, VIRTUAL_WIDTH, 'center')

end

function MainMenuState:exit() end


function setColor(selected) 
    if selected then
        return love.graphics.setColor(1,0,0,1)    
    else
        return love.graphics.setColor(2,3,5,1)
    end

end 


