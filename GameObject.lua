Object = require 'libraries.classic.classic'
Timer = require 'libraries.hump.timer'
Utils = require 'utils'
GameObject = Object:extend()

function GameObject:new(area, x, y, opts)
  local opts = opts or {}
  if opts then for k, v in pairs(opts) do self[k] = v end end

  self.area = area
  self.x, self.y = x, y
  self.id = Utils.UUID()
  self.dead = false
  self.timer = Timer()
end

function GameObject:update(dt)
  if self.timer then self.timer:update(dt) end
end

function GameObject:draw()

end

return GameObject
