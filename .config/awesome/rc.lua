-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
              require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")
naughty.config.defaults['icon_size'] = 100

local lain          = require("lain")
local freedesktop   = require("freedesktop")

local menubar = require("menubar")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")

local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- Themes
local themes = {
  "powerarrow-blue", -- 1
  "powerarrow",      -- 2
  "multicolor",      -- 3
  "powerarrow-mix"  -- 4
}

-- choose your theme here
local chosen_theme = themes[1]
local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme)
beautiful.init(theme_path)

--[[ Default Themes
local defthemes = {
  "default",
  "gtk",
  "sky",
  "xresources",
  "zenburn",
}
local chosen_def_theme = defthemes[5]
beautiful.init(gears.filesystem.get_themes_dir() .. string.format("%s/theme.lua", chosen_def_theme))
]]

-- {{{ Variable definitions
-- This is used later as the default terminal and editor to run.
terminal = "st"
editor = os.getenv("EDITOR") or "emacs"
editor_cmd = terminal .. " -e " .. "nvim"
BROWSER1 = "brave"
BROWSER2 = "qutebrowser"
FILEMANAGER = "pcmanfm"
MUSICPLAYER = "strawberry"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
altkey = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    --awful.layout.suit.tile.left,
    awful.layout.suit.floating,
    awful.layout.suit.max,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "edit config", editor_cmd .. " " .. os.getenv("HOME") .. "/.config/awesome/rc.lua" },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
 }

poweroff = os.getenv("HOME") .. "/.local/bin/scripts/prompt 'poweroff?' 'systemctl poweroff'"
reboot = os.getenv("HOME") .. "/.local/bin/scripts/prompt 'reboot?' 'systemctl reboot'"
hibernate = os.getenv("HOME") .. "/.local/bin/scripts/prompt 'hibernate?' 'systemctl hibernate'"
mymainmenu = freedesktop.menu.build({
     icon_size = beautiful.menu_height or 16,
     before = {
         { "Awesome", myawesomemenu, beautiful.awesome_icon },
         -- other triads can be put here
     },
     after = {
         { "Terminal", terminal },
         { "Log out", function() awesome.quit() end },
         { "Sleep", "systemctl suspend" },
         { "Hibernate", hibernate },
         { "Reboot", reboot},
         { "Poweroff", poweroff },
         -- other triads can be put here
     }
 })

awful.util.terminal = terminal

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar

--awful.util.tagnames = { "🌐", "📺", "⚙️", "🎧", "🎬", "🗨️", "📂","🖥️", "🗄️" }
awful.util.tagnames = { " ", " ", " ", " ", " ", " ", " ", " ", " " }
--awful.util.tagnames = { "Web", "Dev", "Cfg", "Mus", "Vid", "Chat", "Doc", "Sys", "Others" }

awful.util.taglist_buttons = my_table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)


lain.layout.termfair.nmaster           = 3
lain.layout.termfair.ncol              = 1
lain.layout.termfair.center.nmaster    = 3
lain.layout.termfair.center.ncol       = 1
lain.layout.cascade.tile.offset_x      = 2
lain.layout.cascade.tile.offset_y      = 32
lain.layout.cascade.tile.extra_padding = 5
lain.layout.cascade.tile.nmaster       = 5
lain.layout.cascade.tile.ncol          = 2


-- for using the default themes comment the line below
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)

root.buttons(my_table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end)
   -- awful.button({ }, 4, awful.tag.viewnext),
   -- awful.button({ }, 5, awful.tag.viewprev)
))

 -- for using the defualt themes uncomment the lines below until globalkeys
--[[ awful.screen.connect_for_each_screen(function(s)

      --Each screen has its own tag table.
      awful.tag({ "Web", "Dev", "Mus", "Vid", "Chat", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

      -- Create a promptbox for each screen
      s.mypromptbox = awful.widget.prompt()
      -- Create an imagebox widget which will contain an icon indicating which layout we're using.
      -- We need one layoutbox per screen.
      s.mylayoutbox = awful.widget.layoutbox(s)
      s.mylayoutbox:buttons(gears.table.join(
                             awful.button({ }, 1, function () awful.layout.inc( 1) end),
                             awful.button({ }, 3, function () awful.layout.inc(-1) end),
                             awful.button({ }, 4, function () awful.layout.inc( 1) end),
                             awful.button({ }, 5, function () awful.layout.inc(-1) end)))
      --Create a taglist widget
      s.mytaglist = awful.widget.taglist {
          screen  = s,
          filter  = awful.widget.taglist.filter.all,
          buttons = taglist_buttons
      }

      -- Create a tasklist widget
      s.mytasklist = awful.widget.tasklist {
          screen  = s,
          filter  = awful.widget.tasklist.filter.currenttags,
          buttons = tasklist_buttons
      }

      -- Create the wibox
      s.mywibox = awful.wibar({ position = "top", screen = s })

      -- Add widgets to the wibox
      s.mywibox:setup {
          layout = wibox.layout.align.horizontal,
          --{  Left widgets
              layout = wibox.layout.fixed.horizontal,
              --mylauncher,
              s.mytaglist,
              s.mypromptbox,
          --},
          s.mytasklist,  Middle widget
          {  Right widgets
              layout = wibox.layout.fixed.horizontal,
              mykeyboardlayout,
              wibox.widget.systray(),
              mytextclock,
              s.mylayoutbox,
          --},
      }
 end)
  ---- }}}
]]
function tag_focus(i)
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
         tag:view_only()
      end
