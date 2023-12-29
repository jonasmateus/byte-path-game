Player = GameObject:extend()

function Player:new(area, x, y, opts)
  Player.super.new(self, area, x, y, opts)

  self.x, self.y = x, y
  self.w, self.h = 12, 12
  self.collider = self.area.world:newCircleCollider(self.x, self.y, self.w)
  self.collider:setObject(self)

  self.radians = -math.pi/2
  self.radians_v = 1.66*math.pi
  self.v = 0
  self.max_v = 100
  self.a = 100
end

function Player:update(dt)
  Player.super.update(self, dt)

  if input:down('left') then self.radians = self.radians - self.radians_v*dt end
  if input:down('right') then self.radians = self.radians + self.radians_v*dt end

  self.v = math.min(self.v + self.a*dt, self.max_v)
  self.collider:setLinearVelocity(self.v*math.cos(self.radians), self.v*math.sin(self.radians))
end

function Player:draw()
  love.graphics.circle('line', self.x, self.y, self.w)
  love.graphics.line(self.x, self.y, self.x + 2*self.w*math.cos(self.radians), self.y + 2*self.w*math.sin(self.radians))
end

return Player
