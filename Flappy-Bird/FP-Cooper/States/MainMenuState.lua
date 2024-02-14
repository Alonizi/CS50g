require 'class'
require 'StateMachine'


MainMenuState = Class{__includes = BaseState}

function MainMenuState:init()
    self.timer = 0 
    self.text = "Press G to Start"
    self.count = 3 

end 

function MainMenuState:render() 

love.graphics.print(self.text,VIRTUAL_WIDTH/2,VIRTUAL_HEIGHT/2)

end 

function MainMenuState:update(dt)

        
    
    if love.keyboard.keysPressed['g'] then
        
        self.timer = self.timer + dt 
        self.text = self.count 

        if self.timer >1 then
            self.timer = 0 
            self.count = self.count -1 
        end

        if self.count == 2 then
        love.keyboard.keysPressed['g'] = false
        gStateMachine:change('PlayState')
        end
    end
end 

function MainMenuState:exit() end 

function MainMenuState:enter() end 