end
-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "w", function () mymainmenu:toggle() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

-- Dynamic tagging
    awful.key({ modkey, "Shift" }, "n", function () lain.util.add_tag() end,
              {description = "add new tag", group = "tag"}),
    awful.key({ modkey, "Shift" }, "r", function () lain.util.rename_tag() end,
              {description = "rename tag", group = "tag"}),
    awful.key({ modkey, "Shift" }, "Left", function () lain.util.move_tag(-1) end,
              {description = "move tag to the left", group = "tag"}),
    awful.key({ modkey, "Shift" }, "Right", function () lain.util.move_tag(1) end,
              {description = "move tag to the right", group = "tag"}),
    awful.key({ modkey, "Shift" }, "d", function () lain.util.delete_tag() end,
              {description = "delete tag", group = "tag"}),


    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
--    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
--              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey },            "r",     function () awful.util.spawn("dmenu_run -h 20") end,
              {description = "dmenu_run prompt", group = "launcher"}),

    awful.key({ modkey , altkey },            "u",     function () awful.spawn.with_shell("$HOME/Downloads/Programs/dmenu/scripts/dmenuunicode") end,
              {description = "dmenu emoji", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),

    -- Nekoray
    awful.key({ modkey , altkey},            "n",     function () awful.util.spawn(os.getenv("HOME") .. "/Downloads/Software/nekoray/nekobox") end,
        {description = "Launchs Nekobox", group = "applications"}),
    -- Browser
    awful.key({ modkey },            "b",     function () awful.util.spawn(BROWSER1 .. " " .. "--enable-features=VaapiVideoDecodeLinuxGL") tag_focus (1) end,
        {description = "Launchs " .. BROWSER1 , group = "applications"}),

    -- Browser
    awful.key({ modkey, altkey },    "b",     function () awful.util.spawn(BROWSER2) end,
        {description = "Launchs " .. BROWSER2 , group = "applications"}),

    -- Launchs editor with rc.lua
    awful.key({ modkey, "Control" },  "e",     function () awful.spawn(editor_cmd .. " " .. os.getenv("HOME") .. "/.config/awesome/rc.lua") end,
        {description = "Launchs " .. editor .. " with rc.lua", group = "applications"}),

    -- Lanuches Qtcreator
    awful.key({ modkey, altkey },  "q",     function () awful.spawn("qtcreator") end,
        {description = "Launchs Qtcreator", group = "applications"}),

    -- Launchs setwal script
    awful.key({ modkey, altkey },  "s",     function () awful.spawn.with_shell("$HOME/.local/bin/scripts/setwal") end,
        {description = "Set The Wallpaper", group = "applications"}),

    -- PassMenu
    awful.key({ modkey, altkey },    "p",     function () awful.util.spawn("passmenu") end,
        {description = "Launchs passmenu", group = "applications"}),

    -- Screenshots
    awful.key({ }, "Print", function () awful.spawn.with_shell("flameshot full -c && notify-send 'Screenshot Saved in The Clipboard'") end,
        {description = "full Screenshot", group = "screenshots"}),

    awful.key({ "Shift" }, "Print", function () awful.util.spawn("flameshot gui") end,
        {description = "flameshot launcher", group = "screenshots"}),

    --lockscreen
    awful.key({ modkey, altkey }, "l", function () awful.util.spawn("i3lock") end,
        {description = "lockscreen", group = "awesome"}),

    -- Brightness
    awful.key({ }, "XF86MonBrightnessUp",
    function ()
      os.execute("xbacklight -inc 10")
      awful.spawn.with_shell("notify-send -t 400 Brightness: \"$(xbacklight -get)\"")
    end),

    awful.key({ }, "XF86MonBrightnessDown",
    function ()
      os.execute("xbacklight -dec 10")
      awful.spawn.with_shell("notify-send -t 400 Brightness: \"$(xbacklight -get)\"")
    end),

    -- Alsa/Pulse volume control
    awful.key({ }, "XF86AudioRaiseVolume",
        function ()
            --os.execute(string.format("amixer -q set %s 3%%+", beautiful.volume.channel)) --for alsa
            os.execute("pamixer --allow-boost -i 3")
            if #awful.screen.focused().clients > 0 and screen[1].clients[1].fullscreen then
                awful.spawn.with_shell("notify-send -t 500 \"Current Volume Level:\" \"$(pamixer --get-volume)%\"")
            end
                beautiful.volume.update()
        end),

    awful.key({ }, "XF86AudioLowerVolume",
        function ()
            --os.execute(string.format("amixer -q set %s 3%%-", beautiful.volume.channel)) --for alsa
            os.execute("pamixer --allow-boost -d 3")
            if #awful.screen.focused().clients > 0 and screen[1].clients[1].fullscreen then
                awful.spawn.with_shell("notify-send -t 500 \"Current Volume Level:\" \"$(pamixer --get-volume)%\"")
            end
                beautiful.volume.update()
        end),

    awful.key({ }, "XF86AudioMute",
        function ()
            os.execute(string.format("pamixer -t", beautiful.volume.togglechannel or beautiful.volume.channel))
            beautiful.volume.update()
        end),

    -- Audio Media Buttons for mocp
    awful.key({ }, "XF86AudioPlay", function () awful.spawn.with_shell("playerctl -a play-pause || " .. os.getenv("HOME") .. "/.moc/scripts/mocmedia") end,
        {description = "Play/Pause Music", group = "media buttons"}),
    awful.key({ }, "XF86AudioStop", function () awful.spawn.with_shell("playerctl -a stop || " .. "mocp -s") end,
        {description = "Stop Music", group = "media buttons"}),
    awful.key({ }, "XF86AudioPrev", function () awful.spawn.with_shell("playerctl -a previous || " .. "mocp -r") end,
        {description = "Previous Music", group = "media buttons"}),
    awful.key({ }, "XF86AudioNext", function () awful.spawn.with_shell("playerctl -a next || " .. "mocp -f") end,
        {description = "Next Music", group = "media buttons"}),

    -- Launchs Editor
    awful.key({  modkey, altkey  }, "e",      function () awful.util.spawn(editor_cmd) end,
        {description = "Launchs Editor", group = "applications"}),
    -- Launchs Music Player
    awful.key({ modkey, altkey  },  "m",     function () awful.util.spawn(MUSICPLAYER) tag_focus (4) end,
        {description = "Launchs Mocp", group = "applications"}),

    -- Launchs vifm
    awful.key({ modkey, altkey  }, "f", function () awful.spawn.with_shell(terminal .. " -e " .. os.getenv("HOME") .. "/.config/vifm/scripts/vifmrun" ) end,
        {description = "Launchs vifm" , group = "applications" }),

    -- Launchs filemanager
    awful.key({ modkey  }, "e", function () awful.util.spawn(FILEMANAGER) end,
        {description = "Launchs pcmanfm" , group = "applications" }),

    -- Launchs Telegram
    awful.key({ modkey, altkey },  "t",     function () awful.util.spawn("telegram-desktop") tag_focus (6) end,
        {description = "Launchs telegram", group = "applications"})

)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Shift" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"})
     --awful.key({ modkey, "Shift"   }, "m",
         --function (c)
             --c.maximized_horizontal = not c.maximized_horizontal
             --c:raise()
         --end ,
         --{description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    { rule = { class = "TelegramDesktop" },
            properties = { tag = " " , floating = true} },

    { rule = { class = "xdman-Main" },
            properties = { floating = true} },

    { rule = { class = "persepolis" },
            properties = { floating = true} },

    { rule = { class = "mocp" },
            properties = { tag = " " }},

    { rule = { instance = "qutebrowser" },
            properties = { tag = " " } },

    { rule = { class = "Io.github.celluloid_player.Celluloid" },
            properties = { tag = " ", maximized = true } },

    { rule = { class = "mpv" },
            properties = {  maximized = true } },
    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Qalculate-gtk",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "TelegramDesktop",
          "Xarchiver",
          "Engrampa",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
          "Clementine image viewer",
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

--[[ Enable sloppy focus, so that focus follows mouse.
--client.connect_signal("mouse::enter", function(c)
--     c:emit_signal("request::activate", "mouse_enter", {raise = true}) --was false before
--end)
]]

-- No border for maximized clients
function border_adjust(c)
    if c.maximized then -- no borders if only 1 client visible
        c.border_width = 0
    elseif #awful.screen.focused().clients > 1 then
        c.border_width = beautiful.border_width
        c.border_color = beautiful.border_focus
    end
end

client.connect_signal("focus", border_adjust)
client.connect_signal("property::maximized", border_adjust)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- Auto Start Apps
awful.spawn.with_shell("picom")
awful.spawn.with_shell("pgrep fusuma || fusuma")
