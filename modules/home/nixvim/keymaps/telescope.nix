let
  telescope-prefix = "<leader>s";
in
{
  programs.nixvim.keymaps = [
    {
      key = "<leader>,";
      action = "<cmd>Telescope buffers<cr>";
    }
    {
      key = "<leader><";
      action = "<cmd>Telescope git_files<cr>";
    }
    {
      key = "<leader>pf";
      action = "<cmd>Telescope git_files<cr>";
    }
    {
      key = "${telescope-prefix}s";
      action = "<cmd>Telescope live_grep<cr>";
    }
  ];
}
