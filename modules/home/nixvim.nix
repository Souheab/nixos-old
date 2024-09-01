{ config, pkgs, nixvim, ... }:
{
  imports = [
    nixvim.homeManagerModules.nixvim
    ./lsp.nix
  ];

  programs.nixvim = {
    enable = true;
    opts = {
      backup = false;
      background = "";
      clipboard = "unnamedplus";
      cmdheight = 1;
      conceallevel = 0;
      fileencoding = "utf-8";
      hlsearch = true;
      ignorecase = true;
      showtabline = 2;
      smartcase = true;
      smartindent = true;
      splitbelow = true;
      splitright = true;
      termguicolors = true;
      timeoutlen = 400;
      undofile = true;
      updatetime = 300;
      expandtab = true;
      number = true;
      relativenumber = true;
      wrap = false;
      scrolloff = 8;
      sidescrolloff = 8;
    };
    colorschemes = {
      tokyonight = {
        enable = true;
        settings = {
          style = "night";
        };
      };
    };
    plugins = {
      lualine = {
        enable = true;
      };
      bufferline = {
        enable = true;
      };
      nvim-tree = {
        enable = true;
      };
      telescope = {
        enable = true;
      };
      treesitter = {
        enable = true;
      };
      which-key = {
        enable = true;
      };
      lsp = {
        enable = true;
      };
      cmp = {
        enable = true;
      };
    };
  };
}
