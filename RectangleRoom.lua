Object = require 'libraries.classic.classic'

local RectangleRoom = Object:extend()

function RectangleRoom:new(x, y, width, height)
  self.x = x or 0
  self.y = y or 0
  self.width = width or 0
  self.height = height or 0
end

function RectangleRoom:draw()
	love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", 360, 275, 80, 50)
end

function RectangleRoom:update(dt)

end

return RectangleRoom
