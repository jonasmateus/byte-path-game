Timer = require 'libraries.hump.timer'
Input = require 'libraries.boipushy.Input'
StageRoom = require 'StageRoom'

function love.load()
  love.graphics.setDefaultFilter('nearest','nearest')
  love.graphics.setLineStyle('rough')
  love.window.setMode(gw, gh, {resizable=true, vsync=false, minwidth=400, minheight=300})
  resize(2)
  _G.timer = Timer()

  _G.input = Input()
  input:bind('left', 'left')
  input:bind('right', 'right')

  _G.stageRoom = StageRoom()

  _G.rooms = { stageRoom }
  _G.currentRoom = nil
end

function love.update(dt)
  timer:update(dt)
  if currentRoom then currentRoom:update(dt) end
end

function love.draw()
  if currentRoom then currentRoom:draw() end
end

function _G.addRoom(roomType, roomName, ...)
    local room = _G[roomType](roomName, ...)
    rooms[roomName] = room
    return room
end

function _G.gotoRoom(roomType, roomName, ...)
  if currentRoom and rooms[roomName] then
    if currentRoom.deactivate then currentRoom:deactivate() end
    _G.currentRoom = rooms[roomName]
    if currentRoom.activate then currentRoom:activate() end
  else _G.currentRoom = addRoom(roomType, roomName, ...) end
end

function love.keypressed(key)
  if key == 'return' then gotoRoom('StageRoom', 'stageRoom') end
end

function _G.resize(s)
  love.window.setMode(s*gw, s*gh)
  _G.sx, _G.sy = s, s
end

function love.run()
  if love.math then
    love.math.setRandomSeed(os.time())
  end

  if love.load then love.load() end

  -- We don't want the first frame's dt to include time taken by love.load.
  if love.timer then love.timer.step() end

  local dt = 0

  -- Main loop time.
  while true do
    if love.event then
	    love.event.pump()
	    for name, a,b,c,d,e,f in love.event.poll() do
        if name == "quit" then
          if not love.quit or not love.quit() then
            return a
          end
        end
        love.handlers[name](a,b,c,d,e,f)
	    end
    end

    if love.timer then
	    love.timer.step()
	    dt = love.timer.getDelta()
  	end
    -- Call update and draw
	  if love.update then love.update(dt) end -- will pass 0 if love.timer is disabled

    if love.graphics and love.graphics.isActive() then
	    love.graphics.clear(love.graphics.getBackgroundColor())
	    love.graphics.origin()
      if love.draw then love.draw() end
	    love.graphics.present()
	  end

    if love.timer then love.timer.sleep(0.001) end
  end
end
