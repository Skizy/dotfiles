local function connect_brackets()
	local autopairs = require("nvim-autopairs")
	local cursor = vim.api.nvim_win_get_cursor(0)
	local row = cursor[1]

	if row < 2 or row == vim.api.nvim_buf_line_count(0) then
		return autopairs.autopairs_bs()
	end

	local lines_start = row - 2
	local lines_end = row + 1

	local lines = vim.api.nvim_buf_get_lines(0, lines_start, lines_end, true)

	local bottom_match
	if lines[3]:match("^%s*}$") then bottom_match = true else bottom_match = false end

	local empty_match = lines[2] == ''

	local top_match
	if lines[1]:match("{$") then top_match = true else top_match = false end

	-- local replacement_array = { lines[1] .. "}" } -- if changing to replace
	if bottom_match and empty_match and top_match then
		if row == vim.api.nvim_buf_line_count(0) - 1 then
			return require("nvim-autopairs.utils").esc("<Esc>2dd$a}<Esc>i")
		else
			return require("nvim-autopairs.utils").esc("<Esc>2ddk$a}<Esc>i")
		end
	else
		return autopairs.autopairs_bs()
	end
end

vim.api.nvim_buf_set_keymap(
	vim.api.nvim_get_current_buf(),
	"i",
	"<bs>",
	"v:lua.connect_brackets()",
	{ expr = true, noremap = true }
)

_G.connect_brackets = connect_brackets
