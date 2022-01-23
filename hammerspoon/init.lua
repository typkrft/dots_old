-- H A M M E R S P O O N  I N I T

-- NOTE: How to add package paths and require 
-- package.path = package.path .. ';/Users/brandon/.luarocks/share/lua/5.4/?.lua'
-- htmlEntities = require('htmlEntities')

-- Install Hammerspoon CLI
-- NOTE: Needed for the commandline tool
require("hs.ipc")
-- hs.ipc.cliInstall("/opt/homebrew") 

-- Reload Hammerspoon Config Automatically
function reloadConfig(files)
    -- Kill wifi watcher
    if wifiWatcher then
      wifiWatcher:stop()
    end
    -- Kill caffeine
    if caffeine then
      caffeine:delete()
    end
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

-- Create Todos from Firefox URLs
-- TODO: Send Notification via native or in sketchybar...Consider making a Notification theme that hides everything displays the notification title on left message on right and disappears (not sure if this would be blocking)
function create_todo()
  local old_clip = hs.pasteboard.getContents()
  hs.pasteboard.setContents("")
  
  ff = hs.application.get'Firefox'
  ff:activate()
  local window_title = ff:focusedWindow():title()

  hs.eventtap.keyStroke({'cmd'}, 'L', nil, app)
  hs.eventtap.keyStroke({'cmd'}, 'C', nil, app)

  local the_url = hs.pasteboard.getContents()

  hs.pasteboard.setContents(old_clip)

  local things_applescript = [[
    tell application "Things3"
      launch
      set newToDo to make new to do with properties {name: "]] .. window_title .. [[", notes: "]] .. the_url .. [["} at beginning of list "Inbox"
    end tell
  ]]

  hs.osascript.applescript(things_applescript)

end

-- Close Firefox Windows used in SKHD
function closeWindow() 
    local app = hs.application.find("Firefox")
    app:selectMenuItem({"File", "Close Window"})
end

-- TODO: Window Borders
-- FIXME:
-- Get Windows in Space
-- Apply border to active window
-- Apply different border to innactive windows
function highlight_window(window_id, color)
  -- hs.alert.show(window_id)
  -- local visible_windows = hs.window.visibleWindows()
  local active_win = hs.window.get(window_id)
  -- 
  -- inactive_borders = {}
  --
  -- for i in pairs(visible_windows) do
  --   inactive_borders[i] = "a" 
  --   print(inactive_borders[i])
  -- end
  --
  --
  -- for i in pairs(visible_windows) do

    -- if visible_windows[i] == active_win then
      local screen = active_win:screen()
      local max = screen:fullFrame()
      local f = active_win:frame()
      active_border = nil ; collectgarbage()
      active_border = hs.canvas.new{x=max.x, y=max.y, h=max.h, w=max.w}:appendElements({
          type = "rectangle",
          action="stroke",
          strokeWidth=5.0,
          strokeColor={red = 0.31372549, blue = 0.48235294, green = 0.98039216},
          frame = {x=f.x, y=f.y, h=f.h, w=f.w}
          }):show()
  --   else
  --     print(i)
  --     local screen_inactive = visible_windows[i]:screen()
  --     local max_inactive = screen_inactive:fullFrame()
  --     local f_inactive = visible_windows[i]:frame()
  --     inactive_borders[i] = nil ; collectgarbage()
  --     inactive_borders[i] = hs.canvas.new{x=max_inactive.x, y=max_inactive.y, h=max_inactive.h, w=max_inactive.w}:appendElements({
  --         type = "rectangle",
  --         action="stroke",
  --         strokeWidth=5.0,
  --         strokeColor= {green=1.0},
  --         frame = {x=f_inactive.x, y=f_inactive.y, h=f_inactive.h, w=f_inactive.w}
  --         }):show()

      -- print("no")
    -- end
  end
-- end

-- Dump Table
-- NOTE: Used to debug
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

-- -- Kitty Quake
-- -- TODO: Start Kitty with a Name and unmanage it 
-- -- TODO: Change Keybinds and run from SKHD
-- -- Install https://github.com/asmagill/hs._asm.undocumented.spaces
-- local spaces = require('hs._asm.undocumented.spaces') 
--
-- -- Switch kitty
-- hs.hotkey.bind({'alt','shift','ctrl'}, 'j', function ()
--   local APP_NAME = 'kitty'
--   function moveWindow(kitty, space, mainScreen)
--     -- move to main space
--     local win = nil
--     while win == nil do
--       win = kitty:mainWindow()
--     end
--     print(win)
--     print(space)
--     print(win:screen())
--     print(mainScreen)
--     local fullScreen = not win:isStandard()
--     if fullScreen then
--       hs.eventtap.keyStroke('cmd', 'return', 0, kitty)
--     end
--     winFrame = win:frame()
--     scrFrame = mainScreen:fullFrame()
--     print(winFrame)
--     print(scrFrame)
--     winFrame.w = scrFrame.w
--     winFrame.y = scrFrame.y
--     winFrame.x = scrFrame.x
--     print(winFrame)
--     win:setFrame(winFrame, 0)
--     print(win:frame())
--     win:spacesMoveTo(space)
--     if fullScreen then
--       hs.eventtap.keyStroke('cmd', 'return', 0, kitty)
--     end
--     win:focus()
--   end
--   local kitty = hs.application.get(APP_NAME)
--   if kitty ~= nil and kitty:isFrontmost() then
--     kitty:hide()
--   else
--     local space = spaces.activeSpace()
--     local mainScreen = hs.screen.find(spaces.mainScreenUUID())
--     if kitty == nil and hs.application.launchOrFocus(APP_NAME) then
--       local appWatcher = nil
--       print('create app watcher')
--       appWatcher = hs.application.watcher.new(function(name, event, app)
--         print(name)
--         print(event)
--         if event == hs.application.watcher.launched and name == APP_NAME then
--           app:hide()
--           moveWindow(app, space, mainScreen)
--           appWatcher:stop()
--         end
--       end)
--       print('start watcher')
--       appWatcher:start()
--     end
--     if kitty ~= nil then
--       moveWindow(kitty, space, mainScreen)
--     end
--   end
-- end)
--
-- -- Hide kitty if not in focus
-- hs.window.filter.default:subscribe(hs.window.filter.windowFocused, function(window, appName)
--   local kitty = hs.application.get('kitty')
--   if kitty ~= nil then
--      kitty:hide()
--   end
-- end)

-- global_border = nil

-- function redrawBorder()
--     win = hs.window.focusedWindow()
--     if win ~= nil then
--         top_left = win:topLeft()
--         size = win:size()
--         if global_border ~= nil then
--             global_border:delete()
--         end
--         global_border = hs.drawing.rectangle(hs.geometry.rect(top_left['x'], top_left['y'], size['w'], size['h']))
--         global_border:setStrokeColor({["hex"]='#bd93f9',["alpha"]=1.0})
--         global_border:setFill(false)
--         global_border:setStrokeWidth(8)
--         global_border:show()
--     end
-- end

-- redrawBorder()

-- allwindows = hs.window.filter.new(nil)
-- allwindows:subscribe(hs.window.filter.windowCreated, function () redrawBorder() end)
-- allwindows:subscribe(hs.window.filter.windowFocused, function () redrawBorder() end)
-- allwindows:subscribe(hs.window.filter.windowMoved, function () redrawBorder() end)
-- allwindows:subscribe(hs.window.filter.windowUnfocused, function () redrawBorder() end)

