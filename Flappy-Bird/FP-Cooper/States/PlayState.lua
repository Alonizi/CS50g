require 'class' 
require 'Pipe'
require 'Bird'
require 'StateMachine'

PlayState = class{}

function PlayState:init() 
    timer = 0 
    pipes = {Pipe(600,100)}
    pipesSpawnInterval = 2

    

end 

function PlayState:render() 
    for key , pipe in pairs(pipes) do
        pipe:render()
    end

    bird:render() 
end 



function PlayState:update(dt)
    timer = dt + timer 
    bird:update(dt)

    for key , pipe in pairs(pipes) do

        if pipe:detectCollision(bird) then
            gStateMachine:change('MainMenu')
        end
        -- score a point if Bird pass Pipe
        if(not pipe.objectPassed) then
            if bird.x > pipe.x then
                score = score + 1
                pipe.objectPassed = true
            end
        end

        --spawn pipes every pipesSpawnInterval
        if timer > pipesSpawnInterval then
            table.insert(pipes,Pipe(600,100))
            timer = 0 

        end

        -- remove pipes after passing screen limit
        if pipe.x < -pipeImage:getWidth()  then
        table.remove(pipes,key)
        end 

        pipe:update(dt)
    end



end 

function PlayState:exit() end 

function PlayState:enter() end 
