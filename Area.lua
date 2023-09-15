Object = require 'libraries.classic.classic'
Area = Object:extend()

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
  for _, gameObject in ipairs(self.gameObjects) do
    gameObject:draw(self.room.x, self.room.y)
  end
end

function Area:addGameObject(gameObjectType, x, y, opts)
  local opts = opts or {}
  local gameObject = _G[gameObjectType](self, x or 0, y or 0, opts)
  table.insert(self.gameObjects, gameObject)
  return gameObject
end

function Area:getGameObjects(callBack)
  local results = {}
  
  for k, e in pairs(self.gameObjects) do
    if callBack(v) then
      table.insert(results, e)
    end
  end
  return results
end


return Area
