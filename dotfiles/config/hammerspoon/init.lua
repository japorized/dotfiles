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
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

--
--  Hotkey to Launch Frequently Used Applications
--
local iterm     = hs.application.find('iTerm')
local subl      = hs.application.find('Sublime Text')

hs.hotkey.bind({"cmd"}, "Return", function()
  hs.application.launchOrFocus('iTerm')
end)

hs.hotkey.bind(mash, "s", function()
  hs.application.launchOrFocus(subl:name())
end)

--
--  MPC commands
--
hs.hotkey.bind({"cmd"}, "f7", function() hs.execute("mpc prev", true) end)
hs.hotkey.bind({"cmd"}, "f8", function() hs.execute("mpc toggle", true) hs.execute("terminal-notifier -message 'MPD Toggle'", true) end)
hs.hotkey.bind({"cmd"}, "f9", function() hs.execute("mpc next", true) end)
hs.hotkey.bind({"cmd"}, "f11", function() hs.execute("mpc volume -10", true) end)
hs.hotkey.bind({"cmd"}, "f12", function() hs.execute("mpc volume +10", true) end)

--
--  Window Resizing Bindings
--
-------------------------------------------------------------------------------
-- from https://github.com/exark/dotfiles/blob/master/.hammerspoon/init.lua
-- Resize window for chunk of screen.
-- For x and y: use 0 to expand fully in that dimension, 0.5 to expand halfway
-- For w and h: use 1 for full, 0.5 for half
-------------------------------------------------------------------------------
function push(x, y, w, h)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * x)
  f.y = max.y + (max.h * y)
  f.w = max.w * w
  f.h = max.h * h
  win:setFrame(f)
end

hs.hotkey.bind(mash, "f", function() push(0, 0, 1, 1) end)
hs.hotkey.bind(mash, "Left", function() push(0, 0, 0.5, 1) end)
hs.hotkey.bind(mash, "Right", function() push (0.5, 0, 0.5, 1) end)
hs.hotkey.bind(mash, "Up", function() push(0, 0, 1, 0.5) end)
hs.hotkey.bind(mash, "Down", function() push(0.5, 0, 1, 0.5) end)
hs.hotkey.bind(mash, "i", function() push(0, 0, 0.5, 0.5) end)
hs.hotkey.bind(mash, "o", function() push(0.5, 0, 0.5, 0.5) end)
hs.hotkey.bind(mash, "k", function() push(0, 0.5, 0.5, 0.5) end)
hs.hotkey.bind(mash, "l", function() push(0.5, 0.5, 0.5, 0.5) end)
hs.hotkey.bind(mash, "c", function() push(0.1, 0.1, 0.8, 0.8) end)

--
--  Window Switcher
--

-- Setting up the windowfilter
-- switcher = hs.window.switcher.new() -- default windowfilter: only visible windows, all Spaces
switcher_space = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter{}) -- include minimized/hidden windows, current Space only
-- switcher_browsers = hs.window.switcher.new{'Safari','Google Chrome'} -- specialized switcher for your dozens of browser windows :)

-- bind to hotkeys; WARNING: at least one modifier key is required!
hs.hotkey.bind('alt','tab','Next window',function()
  switcher_space:next()
  hs.alert.closeAll(0)
end)
hs.hotkey.bind('alt-shift','tab','Prev window',function()
  switcher_space:previous()
  hs.alert.closeAll(0)
end)
