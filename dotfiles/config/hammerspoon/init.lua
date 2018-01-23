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
-- local iterm     = 'iTerm'
-- local subl      = 'Sublime Text'

-- hs.hotkey.bind({"cmd"}, "Return", function()
--   hs.application.launchOrFocus(iterm)
-- end)

-- hs.hotkey.bind({"cmd", "alt"}, "s", function()
--   hs.application.launchOrFocus(subl)
-- end)

-- hs.hotkey.bind({"cmd", "alt"}, "f", function()
--   hs.application.launchOrFocusByBundleID("org.mozilla.nightly")
-- end)

--
--  MPC commands
--
-- hs.hotkey.bind({"cmd"}, "f7", function() hs.execute("/usr/local/bin/mpc prev") end)
-- hs.hotkey.bind({"cmd"}, "f8", function() hs.execute("/usr/local/bin/mpc toggle") hs.execute("/usr/local/bin/terminal-notifier -message 'MPD Toggle'") end)
-- hs.hotkey.bind({"cmd"}, "f9", function() hs.execute("/usr/local/bin/mpc next") end)
-- hs.hotkey.bind({"cmd"}, "f11", function() hs.execute("/usr/local/bin/mpc volume -10") hs.alert.show("mpc " .. hs.execute("/usr/local/bin/mpc volume")) end)
-- hs.hotkey.bind({"cmd"}, "f12", function() hs.execute("/usr/local/bin/mpc volume +10") hs.alert.show("mpc " .. hs.execute("/usr/local/bin/mpc volume")) end)

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
