local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')
local mat_list_item = require('widget.material.music-list-item')
local mat_list_item_original = require('widget.material.list-item')

local barColor = beautiful.bg_modal
local dpi = require('beautiful').xresources.apply_dpi
local apps = require('configuration.apps')


return wibox.widget {
	
	spacing = 5,
	layout = wibox.layout.fixed.vertical,

	{
		{
		  require('widget.music.content.album-cover'), 
	  	  widget = wibox.container.margin
		},
		widget = mat_list_item,
		
	},
		spacing = 5,
		layout = wibox.layout.fixed.vertical,
		{
	 	  require('widget.music.content.song-info').music_info,
	 	  widget = wibox.container.margin,
		  
		},

		{
		  require('widget.music.content.progress-bar'),
	  	  widget = wibox.container.margin
		},

		{
		  require('widget.music.content.media-buttons').navigate_buttons,
 	  	  widget = wibox.container.margin
		},


}





