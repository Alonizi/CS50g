require 'class' 
StateMachine = class{}


function StateMachine:init(states) 
    self.states = states
    self.empty = BaseState()
    self.current = self.empty
end

function StateMachine:change(stateName) 
    self.current:exit()
    self.current = self.states[stateName]()
    self.current:enter()
end

function StateMachine:render()
    self.current:render()
end

function StateMachine:update(dt)
    self.current:update(dt)
end



