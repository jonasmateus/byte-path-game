Object = require 'libraries.classic.classic'

local PolygonRoom = Object:extend()

function PolygonRoom:new(verticesTable)
end

function PolygonRoom:draw()
	love.graphics.polygon("fill", 100,100, 200,100, 150,200)
end

function PolygonRoom:update(dt)
end

return PolygonRoom
