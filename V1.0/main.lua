--local page0 = require("0startup") -- copy and paste for all of the 10 pages
--local page1 = require("1maincore") -- copy and paste for all of the 10 pages
--local page2 = require("2MCP") -- copy and paste for all of the 10 pages
--local page3 = require("3FW") -- copy and paste for all of the 10 pages
--local page4 = require("4TG") -- copy and paste for all of the 10 pages
--local page5 = require("5DEA") -- copy and paste for all of the 10 pages
--local page6 = require("6CON&C") -- copy and paste for all of the 10 pages
--local page7 = require("7MISK") -- copy and paste for all of the 10 pages
--local page8 = require("8GRID") -- copy and paste for all of the 10 pages
local page00 = require("scr.00debugtest") 
local activePage = nil               

-- 2. CREATE THE GLOBAL CHANNEL MATRIX (FIXES THE CRASH) ai
channel = {} -- This initializes the global table so page00 can see it!
for r = 1, 3 do
    channel[r] = {}
    for c = 1, 9 do
        -- Fill the grid with various cell types for visual testing
        if (r + c) % 3 == 0 then
            channel[r][c] = { type = "fuelchannel", temperature = 280, power = 4.2 }
        elseif r == 2 then
            channel[r][c] = { type = "rr", power = 0.45 }
        elseif r == 3 then
            channel[r][c] = { type = "ar", power = 0.75 }
        else
            channel[r][c] = { type = "ghost" }
        end
    end
end

-- Track total seconds passed since the game started
local time = 0

function love.update(dt)
    time = time + dt
end

function love.keypressed(key)
    if key == "0" then
        activePage = page00   
    end
end

-- ui ig
function love.draw()
    love.graphics.setColor(1, 1, 1) --this is time btw
    love.graphics.print(string.format("TIME ELAPSED: %.1fs", time), 15, 15)
   
    if activePage ~= nil then
        love.graphics.push()
        love.graphics.translate(0, 40) 
        
        activePage.draw() 
        
        love.graphics.pop()
    end
end
