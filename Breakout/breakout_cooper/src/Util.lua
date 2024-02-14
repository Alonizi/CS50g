 blocksAtlas = love.graphics.newImage("graphics/blocks.png") 
 arrowsAtlas = love.graphics.newImage("graphics/arrows.png")
 heartsAtlas = love.graphics.newImage("graphics/hearts.png")

-- function spliceBlocks() 
--     block = {}

--     for i = 0 , 17*4 ,17 do
    
--         for y = 0 , 32*6 , 32 do
--            local quad = love.graphics.newQuad() 
--         end
--     end 

-- end


function spliceBlocks() 
    blocks = {}

    for y = 0 , 16*4 ,16 do
    
        for x = 0 , 32*5 , 32 do
           local quad = love.graphics.newQuad(x,y,32,16,blocksAtlas) 
           table.insert(blocks,quad)
        end
    end 

    return blocks
end

function splicePaddles() 

     paddles = {} 

    for y = 64 , 160 , 32 do 
        local quad = love.graphics.newQuad(33,y,62,16,blocksAtlas)
        table.insert(paddles,quad)
    end

    return paddles 
end

function spliceArrows() 

    arrowsQuads = {}

    for x = 0 , 50 , 25 do
        table.insert(arrowsQuads,love.graphics.newQuad(x,0,24,24,arrowsAtlas))
    end

    return arrowsQuads
end

function spliceHearts()
    heartsQuads ={}

    for x= 0 , 10 , 20 do
        table.insert(heartsQuads,love.graphics.newQuad(x,0,10,9,heartsAtlas))
    end

    return heartsQuads 
end