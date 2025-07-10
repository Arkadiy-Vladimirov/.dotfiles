---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot"

return {
	"yetone/avante.nvim",
	build = "make",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	---@module 'avante'
	opts = {
  		---@type Provider
  		provider = "openai",
		providers = {
			openai = {
				endpoint = "https://api.openai.com/v1",
				model = "gpt-4.1", -- your desired model (or use gpt-4o, etc.)
				timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
				extra_request_body = {
					temperature = 0,
					max_completion_tokens = 16384, -- Increase this to include reasoning tokens (for reasoning models)
					-- reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
				},
			},
			-- claude = {
			-- 	endpoint = "https://api.anthropic.com",
			-- 	model = "claude-sonnet-4-20250514",
			-- 	timeout = 30000, -- Timeout in milliseconds
			-- 	extra_request_body = {
			-- 		temperature = 0.75,
			-- 		max_tokens = 20480,
			-- 	},
			-- },
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{
			-- Make sure to set this up properly if you have lazy=true
			'MeanderingProgrammer/render-markdown.nvim',
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
