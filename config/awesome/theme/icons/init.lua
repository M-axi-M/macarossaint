local taglist_icon_theme = 'drops' -- Available Themes: 'drops', 'default', 'macos', 'korla'
local tit_dir = os.getenv('HOME') .. '/.config/awesome/theme/icons/tag-list/tag/' .. taglist_icon_theme
local dir = os.getenv('HOME') .. '/.config/awesome/theme/icons'


return {
  --tags
  chrome = tit_dir .. '/google-chrome.svg',
  code = tit_dir .. '/code-braces.svg',
  social = tit_dir .. '/forum.svg',
  container = tit_dir .. '/container.svg',
  music = tit_dir .. '/music.svg',
  game = tit_dir .. '/google-controller.svg',
  network = tit_dir .. '/network.svg',
  vbox = tit_dir .. '/vbox.svg',
  terminal = tit_dir .. '/terminal.svg',
  pentest = tit_dir .. '/kali.svg',
  --others
  menu = tit_dir .. '/menu.svg',
  close = dir .. '/close.svg',
  logout = dir .. '/logout.svg',
  sleep = dir .. '/power-sleep.svg',
  power = dir .. '/power.svg',
  lock = dir .. '/lock.svg',
  restart = dir .. '/restart.svg',
  search = dir .. '/magnify.svg',
  volume = dir .. '/volume-high.svg',
  brightness = dir .. '/brightness-7.svg',
  chart = dir .. '/chart-areaspline.svg',
  memory = dir .. '/memory.svg',
  harddisk = dir .. '/harddisk.svg',
  thermometer = dir .. '/thermometer.svg',
  plus = dir .. '/plus.svg',
  batt_charging = dir .. '/battery-charge.svg',
  batt_discharging = dir .. '/battery-discharge.svg',
}
