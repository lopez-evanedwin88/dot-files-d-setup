local idiot = require("you-are-an-idiot")
vim.api.nvim_create_user_command("ToggleIdiot", function()
  if idiot.is_running() then
    idiot.abort()
  else
    idiot.run({
      flash_interval = 0.25,
    })
  end
end, { desc = "Toggles YouAreAnIdiot" })
