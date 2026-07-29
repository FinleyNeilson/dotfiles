return {
	{
		"3rd/image.nvim",
		enabled = false, -- never got working reliably over WezTerm(Windows)+WSL2+tmux; config kept for reference
		config = function(_, opts)
			-- Neovim runs inside WSL2 but WezTerm is a native Windows process, so it can't
			-- open the WSL-internal file paths image.nvim's kitty backend sends by default
			-- (transmit_medium="file"). image.nvim already falls back to embedding image
			-- data directly in the escape sequence (transmit_medium="direct") when it
			-- detects SSH, since a remote nvim has the same problem reaching the local
			-- terminal's filesystem. Force that same fallback under WSL.
			if vim.fn.has("wsl") == 1 and not vim.env.SSH_TTY then vim.env.SSH_TTY = "wsl" end
			require("image").setup(opts)
		end,
		opts = {
			backend = "kitty", -- WezTerm's sixel support is buggy on Windows (wezterm#4736); kitty graphics protocol works reliably and is already enabled via enable_kitty_graphics in .wezterm.lua
			processor = "magick_rock", -- FFI bindings to MagickWand (needs libmagickwand-dev)
			kitty_direct_chunk_size = 768, -- tmux's allow-passthrough DCS forwarding silently drops chunks near the default 4096-byte size
			debug = {
				enabled = true,
				level = "debug",
				file_path = "/tmp/image.nvim.log",
				format = "detailed",
			},
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					filetypes = { "markdown", "vimwiki" },
				},
				neorg = {
					enabled = true,
					filetypes = { "norg" },
				},
			},
			max_width_window_percentage = 80,
			max_height_window_percentage = 50,
			window_overlap_clear_enabled = true,
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		},
	},
}
