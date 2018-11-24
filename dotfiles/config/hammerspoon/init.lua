--
--  Meta-key bindings
--
local mash = {"cmd", "alt", "ctrl"}
local shift_mash = {"cmd", "alt", "ctrl", "shift"}

--
--  Auto Config Reload on File Save
--
function reloadConfig(files)
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
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.config/hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
--
--
--  Window Resizing Bindings
--
-------------------------------------------------------------------------------
-- from https://github.com/exark/dotfiles/blob/master/.hammerspoon/init.lua
-- Resize window for chunk of screen.
-- For x and y: use 0 to expand fully in that dimension, 0.5 to expand halfway
-- For w and h: use 1 for full, 0.5 for half
-------------------------------------------------------------------------------
-- function push(x, y, w, h)
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()
-- 
--   f.x = max.x + (max.w * x)
--   f.y = max.y + (max.h * y)
--   f.w = max.w * w
--   f.h = max.h * h
--   win:setFrame(f)
-- end
-- 
-- hs.hotkey.bind(mash, "f", function() push(0, 0, 1, 1) end)
-- hs.hotkey.bind(mash, "Left", function() push(0, 0, 0.5, 1) end)
-- hs.hotkey.bind(mash, "Right", function() push (0.5, 0, 0.5, 1) end)
-- hs.hotkey.bind(mash, "Up", function() push(0, 0, 1, 0.5) end)
-- hs.hotkey.bind(mash, "Down", function() push(0, 0.5, 1, 0.5) end)
-- hs.hotkey.bind(mash, "i", function() push(0, 0, 0.5, 0.5) end)
-- hs.hotkey.bind(mash, "o", function() push(0.5, 0, 0.5, 0.5) end)
-- hs.hotkey.bind(mash, "k", function() push(0, 0.5, 0.5, 0.5) end)
-- hs.hotkey.bind(mash, "l", function() push(0.5, 0.5, 0.5, 0.5) end)
-- hs.hotkey.bind(mash, "c", function() push(0.1, 0.1, 0.8, 0.8) end)

--
--  Window Switcher
--

-- Setting up the windowfilter
-- switcher = hs.window.switcher.new() -- default windowfilter: only visible windows, all Spaces
-- switcher_space = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter{}) -- include minimized/hidden windows, current Space only
-- switcher_browsers = hs.window.switcher.new{'Safari','Google Chrome'} -- specialized switcher for your dozens of browser windows :)

-- bind to hotkeys; WARNING: at least one modifier key is required!
-- hs.hotkey.bind('alt','tab','Next window',function()
--   switcher_space:next()
--   hs.alert.closeAll(0)
-- end)
-- hs.hotkey.bind('alt-shift','tab','Prev window',function()
--   switcher_space:previous()
--   hs.alert.closeAll(0)
-- end)

--
--  Emoji Chooser
--
-- Build the list of emojis to be displayed.
local choices = {}
for _, emoji in ipairs(hs.json.decode(io.open("emojis/emojis.json"):read())) do
    table.insert(choices,
        {text=emoji['name'],
            subText=table.concat(emoji['kwds'], ", "),
            image=hs.image.imageFromPath("emojis/" .. emoji['id'] .. ".png"),
            chars=emoji['chars']
        })
end

-- Focus the last used window.
local function focusLastFocused()
    local wf = hs.window.filter
    local lastFocused = wf.defaultCurrentSpace:getWindows(wf.sortByFocusedLast)
    if #lastFocused > 0 then lastFocused[1]:focus() end
end

-- Create the chooser.
-- On selection, copy the emoji and type it into the focused application.
local chooser = hs.chooser.new(function(choice)
    if not choice then focusLastFocused(); return end
    hs.pasteboard.setContents(choice["chars"])
    focusLastFocused()
    hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

chooser:searchSubText(true)
chooser:choices(choices)
chooser:rows(5)
chooser:bgDark(true)

hs.hotkey.bind({"cmd", "alt"}, "E", function()
  if chooser:isVisible() then chooser:hide() else chooser:show() end
end)

--
-- FontAwesome Index
--
-- Build the list of Fontawesome icons to be displayed
local faicons = {}
for _, icon in ipairs(hs.json.decode(io.open("fa4-icons.json"):read())) do
  table.insert(faicons,
    {text=icon['name'],
      subText=icon['chars'],
      chars=icon['icon']
    })
end

-- Create chooser
local chooser2 = hs.chooser.new(function(faicons)
  if not choice then focusLastFocused(); return end
  hs.pasteboard.setContents(choice["chars"])
  focusLastFocused()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

chooser2:choices(faicons)
chooser2:rows(7)
chooser2:bgDark(true)

hs.hotkey.bind({"shift", "cmd", "alt"}, "F", function()
  if chooser2:isVisible() then choose2:hide() else chooser2:show() end
end)

-- Load Seal
-- hs.loadSpoon("Seal")
-- spoon.Seal:loadPlugins({"apps", "screencapture", "calc", "urls", "useractions"})
-- spoon.Seal.plugins.useractions.actions =
--    {
--       ["Hammerspoon docs webpage"] = {
--         url = "http://hammerspoon.org/docs/",
--         icon = hs.image.imageFromName(hs.image.systemImageNames.ApplicationIcon),
--       },
--       ["mpc commands"] = {
--         keyword = "mpc",
--         fn = function(str) hs.execute('/usr/local/bin/mpc ' .. str) end
--       },
--       ["calc & copy to clipboard"] = {
--         keyword = "calc",
--         fn = function(str) hs.execute('/usr/local/bin/calc "' .. str .. '" | tr -d "\t\n" | /usr/bin/pbcopy') end
--       },
--       ["Put Display to Sleep"] = {
--         fn = function() os.execute('/usr/bin/pmset displaysleepnow') end
--       },
--       ["Reboot Earl Grey"] = {
--         fn = function() os.execute("/usr/bin/osascript -e 'tell application " .. '"System Events"' .. " to restart'") end
--       },
--       ["Shutdown Earl Grey"] = {
--         fn = function() os.execute("/usr/bin/osascript -e 'tell application " .. '"System Events"' .. " to shut down'") end
--       },
--       ["Search on DuckduckGo"] = {
--         url = "http://duckduckgo.com/?q=${query}",
--         icon = 'favicon',
--         keyword = "d",
--       }
--     }

-- spoon.Seal:bindHotkeys({toggle={{"alt"}, "Space"}})
-- spoon.Seal:start()

