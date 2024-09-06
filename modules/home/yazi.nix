{pkgs-unstable, helpers, osConfig, ...}:
{
  programs.yazi = {
    enable = true; 
    package = pkgs-unstable.yazi;
    enableFishIntegration = true;
    settings = {
      manager = {
        sort_by = "natural";
        sort_dir_first = true;
        ratio = [2 3 4];
      };
    };
    theme = {
      status = {
        separator_open = "";
        separator_close = "";
        mode_normal = {bg = "reset"; fg = "blue"; bold = true; reversed = true;};
        mode_select = {bg = "reset"; fg = "red" ; bold = true ; reversed = true;};
        mode_unset = {bg = "reset"; fg = "red" ; bold = true ; reversed = true;};
        separator_style = {bg = "reset"; fg = "gray"; reversed = true;};
      };
      icon = {
        prepend_rules = [
          { name = "*.org"; text = ""; fg = "#78ac9a";}
          { name = "*.tex"; text = ""; fg = "#ffffff";}
          { name = "*.blend"; text = "󰂫"; fg = "#e87d0d";}
          { name = "Makefile"; text = ""; fg = "#ffffff";}
          { name = "go.mod"; text = ""; fg = "#ffffff";}
          { name = "go.sum"; text = ""; fg = "#ffffff";}
          { name = "*.prof"; text = ""; fg = "#ffffff";}
          { name = "*.asm"; text = ""; fg = "#405ba9";}
          { name = "*"; text = "e"; is = "exec"; fg = "#ffffff";}
        ];
      };
    };
    keymap = {
      manager.prepend_keymap = [
        (helpers.functions.mkIfElse osConfig.myoptions.usingWayland
          {
            on =  ["y"]; 
            run = ["shell 'for path in \"$@\"; do echo \"file://$path\"; done | wl-copy -t text/uri-list' --confirm" "yank"];
          }
          { 
            on =  ["y"]; 
            run = [ "shell --confirm 'echo \"$@\" | xclip -i -selection clipboard -t text/uri-list' --confirm" "yank"];
          }
        )
      ];
    };
  };
}
