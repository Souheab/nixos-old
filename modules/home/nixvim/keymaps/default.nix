{
  imports = [ ./telescope.nix ];
  programs.nixvim = {
    globals = {
      mapleader = " ";
    };
    keymaps = [
      {
        key = "<Space>";
        action = "<Nop>";
      }
      {
        key = "<leader>w";
        action = "<C-w>";
        options = {
          remap = true;
        };
      }
      {
        key = "<C-w>d"; 
        action = "<cmd>close<cr>";
      }
      {
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<cr>";
      }
      {
        key = "<leader>bk";
        action = "<cmd>Bdelete<cr>";
      }
      {
        key = "H";
        action = "<cmd>bprevious<cr>";
      }
      {
        key = "L";
        action = "<cmd>bnext<cr>";
      }
    ];
  };
}
