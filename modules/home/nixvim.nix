{ nixvim, ... }:
let
  keyopts = {
    silent = true;
    noremap = true;
  };
in
{
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    globals = {
      mapleader = " ";
    };
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
      shiftwidth = 2;
      tabstop = 2;
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
        servers = {
          clangd = {
            enable = true;
          };
          nixd = {
            enable = true;
          };
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "luasnip"; }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-c>" = "cmp.mapping.scroll_docs(-4)";
            "<C-v>" = "cmp.mapping.scroll_docs(4)";
            "<C-e>" = "cmp.mapping.close()";
            "<Tab>" = "cmp.mapping.confirm({ select = true })";
            "<C-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<C-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
          preselect = "cmp.PreselectMode.Item";
          snippet.expand = ''
            function(args)
             require('luasnip').lsp_expand(args.body)
            end
          '';
        };
      };
    };
    keymaps = [
      {
        key = "<Space>";
        action = "<Nop>";
        options = keyopts;
      }
      {
        key = "<leader>w";
        action = "<C-w>";
        options = {
          remap = true;
          silent = true;
        };
      }
      {
        key = "<C-w>d";
        action = "<cmd>close<cr>";
        options = keyopts;
      }
      {
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<cr>";
        options = keyopts;
      }
    ];
  };
}
