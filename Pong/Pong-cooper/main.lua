Class = require "Class"
require "Ball"
require "Rectangle"

function love.load()
    screenWidth = 300
    screenHeight = 400
    rectangle1 = Rectangle(screenWidth - 250, screenHeight - 300, 30, 80, 200)
    rectangle2 = Rectangle(screenWidth - 50, screenHeight - 100, 30, 80, 200)
    ball = Ball(screenWidth / 2, (screenHeight / 2) - 20, 10, 100)
    score1 = 0
    score2 = 0
    ballDirectionRandomX = love.math.random(-1, 1)
    ballDirectionRandomY = love.math.random(-1, 1)
    love.graphics.setDefaultFilter('nearest')
    love.window.setMode(screenWidth, screenHeight, {})
    gameState = "Pause"
    speedAi = 0
    SpeedAiPrev = 0
    collision = 0
end

local val = 0
function love.update(dt)

    if (gameState == "Pause") then
        ball:reset()
        collision = 0
        ball.speed = 100
    end

    if (gameState == "Start") then
        -- AI
        if true then

            if ball.y + ball.size < rectangle1.y + 40 then
                -- rectangle1:update(-1 * dt * (1.5 / 1.05 ^ collision))
                rectangle1:update(-4.5 * dt * 1 / (1.05 ^ collision))

                speedAi = speedAi + 1

            end
            if ball.y > rectangle1.y + rectangle1.height - 40 then
                rectangle1:update(4.5 * dt * (1 / 1.05 ^ collision))
                speedAi = speedAi + 1

            end

        end

        -- manage scores 
        if ball.x + ball.size > screenWidth then
            score1 = score1 + 1
            gameState = "Pause"
            -- ball.speed = 100
        end
        if ball.x < 0 then
            score2 = score2 + 1
            gameState = "Pause"
            -- ball.speed = 100
        end
        -- limit paddles movement
        rectangle1:confineMovement(screenHeight, screenWidth)
        rectangle2:confineMovement(screenHeight, screenWidth)
        -- move ball
        ball:update(dt, ballDirectionRandomX, ballDirectionRandomY)
        -- bounce ball off vertical edges
        if (ball.x < screenWidth and ball.x > 0) and (ball.y <= 0 or ball.y >= screenHeight - 10) then
            local condition = ball.y <= 0 and 1 or -1
            ball.y = ball.y + condition * ball.size
            ballDirectionRandomY = -1 * ballDirectionRandomY
            SpeedAiPrev = speedAi
            speedAi = 0
            -- collision = collision + 1
            -- ball.speed = ball.speed * 1.05

        end
        -- detect collision 
        if ball:detectCollision(rectangle2) then
            ball.x = ball.x - ball.size
            ballDirectionRandomX = -1 * ballDirectionRandomX
            ball.speed = ball.speed * 1.05
            collision = collision + 1

            -- ball:reset()
        end
        -- detect collision 
        if ball:detectCollision(rectangle1) then
            ball.x = ball.x + ball.size
            ballDirectionRandomX = -1 * ballDirectionRandomX
            ball.speed = ball.speed * 1.05
            collision = collision + 1

            -- ball.x = ball.size
            -- ball:reset()
        end
        -- move paddles
        if love.keyboard.isDown("w") then
            rectangle1:update(-1 * dt)
            -- rectangleY = rectangleY - (200 * dt)
            -- val = val+dt
        end
        if love.keyboard.isDown("s") then
            rectangle1:update(dt)
            -- rectangleY = rectangleY + (200 * dt)
        end

        if love.keyboard.isDown("up") then
            rectangle2:update(-1 * dt)
            -- rectangle2Y = rectangle2Y - 1
            -- val = val+dt
        end
        if love.keyboard.isDown("down") then
            rectangle2:update(dt)
            -- rectangle2Y = rectangle2Y + 1
        end
    end

    if love.keyboard.isDown("q") then
        love.event.quit()
    end

    if love.keyboard.isDown("r") then
        ball:reset()
        ballDirectionRandomX = love.math.random(-1, 1)
        ballDirectionRandomY = love.math.random(-1, 1)

    end

    if love.keyboard.isDown("space") then
        gameState = "Start"
    end

    -- end
    -- if ball.y < 0 then
    --     score2 = score2 + 1
    --     ball:reset()
    --     -- bally = (screenHeight / 2) - 20
    --     ballDirectionRandomX = love.math.random(-1, 1)
    --     ballDirectionRandomY = love.math.random(-1, 1)

    -- end

end

function love.draw()
    love.graphics.print(score1, 20, 20)
    love.graphics.print(score2, screenWidth - 20, 25)
    love.graphics.print(gameState, screenWidth / 2, 25)
    love.graphics.print(ballDirectionRandomX, screenWidth / 2, screenHeight / 2)
    love.graphics.print(ballDirectionRandomY, 10 + screenWidth / 2, 10 + screenHeight / 2)
    -- love.graphics.print(speedAi, 10 + screenWidth / 2, 30 + screenHeight / 2)
    love.graphics.print(SpeedAiPrev, screenWidth / 2, 30 + screenHeight / 2)

    rectangle1:render()
    rectangle2:render()
    ball:render()
end
