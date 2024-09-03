{
  programs.nixvim.plugins = {
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
      settings.layout_config.prompt_position = "top";
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
    #bufdelete = {
    #  enable = true;
    #};
  };
}
