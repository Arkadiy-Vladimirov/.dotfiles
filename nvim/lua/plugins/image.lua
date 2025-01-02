return {
	'3rd/image.nvim',
    enabled = true,
    dev = false,
	build = false, -- false when using magick_cli backend, true when for magick_rock
    ft = { 'markdown', 'quarto', 'vimwiki' },
    -- dependencies = {
    --    'leafo/magick', -- that's a lua rock
    -- },
	config = function()
      -- Requirements
      -- https://github.com/3rd/image.nvim?tab=readme-ov-file#requirements
      -- needs:
      -- sudo apt install imagemagick
      -- sudo apt install libmagickwand-dev
      -- sudo apt install liblua5.1-0-dev
      -- sudo apt install lua5.1
      -- sudo apt install luajit
	  -- or
	  -- brew install imagemagick
	  -- when used with magick_cli backend

		local image = require('image')
		image.setup({
			backend = 'kitty', -- or 'ueberzug'
			processor = 'magick_cli', -- or 'magick_rock'
			integrations = {
				markdown = {
					enabled = true,
					only_render_image_at_cursor = true,
					-- only_render_image_at_cursor_mode = "popup",
					filetypes = { 'markdown', 'vimwiki', 'quarto' },
				},
			},
			editor_only_render_when_focused = false,
			window_overlap_clear_enabled = true,
			tmux_show_only_in_active_window = true,
			window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', 'scrollview', 'scrollview_sign' },
			max_width = nil,
			max_height = nil,
			max_width_window_percentage = nil,
			max_height_window_percentage = 30,
			kitty_method = 'normal',
		})
	end
}
