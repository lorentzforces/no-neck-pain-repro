# Basic no-neck-pain.nvim issue reproduction

### Steps to reproduce:

1. Start neovim with `no-neck-pain.nvim` loaded
2. Open another tab
3. Enable no-neck-pain in that tab
4. Close the buffer in this tab
5. Neovim quits entirely

I would expect the current tab page to close, given that the only "non-no-neck-pain" window in the tab page has closed. The entire editor quitting is unexpected.

### Steps to reproduce in this minimal container definition

The included dockerfile will create an image set up for a minimal reproduction of this issue.

1. Build the included image (ex: `docker build --tag local-repro .`)
2. Run the created image (ex: `docker run --rm -it local-repro`)
3. Run neovim via the provided script (which will source the provided config file) via `start-nvim.sh`
4. Allow the package manager to do first-time installation and plugin setup
5. Set up the minimal reproduction state using the built-in user command `:ReproCreateTabs` (see [nvim-init.lua](nvim-init.lua)
6. Close the buffer in the current tab via `:q`
