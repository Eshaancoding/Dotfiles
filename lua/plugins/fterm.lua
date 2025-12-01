return {
	"numToStr/FTerm.nvim",
	config = function()
		require("FTerm").setup({
			ft = 'FTerm',
			cmd = os.getenv('SHELL'),
			border = 'none',
			auto_close = true,
			hl = 'Normal',
			blend = 40,
			dimensions = {
				height = 0.95, -- Height of the terminal window
				width = 0.8, -- Width of the terminal window
				x = 0.5, -- X axis of the terminal window
				y = 0.5, -- Y axis of the terminal window
			},
			clear_env = false,
			env = nil,
			on_exit = nil,
			on_stdout = nil,
			on_stderr = nil,
		})
	end,
}
