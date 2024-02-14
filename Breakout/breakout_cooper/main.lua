 
class = require 'lib/class'
push = require 'lib/push'

require 'src/Util'
require 'Constants'

require 'src/states/BaseState'
require 'src/states/MainMenuState'
require 'src/states/PadelSelectState'
require 'src/states/HighScoreState'
require 'src/states/PlayState'
require 'src/models/Padel'
require 'src/models/Block'
require 'src/models/Ball'


require 'src/StateMachine'




 function love.load() 
   gStateMachine = StateMachine
      { 
         ['MainMenu'] = MainMenuState() ,
         ['HighScore'] = HighScoreState(),
         ['PadelSelect'] = PadelSelectState(),
         ['Play'] =PlayState()
      }
   
   gStateMachine:change('MainMenu')

   push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT,{
      vsync = true,
      fullscreen = false,
      resizable = true
   })

   love.keyboard.keysPressed ={}

 end

 function love.update(dt)
   gStateMachine:update(dt)
 end

 function love.draw()
   push:start()
      love.graphics.draw(
         BACKGROUND_IMG,
         0 , -- x
         0 , -- y
         0 , -- no rotation
         VIRTUAL_WIDTH/BACKGROUND_IMG:getWidth(), -- scale width
         VIRTUAL_HEIGHT/BACKGROUND_IMG:getHeight() -- scale height
      )
      gStateMachine:render()


   push:finish()
 end


 function love.keypressed(key)
   love.keyboard.keysPressed[key] = true 

   if key == 'q' then
       love.event.quit()
   end

end



   

 

 