Timer = require 'libraries.hump.timer'
Object = require 'libraries.classic.classic'
Area = require 'Area'
Circle = require 'Circle'
Player = require 'Player'

StageRoom = Object:extend()

function StageRoom:new(_, x, y)
  self.area = Area(self)
  self.mainCanvas = love.graphics.newCanvas(gw, gh)
  --self.area:addGameObject('Circle', self.x, self.y)
  self.player = self.area:addGameObject('Player', gw/2, gh/2)
end

function StageRoom:update(dt)
  timer:update(dt)
end

function StageRoom:draw()
  --self.area:draw()
  love.graphics.setCanvas(self.mainCanvas)
  love.graphics.clear()
  love.graphics.circle('line', gw/2, gh/2, 50)
  self.area:draw()
  love.graphics.setCanvas()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.setBlendMode('alpha', 'premultiplied')
  love.graphics.draw(self.mainCanvas, 0, 0, 0, sx, sy)
  love.graphics.setBlendMode('alpha')
end

return StageRoom
