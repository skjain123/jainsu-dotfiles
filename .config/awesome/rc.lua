-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
gears = require("gears")
awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
wibox = require("wibox")
-- Theme handling library
beautiful = require("beautiful")
-- Notification library
naughty = require("naughty")
menubar = require("menubar")
hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Load Debian menu entries
debian = require("debian.menu")
has_fdo, freedesktop = pcall(require, "freedesktop")

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    awful.layout.suit.floating,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "mytheme.lua")
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- Load separate configurations
require("error_handling")
require("variables")
require("wibar")
require("menu")
require("hotkeys")
require("rules")
require("signals")

-- Enable sloppy focus, so that focus follows mouse.
--[[ client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end) ]]

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)
-- }}}

-- ------------------------ Sunil's Additions --------------------------

-- set wallpaper using nitrogen
awful.spawn.with_shell("nitrogen --restore")

-- set wall paper using gears
-- gears.wallpaper.maximized("/home/sunil/Wallpapers/purplewallpaper.png", s)

-- xrandr on startup
-- awful.util.spawn("/home/sunil/.screenlayout/def.sh")
awful.util.spawn("xrandr -s 1920x1080")

-- Create gaps between windows
beautiful.useless_gap = 8

-- transparent windows
-- awful.spawn.with_shell("pkill picom")
-- awful.spawn.with_shell("picom --config /home/sunil/.config/picom/picom.conf --daemon")

-- integrate pywal
-- awful.spawn.with_shell("wal -R")
