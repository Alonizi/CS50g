require 'class'
require 'Pipe'
Pipes = class{}


function Pipes:init(x,y) 
self.pipes = {
    ['Top'] = Pipe(x,y),
    ['Bottom'] = Pipe(x,y)
}
self.objectPassed = false 

end 

function Pipes:update(dt) 
    self.pipes['Top']:update(dt)
    self.pipes['Bottom']:update(dt)

end

function Pipes:render()
    self.pipes['Top']:render()
    self.pipes['Bottom']:render()

end