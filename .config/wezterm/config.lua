local wezterm = require("wezterm")
local action = wezterm.action
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config = {
  default_cursor_style = "SteadyBar",
  automatically_reload_config = true,
  window_close_confirmation = "NeverPrompt",
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "RESIZE",
  check_for_updates = false,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = false,
  font_size = 12.5,
  font = wezterm.font("0xProto Nerd Font Mono", {weight="Regular", stretch="Normal", style="Normal"}),
  enable_tab_bar = false,
  window_padding = {
    left = 3,
    right = 3,
    top = 0,
    bottom = 0,
  },
  -- background = {
  -- 	{
  -- 		source = {
  -- 			File = "/Users/" .. os.getenv("USER") .. "/.config/wezterm/dark-desert.jpg",
  -- 		},
  -- 		hsb = {
  -- 			hue = 1.0,
  -- 			saturation = 1.02,
  -- 			brightness = 0.25,
  -- 		},
  -- 		-- attachment = { Parallax = 0.3 },
  -- 		-- width = "100%",
  -- 		-- height = "100%",
  -- 	},
  -- 	{
  -- 		source = {
  -- 			Color = "#282c35",
  -- 		},
  -- 		-- width = "100%",
  -- 		-- height = "100%",
  -- 		-- opacity = 0.80,
  -- 	},
  -- },
  -- from: https://akos.ma/blog/adopting-wezterm/
  hyperlink_rules = {
    -- Matches: a URL in parens: (URL)
    {
      regex = "\\((\\w+://\\S+)\\)",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in brackets: [URL]
    {
      regex = "\\[(\\w+://\\S+)\\]",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in curly braces: {URL}
    {
      regex = "\\{(\\w+://\\S+)\\}",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in angle brackets: <URL>
    {
      regex = "<(\\w+://\\S+)>",
      format = "$1",
      highlight = 1,
    },
    -- Then handle URLs not wrapped in brackets
    {
      -- Before
      --regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
      --format = '$0',
      -- After
      regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
      format = "$1",
      highlight = 1,
    },
    -- implicit mailto link
    {
      regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
      format = "mailto:$0",
    },
  },
  window_background_opacity = 0.75,
  -- colors = {
  -- 	-- foreground = "#CBE0F0",
  -- 	-- background = "#011423",
  -- 	cursor_bg = "#47FF9C",
  -- 	cursor_border = "#47FF9C",
  -- 	cursor_fg = "#011423",
  -- 	selection_bg = "#033259",
  -- 	selection_fg = "#CBE0F0",
  -- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
  -- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
  -- },
  keys = {
    { mods = "OPT", key = "LeftArrow",  action = action.SendKey({ mods = "ALT", key = "b" }) },
    { mods = "OPT", key = "RightArrow", action = action.SendKey({ mods = "ALT", key = "f" }) },
    { mods = "CMD", key = "LeftArrow",  action = action.SendKey({ mods = "CTRL", key = "a" }) },
    { mods = "CMD", key = "RightArrow", action = action.SendKey({ mods = "CTRL", key = "e" }) },
    { mods = "CMD", key = "Backspace",  action = action.SendKey({ mods = "CTRL", key = "u" }) },
  },
}

return config
