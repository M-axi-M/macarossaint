local awful = require('awful')
local gears = require('gears')
local icons = require('theme.icons')

local tags = {
 {
    icon = icons.chrome,
    type = 'chrome',
    defaultApp = 'firefox',
    screen = 1
 }, 
 {
    icon = icons.terminal,
    type = 'terminal',
    defaultApp = 'kitty',
    screen = 1
 },
 {
    icon = icons.code,
    type = 'code',
    defaultApp = 'vim',
    screen = 1
 },
 {
    icon = icons.container,
    type = '',
    defaultApp = '',
    screen = 1
  },

  {
    icon = icons.vbox,
    type = 'any',
    defaultApp = '',
    screen = 1
  },
  {
    icon = icons.pentest,
    type = 'any',
    defaultApp = '',
    screen = 1
  },
  {
    icon = icons.network,
    type = 'any',
    defaultApp = '',
    screen = 1
  },
  {
    icon = icons.game,
    type = 'game',
    defaultApp = 'steam',
    screen = 1
  }, 
  {
    icon = icons.music,
    type = 'any',
    defaultApp = '',
    screen = 1
  },

}

awful.layout.layouts = {
  --awful.layout.suit.tile.bottom,
  --awful.layout.suit.tile.left,
  --awful.layout.suit.corner.nw,
  awful.layout.suit.spiral.dwindle,
  awful.layout.suit.tile,
  awful.layout.suit.max
}


screen.connect_signal("request::desktop_decoration", function(s)
  for i, tag in pairs(tags) do
    awful.tag.add(
      i,
      {
        icon = tag.icon,
        icon_only = true,
        layout = awful.layout.suit.spiral.dwindle,
        gap_single_client = true,
        gap = 20,
        screen = s,
        defaultApp = tag.defaultApp,
        selected = i == 1
      }
    )
  end
end)


_G.tag.connect_signal(
  'property::layout',
  function(t)
    local currentLayout = awful.tag.getproperty(t, 'layout')
    if (currentLayout == awful.layout.suit.max) then
      t.gap = 0
    else
      t.gap = 20
    end
  end
)
