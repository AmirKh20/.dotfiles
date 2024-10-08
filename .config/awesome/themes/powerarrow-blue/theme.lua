--[[

     Powerarrow Awesome WM theme
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")
local beautiful = require("beautiful")

local math, string, os = math, string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-blue"
theme.wallpaper                                 = theme.dir .. "/dracula_arch.png"
theme.font                                      = "JetBrainsMono Nerd Font 10"
theme.taglist_font                              = "Mononoki Nerd Font 10" --"Droid Sans Regular 8"
theme.fg_normal                                 = "#FF79C6"
theme.fg_focus                                  = "#ffffff"
theme.fg_urgent                                 = "#b74822"
theme.bg_normal                                 = "#282a36"
theme.bg_focus                                  = "#A77AC4"
theme.bg_urgent                                 = "#3F3F3F"
theme.taglist_fg_focus                          = "#282a36"
theme.tasklist_bg_focus                         = "#000000"
theme.tasklist_fg_focus                         = "#A77AC4"
theme.border_width                              = 2
theme.border_normal                             = "#282a36"
--theme.border_focus                              = "#F07178"
theme.border_focus                              = "#FF79C6"
theme.border_marked                             = "#CC9393"
theme.titlebar_bg_focus                         = "#3F3F3F"
theme.titlebar_bg_normal                        = "#3F3F3F"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = 20
theme.menu_width                                = 140
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_pacman                             = theme.dir .. "/icons/pacman.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_loading                            = theme.dir .. "/icons/loading.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note.png"
theme.widget_music_pause                        = theme.dir .. "/icons/pause.png"
theme.widget_music_stop                         = theme.dir .. "/icons/stop.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.widget_task                               = theme.dir .. "/icons/task.png"
theme.widget_scissors                           = theme.dir .. "/icons/scissors.png"
theme.widget_weather                            = theme.dir .. "/icons/dish.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 4
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

local markup = lain.util.markup
local separators = lain.util.separators

terminal = "st"

-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch(
    os.getenv("HOME") .. "/.local/bin/scripts/aw-clock", 10,
    function(widget, stdout)
        widget:set_markup(" " .. markup.fontfg(theme.font,"#FEFEFE", stdout))
    end
)

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = "Mononoki Nerd Font 9",
        fg   = "#FEFEFE",
        bg   = theme.bg_normal
    }
})


-- Taskwarrior
--local task = wibox.widget.imagebox(theme.widget_task)
--lain.widget.contrib.task.attach(task, {
    -- do not colorize output
--    show_cmd = "task | sed -r 's/\\x1B\\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g'"
--})
--task:buttons(gears.table.join(awful.button({}, 1, lain.widget.contrib.task.prompt)))



-- Mail IMAP check
--local mailicon = wibox.widget.imagebox(theme.widget_mail)
--[[ commented because it needs to be set before use
mailicon:buttons(my_table.join(awful.button({ }, 1, function () awful.spawn(mail) end)))
theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        if mailcount > 0 then
            widget:set_text(" " .. mailcount .. " ")
            mailicon:set_image(theme.widget_mail_on)
        else
            widget:set_text("")
            mailicon:set_image(theme.widget_mail)
        end
    end
})
--]]

-- MPD
--[[
local musicplr = "st -title Music -g 130x34-320+16 -e ncmpcpp"
local mpdicon = wibox.widget.imagebox(theme.widget_music)
mpdicon:buttons(my_table.join(
  awful.button({ modkey }, 1, function () awful.spawn.with_shell(musicplr) end),
  --awful.button({ }, 1, function ()
      --awful.spawn.with_shell("mpc prev")
      --theme.mpd.update()
  --end),

  awful.button({ }, 2, function ()
      awful.spawn.with_shell("mpc toggle")
      theme.mpd.update()
  end),
  awful.button({ modkey }, 3, function () awful.spawn.with_shell("pkill ncmpcpp") end),
  awful.button({ }, 3, function ()
      awful.spawn.with_shell("mpc stop")
      theme.mpd.update()
  end)))
theme.mpd = lain.widget.mpd({
  settings = function()
      if mpd_now.state == "play" then
          artist = " " .. mpd_now.artist .. " "
          title  = mpd_now.title  .. " "
          mpdicon:set_image(theme.widget_music_on)
          widget:set_markup(markup.font(theme.font, markup("#FFFFFF", artist) .. " " .. title))
      elseif mpd_now.state == "pause" then
          widget:set_markup(markup.font(theme.font, " mpd paused "))
          mpdicon:set_image(theme.widget_music_pause)
      else
          widget:set_text("")
          mpdicon:set_image(theme.widget_music)
      end
  end
})
--]]


