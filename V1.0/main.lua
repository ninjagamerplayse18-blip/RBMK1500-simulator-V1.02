--local page0 = require("0startup") -- copy and paste for all of the 10 pages
--local page1 = require("1maincore") -- copy and paste for all of the 10 pages
--local page2 = require("2MCP") -- copy and paste for all of the 10 pages
--local page3 = require("3FW") -- copy and paste for all of the 10 pages
--local page4 = require("4TG") -- copy and paste for all of the 10 pages
--local page5 = require("5DEA") -- copy and paste for all of the 10 pages
--local page6 = require("6CON&C") -- copy and paste for all of the 10 pages
--local page7 = require("7MISK") -- copy and paste for all of the 10 pages
--local page8 = require("8GRID") -- copy and paste for all of the 10 pages
local page00 = require("00debugtest") -- copy and paste for all of the 10 pages


local activePage = nil --change this to 0startup later

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
