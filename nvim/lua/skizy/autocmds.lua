function Exists(path)
	local shell_function = string.format("if [ -e '%s' ]\
then\
	echo 1\
else\
	echo 0\
fi", path)
	local handle = io.popen(shell_function)
	local result = string.sub(handle:read("*a"), 1, -2)
	handle:close()
	if result == '1' then
		return true
	else
		return false
	end
end

function Modify_path(path)
	local new_path = string.gsub(path, "/home/skizy", "~")
	new_path = string.gsub(new_path, "/", "=+").."="
	new_path = "/home/skizy/.local/state/nvim/view/"..new_path
	return new_path
end

vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "?*",
	callback = function(_)
		if not vim.o.diff then
			vim.cmd.mkview()
		end
	end,
})

-- vim.api.nvim_create_autocmd("QuitPre", {
-- 	pattern = "?*",
-- 	command = "mkview",
-- })

vim.api.nvim_create_autocmd("VimLeavePre", {
	pattern = "?*",
	callback = function(_)
		if not vim.o.diff then
			vim.cmd("tabdo windo mkview")
		end
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "?*",
	callback = function()
		local cur_path = vim.api.nvim_buf_get_name(0)
		cur_path = Modify_path(cur_path)
		if Exists(cur_path) then
			vim.cmd("loadview")
		end
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "?*",
	callback = require("lualine").refresh,
})

vim.api.nvim_create_autocmd("RecordingEnter", {
	callback = require("lualine").refresh,
})
vim.api.nvim_create_autocmd("RecordingLeave", {
	callback = require("lualine").refresh,
})