-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#FEFEFE", " " .. mem_now.used .. "MB "))
    end
})

memicon:buttons(
    my_table.join(
    awful.button({ }, 1, function() awful.spawn.with_shell("notify-send \"🧠 Memory hogs\" \"$($HOME/.local/bin/scripts/pinten mem)\"") end),
    awful.button({ "Mod4" }, 1, function() awful.spawn.with_shell(terminal .. " -e \"htop\"") end),
    awful.button({ }, 3, function() awful.spawn.with_shell(terminal .. " -e \"fkill\"") end)

))

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#FEFEFE", " " .. cpu_now.usage .. "% "))
    end
})

cpuicon:buttons(
    my_table.join(
    awful.button({ }, 1, function() awful.spawn.with_shell("notify-send \"🖥 CPU hogs\" \"$($HOME/.local/bin/scripts/pinten cpu)\"") end),
    awful.button({ "Mod4" }, 1, function() awful.spawn.with_shell(terminal .. " -e \"htop\"") end),
    awful.button({ }, 3, function() awful.spawn.with_shell(terminal .. " -e \"fkill\"") end)

))
--[[ Coretemp (lm_sensors, per core)
local temp = awful.widget.watch({awful.util.shell, '-c', 'sensors | grep Core'}, 30,
function(widget, stdout)
    local temps = ""
    for line in stdout:gmatch("[^\r\n]+") do
        temps = temps .. line:match("+(%d+).*°C")  .. "° " -- in Celsius
    end
    widget:set_markup(markup.font(theme.font, " " .. temps))
end)
--]]

-- Coretemp (lain, average)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#FEFEFE", "🌡 " .. coretemp_now .. "°C "))
    end
})
--]]
--local tempicon = wibox.widget.imagebox(theme.widget_temp)

--[[ Weather
https://openweathermap.org/
Type in the name of your city
Copy/paste the city code in the URL to this file in city_id
--]]
--local weathericon = wibox.widget.imagebox(theme.widget_weather)
--theme.weather = lain.widget.weather({
--    city_id = 123456, -- placeholder
--    notification_preset = { font = "Mononoki Nerd Font 11", fg = theme.fg_normal },
--    weather_na_markup = markup.fontfg(theme.font, "#ffffff", "N/A "),
--    settings = function()
--        descr = weather_now["weather"][1]["description"]:lower()
--        units = math.floor(weather_now["main"]["temp"])
--        widget:set_markup(markup.fontfg(theme.font, "#ffffff", descr .. " @ " .. units .. "°C "))
--    end
--})

--[[ / fs
local fsicon = wibox.widget.imagebox(theme.widget_hdd)
theme.fs = lain.widget.fs({
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Noto Sans Mono Medium 10" },
    settings = function()
        local fsp = string.format(" %3.2f %s ", fs_now["/"].free, fs_now["/"].units)
        widget:set_markup(markup.font(theme.font, fsp))
    end
})
--]]

-- Battery
local baticon = wibox.widget.imagebox(theme.widget_battery)
local bat = lain.widget.bat({
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                widget:set_markup(markup.fontfg(theme.font, "#FEFEFE","🔌 " .. bat_now.perc .. "% "))
                baticon:set_image(nil)
                return
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
                baticon:set_image(theme.widget_battery_empty)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
                baticon:set_image(theme.widget_battery_low)
            else
                baticon:set_image(theme.widget_battery)
            end
            widget:set_markup(markup.fontfg(theme.font,"#FEFEFE", " " .. bat_now.perc .. "% "))
        else
            widget:set_markup()
            baticon:set_image(theme.widget_loading)
        end
        widget:buttons(
        my_table.join(
        awful.button({ }, 1,function () awful.spawn.with_shell("notify-send Brightness: \"$(xbacklight -get)\"") end),
        awful.button({ }, 4,function () awful.spawn("xbacklight -inc 10") end),
        awful.button({ }, 5,function () awful.spawn("xbacklight -dec 10") end)
        ))
    end
})


-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volicon:set_image(theme.widget_vol_mute)
            widget:set_markup(markup.fontfg(theme.font,"#FEFEFE", " Muted "))
        elseif tonumber(volume_now.level) == 0 then
            volicon:set_image(theme.widget_vol_no)
            widget:set_markup(markup.fontfg(theme.font,"#FEFEFE", " " .. volume_now.level .. "% "))
        elseif tonumber(volume_now.level) <= 50 then
            volicon:set_image(theme.widget_vol_low)
            widget:set_markup(markup.fontfg(theme.font,"#FEFEFE", " " .. volume_now.level .. "% "))
        else
            volicon:set_image(theme.widget_vol)
            widget:set_markup(markup.fontfg(theme.font,"#FEFEFE", " " .. volume_now.level .. "% "))
        end
    end
})

