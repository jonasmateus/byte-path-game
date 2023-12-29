Object = require 'libraries.classic.classic'
Area = Object:extend()
Physics = require 'libraries.windfield.windfield'

function Area:new(room)
  self.room = room
  self.gameObjects = {}
end

function Area:update(dt)
  for i = #self.gameObjects, 1, -1 do
    local gameObject = self.gameObjects[i]
    gameObject:update(dt)
    if gameObject.dead then table.remove(self.gameObjects, i) end
  end
end

function Area:draw()
  --if self.world then self.world:draw() end
  for _, game_object in ipairs(self.gameObjects) do
    game_object:draw()
  end
end

function Area:addPhysicsWorld()
  self.world = Physics.newWorld(0, 0, true)
end

function Area:addGameObject(gameObjectType, x, y, opts)
  opts = opts or {}
  local gameObject = _G[gameObjectType](self, x or 0, y or 0, opts)
  table.insert(self.gameObjects, gameObject)
  return gameObject
end

function Area:getGameObjects(callBack)
  local results = {}
  for _, e in pairs(self.gameObjects) do
    if callBack() then
      table.insert(results, e)
    end
  end
  return results
end


return Area
