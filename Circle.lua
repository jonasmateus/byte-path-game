GameObject = require 'GameObject'

Circle = GameObject:extend()

function Circle:new()
end

function Circle:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.circle("fill",
    love.math.random(400),
    love.math.random(400),
    50, 100
  )
end

return Circle
