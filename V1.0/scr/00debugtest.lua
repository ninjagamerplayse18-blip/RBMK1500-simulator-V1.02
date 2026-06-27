--test page yay
local page = {} 

function page.draw()
    for r = 1,3 do 
        for c = 1,9 do
            local cell = channel[r][c]
            local x = c*85 - 40
            local y = r*85
            
            if cell.type ~= "ghost" then
                -- FIXED ALL: Changed love.graphics.setColour to love.graphics.setColor
                if cell.type == "fuelchannel" then 
                    love.graphics.setColor(0,0,0)
                    love.graphics.rectangle("fill",x+60,y+5,10,10)
                    love.graphics.setColor(1,1,1)
                    love.graphics.rectangle("line",x+60,y+5,10,10)
                end
                
                if cell.type == "fuelchannel" then
                    love.graphics.setColor(1,0.4,0) --btw this is thermal orange
                    love.graphics.print(string.format("%.0f C", cell.temperature),x+5,y+25)
                    love.graphics.print(string.format("%.1f MW", cell.power),x+5,y+45)
                elseif cell.type == "rr" then
                    love.graphics.setColor(1,0.4,0) 
                    love.graphics.print("rodctrl",x+5,y+25)
                    love.graphics.print(string.format("IN: %.0f%%", cell.power*100),x+5,y+45)
                elseif cell.type == "ar" then
                    love.graphics.setColor(1,0.4,0) 
                    love.graphics.print("rodctrl",x+5,y+25)
                    love.graphics.print(string.format("IN: %.0f%%", cell.power*100),x+5,y+45)
                elseif cell.type == "fasr" then
                    love.graphics.setColor(1,0.4,0) 
                    love.graphics.print("rodctrl",x+5,y+25)
                    love.graphics.print(string.format("IN: %.0f%%", cell.power*100),x+5,y+45)
                end
            end
            
        end
    end
end

return page
