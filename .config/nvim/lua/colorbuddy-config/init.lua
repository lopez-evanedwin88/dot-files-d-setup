-- local status, n = pcall(require, "solarized-osaka")
-- if not status then
--   return
-- end
--
-- n.setup({
--   styles = {
--     comments = { italic = true },
--     -- keywords = { italic = true },
--     -- types = { italic = true },
--   },
--   transparent = true
-- })

local colorbuddy = require("colorbuddy.init")
local Color = colorbuddy.Color
local Group = colorbuddy.Group
local colors = colorbuddy.colors
local styles = colorbuddy.styles

Color.new("black", "#000000")
Color.new('highlight_bg', '#3f3f3f')  -- Background color

Group.new("CursorLine", colors.none, colors.base03, styles.none, colors.base1)
Group.new("CursorLineNr", colors.yellow, colors.black, styles.none, colors.base1)
Group.new("Visual", colors.none, colors.base1, styles.reverse)
Group.new("IlluminatedWordText", colors.none, colors.highlight_bg)
Group.new("IlluminatedWordRead", colors.none, colors.highlight_bg)
Group.new("IlluminatedWordWrite", colors.none, colors.highlight_bg)
