Timer = require 'libraries.hump.timer'
Object = require 'libraries.classic.classic'
Area = require 'src.Area'
--Circle = require 'Circle'
Player = require 'src.Player'

StageRoom = Object:extend()

function StageRoom:new(_, x, y)
  self.area = Area(self)
  self.mainCanvas = love.graphics.newCanvas(gw, gh)
  self.area:addPhysicsWorld()
  self.player = self.area:addGameObject('Player', gw/2, gh/2)
end

function StageRoom:update(dt)
  timer:update(dt)
  self.area:update(dt)
end

function StageRoom:draw()
  love.graphics.setCanvas(self.mainCanvas)
  love.graphics.clear()
  self.area:draw()
  love.graphics.setCanvas()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.setBlendMode('alpha', 'premultiplied')
  love.graphics.draw(self.mainCanvas, 0, 0, 0, sx, sy)
end

return StageRoom
