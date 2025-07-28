return {
  'ray-x/aurora',
  init = function()
    vim.g.aurora_italic = 1    -- enable italics
    vim.g.aurora_transparent = 1 -- enable transparent background
    vim.g.aurora_bold = 1      -- enable bold
  end,
  config = function()
    -- Example: override aurora's default for numbers
	-- vim.api.nvim_set_hl(0, '@number', {fg='#e933e3'})
  end
}

