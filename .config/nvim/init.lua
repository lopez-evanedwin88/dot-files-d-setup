-- Neovim needs to know which Python to use. If your virtualenv is at ~/myproject/venv/bin/python.
vim.g.python3_host_prog = '~/Development/suggestify-v2/issue-manager/venv/bin/python'
-- Run Python via Docker
-- Tell Neovim to use the container’s Python by invoking it through docker exec:
-- Find Your Container: Run docker ps to get the container name or ID (e.g., my_django_container).
-- Set Python Host: In your init.lua:
-- vim.g.python3_host_prog = 'docker exec -i my_django_container python3'

require 'core'
require 'custom.lazy'
require 'assets.illuminate'
