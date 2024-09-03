{ nixvim, ... }:
let
  keyopts = {
    silent = true;
    noremap = true;
  };
  telescope-prefix = "<leader>s";
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
      autoclose = {
        enable = true;
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
      {
        key = "<leader>,";
        action = "<cmd>Telescope buffers<cr>";
      }
      {
        key = "<leader><";
        action = "<cmd>Telescope git_files<cr>";
      }
      {
        key = "${telescope-prefix}s";
        action = "<cmd>Telescope live_grep<cr>";
      }
    ];
  };
}
