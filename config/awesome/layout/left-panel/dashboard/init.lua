local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local mat_list_item = require('widget.material.list-item')
local mat_icon = require('widget.material.icon')
local dpi = require('beautiful').xresources.apply_dpi
local icons = require('theme.icons')
local gears = require('gears')
  

local textclock = wibox.widget.textclock('<span font="SFNS Display Bold 10">%l:%M %p</span>', 1)

local clock_widget = wibox.container.margin(textclock, dpi(150), dpi(100))

awful.tooltip(
  {
    objects = {clock_widget},
    mode = 'outside',
    align = 'right',
    timer_function = function()
      return os.date("The date today is %B %d, %Y. And it's fucking %A!")
    end,
    --preferred_positions = {'right', 'left', 'top', 'bottom'},
    preferred_positions = {'left'},
    margin_leftright = dpi(8),
    margin_topbottom = dpi(8)
  }
)

return function(_, panel)

  local exit_button =
    wibox.widget {
    wibox.widget {
      icon = icons.logout,
      size = dpi(24),
      widget = mat_icon
    },
    wibox.widget {
      text = 'End work session',
      font = 'SFNS Display Regular 12',
      widget = wibox.widget.textbox
    },
    clickable = true,
    divider = false,
    widget = mat_list_item
  }

  exit_button:buttons(
    awful.util.table.join(
      awful.button(
        {},
        1,
        function()
          panel:toggle()
          _G.exit_screen_show()
        end
      )
    )
  )




  local topbot_separator = wibox.widget {
    orientation = 'horizontal',
    forced_height = 10,
    opacity = 0,
    widget = wibox.widget.separator,
  }

  return wibox.widget {
    expand = "none",
    layout = wibox.layout.align.vertical,
    {
      layout = wibox.layout.fixed.vertical,
      topbot_separator,
      {
        spacing = dpi(30),
	layout = wibox.layout.fixed.vertical,
        
        
          {
            clock_widget,
            bg = beautiful.bg_modal,
	    --right = dpi(100),
            shape = function(cr, w, h)
                      gears.shape.rounded_rect(cr, w, h, beautiful.modal_radius)
                    end,
            widget = wibox.container.margin,
          },
	  widget = mat_list_item,
          
        
	require('layout.left-panel.dashboard.music'),		
	require('layout.left-panel.dashboard.quick-settings'),
        require('layout.left-panel.dashboard.hardware-monitor'),
        require('layout.left-panel.dashboard.action-center'),
	
      },
      },
        nil, 
      {

      layout = wibox.layout.fixed.vertical,
      {
        {
	  exit_button,
          bg = beautiful.bg_modal,
          shape = function(cr, width, height)
	   gears.shape.partially_rounded_rect(cr, width, height, true, true, true, true, beautiful.modal_radius) end, 
	  widget = wibox.container.margin,  
   	},
        widget = mat_list_item,
      },
      topbot_separator
    }
  }
end
