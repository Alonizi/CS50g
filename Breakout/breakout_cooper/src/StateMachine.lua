
StateMachine = class{}

function StateMachine:init(states) 
    self.states = states
    self.current = BaseState()

end

function StateMachine:change(stateName,params)
    love.keyboard.keysPressed={}
    self.current:exit() 
    self.current = self.states[stateName]
    self.current:enter(params)
end

function StateMachine:render()
    self.current:render()
end

function StateMachine:update(dt)
    self.current:update(dt)
end
