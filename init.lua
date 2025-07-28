-- stuff to setup :
-- Welcome screen system (with session support?)
-- Extra: When I open up a new program, it's a "tab", and I can close and go to previous

-- note that I add this to the .zshrc as well: alias clear="printf \"\33c\e[3J\""

-- Set 24-bit color
vim.opt.termguicolors = true

-- Set the font
vim.go.guifont = "Liga SFMono Nerd Font"

-- Load all configuration files
require("config.lazy")

-- Gruvbox setup
require("gruvbox").setup({
	contrast = "hard",
	palette_overrides = {
		dark0_hard = "#000000",
	},
	overrides={
		Normal = { bg = "#000000" },
		NormalNC = { bg = "#000000" },
		SignColumn = { bg = "#000000" },
		LineNr = { bg = "#000000" },
		CursorLineNr = { bg = "#000000" },
		StatusLine = { bg = "#000000" },
		VertSplit = { bg = "#000000" },
		Pmenu = { bg = "#000000" },
		PmenuSel = { bg = "#222222", fg="#ffffff"},
		Visual = { bg = "#222222" },
		CursorLine = { bg = "#222222" },
		Search = { bg = "#222222", fg = "#ffffff" },
	}
})

-- Force colorscheme
-- Set background to transparent (making everything minimistic)
vim.cmd [[
	" Tab + copy and pasting
	set tabstop=4
	set shiftwidth=4
	set clipboard=unnamed " use system keyboard

	colorscheme gruvbox

	" More minimistic! Remove statusline and tabline
	set laststatus=0	
	set showtabline=0
]]

require("telescope").load_extension "file_browser"

------- Keybinds for telescope -------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-o>', builtin.lsp_dynamic_workspace_symbols, { desc = 'Telescope find workspace symbol' }) -- navigate between workspace symbols (global, not local file) 
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' }) -- switch easily between files
vim.keymap.set('n', '<C-e>', builtin.diagnostics, { desc = 'Telescope find files' }) -- search within errors in a file
vim.keymap.set('n', '<C-f>', builtin.live_grep, { desc = 'Telescope find files' }) -- search within errors in a file
vim.keymap.set('n', 'cr', builtin.lsp_references, { desc = 'Telescope references' })
vim.keymap.set('n', 'cd', builtin.lsp_definitions, { desc = 'Telescope definitions' })
vim.keymap.set('n', 'K', function()
	vim.diagnostic.open_float(0, {focusable=true})
end, { desc = 'LSP Hover' }) -- show LSP hover if needed

-- This is just to make sure that notify background notifs stays quiet
require("notify").setup({
  background_colour = "#000000"
})

-- Show virtual text instead of underline
vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = true,
})

-- Some annoying notifications that I do not want
local notify_original = vim.notify
vim.notify = function(msg, ...)
  if
    msg
    and (
      msg:match 'position_encoding param is required'
      or msg:match 'Defaulting to position encoding of the first client'
      or msg:match 'multiple different client offset_encodings'
      or msg:match 'jump to location'
    )
  then
    return
  end
  return notify_original(msg, ...)
end


-- LSP Config




-- if terminal press escape to actually escape
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { silent = true }) -- also when I am searching, disable it at escape 

-- Pretty hacky solution to this problem... 
vim.keymap.set('t', '<C-l>', function ()
	local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)
	vim.fn.feedkeys("clear" .. enter, 't')  -- Send the 'clear' command with Enter appended to execute it in the terminal

	-- reset scrollback
	vim.cmd("set scrollback=1")
	vim.cmd("sleep 10m")
	vim.cmd("set scrollback=1024")
end)

--
-- Nerd tree (could be more professionally done)
vim.keymap.set('n', '<C-E>', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

------------- keybinds for tab --------
vim.keymap.set('n', '<C-t>', ':tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Tab>', ':tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'T', ':terminal<CR>', { noremap = true, silent = true })

------------ Commands to add to vim as I use them often --------
vim.api.nvim_create_user_command("Config", function()
  vim.cmd("edit ~/.config/nvim/init.lua")
end, {})

vim.api.nvim_create_user_command("Refresh", function()
  vim.cmd("source ~/.config/nvim/init.lua")
  vim.cmd(":LspRestart")
end, {})

vim.api.nvim_create_user_command("Todo", function()
  vim.cmd("e ./TODO.md")
end, {})

