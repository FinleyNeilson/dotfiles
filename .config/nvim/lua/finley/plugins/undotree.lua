return {
	"mbbill/undotree",

	vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "toggle undo tree" }),
}
