return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local tt = require("toggleterm")
			local map = require("helpers.keys").map

			tt.setup({
				size = 20,
				hide_numbers = true,
				open_mapping = "<leader>T",
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				close_on_exit = true,
				shell = vim.o.shell,
				float_opts = {
					border = "curved",
					winblend = 0,
					highlights = {
						border = "Normal",
						background = "Normal",
					},
				},
			})
			map("n", "<C-F1>", "<cmd>:ToggleTerm direction=vertical<CR>", "Open Terminal Vertical")
			map("n", "<C-F2>", "<cmd>:ToggleTerm direction=horizontal<CR>", "Open Terminal Horizontal")
			map("n", "<C-F3>", "<cmd>:ToggleTerm direction=float<CR>", "Open Terminal Float")
			map("t", "<esc>", "<leader>T")
			map("t", "jk", "<leader>T")
			map("t", "<C-h>", "<leader>T<C-n><C-W>h")
			map("t", "<C-k>", "<leader>T<C-n><C-W>k")
		end,
	},
}
