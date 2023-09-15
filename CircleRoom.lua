Object = require 'libraries.classic.classic'

local CircleRoom = Object:extend()

function CircleRoom:new(x, y, radius, currentTime )
  self.x = x or 0
  self.y = y or 0
  self.radius = radius or 0
  self.currentTime =  currentTime
	
end

function CircleRoom:draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.circle("fill", 400, 300, 50, 100)
end

function CircleRoom:update(dt)
end

return CircleRoom
