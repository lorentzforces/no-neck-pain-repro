FROM opensuse/tumbleweed

RUN zypper --non-interactive install neovim git
COPY start-nvim.sh /usr/bin/start-nvim.sh
COPY nvim-init.lua /root/nvim-init.lua
RUN nvim -u /root/nvim-init.lua --headless "+q"