-- PulseAudio
--local volicon = wibox.widget.imagebox(theme.widget_vol)
--theme.volume = lain.widget.pulse({
--    settings = function()
--        if volume_now.muted == "yes" then
--            volicon:set_image(theme.widget_vol_mute)
--            widget:set_markup(markup.fontfg(theme.font,"#FEFEFE", " Muted "))
--        elseif tonumber(volume_now.left) == 0 then
--            volicon:set_image(theme.widget_vol_no)
--            widget:set_markup(markup.fontfg(theme.font,"#FEFEFE", " " .. volume_now.left .. "% "))
--        elseif tonumber(volume_now.left) <= 50 then
--            volicon:set_image(theme.widget_vol_low)
--            widget:set_markup(markup.fontfg(theme.font,"#FEFEFE", " " .. volume_now.left .. "% "))
--        else
--            volicon:set_image(theme.widget_vol)
--            widget:set_markup(markup.fontfg(theme.font,"#FEFEFE", " " .. volume_now.left .. "% "))
--        end
--
--    end
--})
volicon:buttons(
        my_table.join(
        awful.button({ }, 1,function () awful.spawn.with_shell(terminal .. " -e pulsemixer") end),
        awful.button({ }, 3,function () awful.spawn.with_shell("pamixer -t") end),
        awful.button({ }, 4,function () awful.spawn("pamixer --allow-boost -i 1")
              beautiful.volume.update()
        end),
        awful.button({ }, 5,function () awful.spawn("pamixer --allow-boost -d 1")
              beautiful.volume.update()
        end)

))

-- Net
local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#FEFEFE", " " .. net_now.received .. " ↓↑ " .. net_now.sent .. " "))
    end
})
neticon:buttons(
    my_table.join(
    awful.button({ }, 1, function() awful.spawn.with_shell(terminal .. " -e \"bmon\"") end),
    awful.button({ }, 3, function() awful.spawn.with_shell(terminal .. " -e bash -c \"speedtest --no-upload --bytes && read key\"") end)
))

-- Separators
local arrow = separators.arrow_left

function theme.powerline_rl(cr, width, height)
    local arrow_depth, offset = height/2, 0

    -- Avoid going out of the (potential) clip area
    if arrow_depth < 0 then
        width  =  width + 2*arrow_depth
        offset = -arrow_depth
    end

    cr:move_to(offset + arrow_depth         , 0        )
    cr:line_to(offset + width               , 0        )
    cr:line_to(offset + width - arrow_depth , height/2 )
    cr:line_to(offset + width               , height   )
    cr:line_to(offset + arrow_depth         , height   )
    cr:line_to(offset                       , height/2 )

    cr:close_path()
end

local function pl(widget, bgcolor, padding)
    return wibox.container.background(wibox.container.margin(widget, 16, 16), bgcolor, theme.powerline_rl)
end

-- Update Checker
local pacicon = wibox.widget.imagebox(theme.widget_pacman)
pacicon:buttons(
        my_table.join(
        awful.button({ }, 1, function () awful.spawn.with_shell("notify-send \"Please Wait..\" && notify-send -t 7000 \"$(checkupdates && paru -Qua)\"")
--        awful.spawn.easy_async('bash -c "checkupdates | wc -l"', function(stdout, stderr, reason, exit_code)
--          pacupdates = widget:set_markup(markup.fontfg(theme.font, "#FEFEFE", "" .. stdout .. " ")) end)
--        awful.spawn.easy_async('bash -c "checkupdates-aur | wc -l"', function(stdout, stderr, reason, exit_code)
--          stdout = widget:set_markup(markup.fontfg(theme.font, "#FEFEFE", "" .. stdout .. " ")) end)
        end),
        awful.button({ }, 3, function () awful.spawn.with_shell(terminal .. " -e bash -c \"checkupdates && read key\"") end),
        awful.button({ "Mod4" }, 1, function () awful.spawn.with_shell(terminal .. " -e bash -c \"sudo pacman -Syu && paru && read key\"") end)
        ))
pacupdates = awful.widget.watch('bash -c "checkupdates | wc -l"', 900, function(widget, stdout) -- every 15 minutes it checks for updates
    widget:set_markup(markup.fontfg(theme.font, "#FEFEFE", "" .. stdout .. " "))
end)
aurupdates = awful.widget.watch('bash -c "paru -Qua | wc -l"', 900, function(widget, stdout) -- every 15 minutes it checks for updates
    widget:set_markup(markup.fontfg(theme.font, "#FEFEFE", "+" .. stdout .. " "))
end)

