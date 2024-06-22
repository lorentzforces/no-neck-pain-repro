-- this is an attempt at a minimal config to reproduce an issue in no-neck-pain.nvim

local function bootstrap_pckr()
	local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

	if not vim.loop.fs_stat(pckr_path) then
		vim.fn.system({
			'git',
			'clone',
			"--filter=blob:none",
			'https://github.com/lewis6991/pckr.nvim',
			pckr_path
		})
	end
	vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
	'shortcuts/no-neck-pain.nvim'
}

vim.api.nvim_create_user_command(
	'ReproCreateTabs',
	function(opts)
		vim.cmd('tabnew')
		vim.cmd('NoNeckPain')
	end,
	{}
)
