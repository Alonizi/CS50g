VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288
WINDOW_HEIGHT = 600
WINDOW_WIDTH = 1000

push = require "push"
class = require 'class'

require 'Bird'
require 'Pipe'
require 'StateMachine'
require 'States/BaseState'
require 'States/MainMenuState'
require 'States/PlayState'


-- gStateMachine = StateMachine{
--     ['MainMenu'] = function() return MainMenuState() end 
-- }

function love.load()
    ground =  love.graphics.newImage('ground.png')  
    --ground2 = love.graphics.newImage('ground.png')
    g = 1 
    spaceReleased = false
    groundX = 500 
    background = love.graphics.newImage('background.png')
    backgroundX = -1157+512
    background2X = 0
    backgroundScroll = 0
    gravity = VIRTUAL_HEIGHT/2
    scrollBack2 = false
    timer = 0
    score = 0 
    gscrolling = false 
    difficulty = 5
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('Flappy Bird')
    bird = Bird(VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2 ,15, 3.5)
    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT,{
        fullscreen = false,
        resizable = true,
        vsync = false
    })
    love.keyboard.keysPressed = {} 
    pipes = {Pipe(600,100)}

    gStateMachine = StateMachine{
        ['MainMenu'] = function() return MainMenuState() end, 
        ['PlayState'] = function() return PlayState() end 

    }
    gscrolling = false 
    gStateMachine:change('MainMenu')

    
end

function love:keypressed(key)
    love.keyboard.keysPressed[key] = true 

    if key == 'q' then
        love.event.quit()
    end

end

function love.update(dt)
    
    if true then
    groundX = (groundX + 100* dt ) % 200
    backgroundScroll = (backgroundScroll + dt * 20) %413
    end
    gStateMachine:update(dt)

end

function love.draw()
    push:start()
    love.graphics.draw(background,-backgroundScroll,0)
    gStateMachine:render()
    love.graphics.draw(ground,-groundX,VIRTUAL_HEIGHT - ground:getHeight()) 
    love.graphics.print(score, 50, 0)
    push:finish()
end

function love.resize(w, h)
    push:resize(w, h)
end

love.keyboard.keysPressed = {} 