-- Awesome Icon
local awesomeico = wibox.widget.imagebox(theme.awesome_icon)
awesomeico:buttons(
        my_table.join(
        awful.button({ }, 1, function () mymainmenu:toggle() end)

))

function theme.at_screen_connect(s)
    -- Quake application
   -- s.quake = lain.util.quake({ app = awful.util.terminal })
   -- s.quake = lain.util.quake({ app = "st", height = 0.50, argname = "-e %s" })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    --gears.wallpaper.maximized(wallpaper, s, true)

    -- All tags open with layout 1
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    --s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 20, bg = theme.bg_normal, fg = theme.fg_normal, opacity = 0.9 })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            awesomeico,
            s.mytaglist,
            s.mypromptbox,
            spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --[[ using shapes
            pl(wibox.widget { mpdicon, theme.mpd.widget, layout = wibox.layout.align.horizontal }, "#343434"),
            pl(task, "#343434"),
            --pl(wibox.widget { mailicon, mail and mail.widget, layout = wibox.layout.align.horizontal }, "#343434"),
            pl(wibox.widget { memicon, mem.widget, layout = wibox.layout.align.horizontal }, "#777E76"),
            pl(wibox.widget { cpuicon, cpu.widget, layout = wibox.layout.align.horizontal }, "#4B696D"),
            pl(wibox.widget { tempicon, temp.widget, layout = wibox.layout.align.horizontal }, "#4B3B51"),
            pl(wibox.widget { fsicon, theme.fs.widget, layout = wibox.layout.align.horizontal }, "#CB755B"),
            pl(wibox.widget { baticon, bat.widget, layout = wibox.layout.align.horizontal }, "#8DAA9A"),
            pl(wibox.widget { neticon, net.widget, layout = wibox.layout.align.horizontal }, "#C0C0A2"),
            pl(binclock.widget, "#777E76"),
            --]]
            -- using separators
            --arrow(theme.bg_normal, "#343434"),
           -- wibox.container.background(wibox.container.margin(wibox.widget { mailicon, mail and mail.widget, layout = wibox.layout.align.horizontal }, 4, 7), "#343434"),
            --arrow("alpha", "#7197E7"),
            --wibox.container.background(wibox.container.margin(wibox.widget { mpdicon, theme.mpd.widget, layout = wibox.layout.align.horizontal }, 3, 6), "#7197E7"),
            arrow("alpha", "#7197E7"),
            wibox.container.background(wibox.container.margin(wibox.widget { pacicon, pacupdates, aurupdates,stdout ,layout = wibox.layout.align.horizontal }, 2, 3), "#7197E7"),
            arrow("#7197E7", "#A77AC4"),
            wibox.container.background(wibox.container.margin(wibox.widget { volicon, theme.volume.widget, layout = wibox.layout.align.horizontal }, 2, 3), "#A77AC4"),
            arrow("#A77AC4", "#7197E7"),
            wibox.container.background(wibox.container.margin(wibox.widget { memicon, mem.widget, layout = wibox.layout.align.horizontal }, 2, 3), "#7197E7"),
            arrow("#7197E7", "#A77AC4"),
            wibox.container.background(wibox.container.margin(wibox.widget { cpuicon, cpu.widget, layout = wibox.layout.align.horizontal }, 3, 4), "#A77AC4"),
            arrow("#A77AC4", "#7197E7"),
            wibox.container.background(wibox.container.margin(wibox.widget { temp.widget, layout = wibox.layout.align.horizontal }, 4, 4), "#7197E7"),
            --arrow("#7197E7", "#A77AC4"),
            --wibox.container.background(wibox.container.margin(wibox.widget { weathericon, theme.weather.widget, layout = wibox.layout.align.horizontal }, 3, 3), "#A77AC4"),
            arrow("#7197E7", "#A77AC4"),
            wibox.container.background(wibox.container.margin(wibox.widget { nil, neticon, net.widget, layout = wibox.layout.align.horizontal }, 3, 3), "#A77AC4"),
            arrow("#A77AC4", "#7197E7"),
            wibox.container.background(wibox.container.margin(wibox.widget { baticon, bat.widget, layout = wibox.layout.align.horizontal }, 3, 3), "#7197E7"),
            arrow("#7197E7", "#A77AC4"),
            wibox.container.background(wibox.container.margin(clock, 4, 8), "#A77AC4"),
            arrow("#A77AC4", "alpha"),
            --]]
            mykeyboardlayout,
            wibox.widget.systray(),
            s.mylayoutbox,
        },
    }
end

return theme
