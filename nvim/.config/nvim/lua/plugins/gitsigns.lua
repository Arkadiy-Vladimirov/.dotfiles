local arcadia = vim.fn.expand(vim.env.ARCADIA_ROOT or "~/arcadia")
local function within_arcadia()
    return string.find(vim.fn.getcwd(), arcadia) ~= nil
end

return {
	{
		"lewis6991/gitsigns.nvim",
		cond = function() return not within_arcadia() end,
        config = function() require("gitsigns").setup{} end,
	},
	{
		dir = arcadia .. "/contrib/tier1/gitsigns.arc.nvim",
		cond = function() return within_arcadia() end,
        config = function() require("gitsigns").setup{} end,
	},
}
