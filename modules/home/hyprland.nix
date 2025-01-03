{ pkgs,  ...}:
{
  imports = [
    ./waybar.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = ",preferred,1920x1080,1";
      env = [
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORM,wayland"
      ];
      # Programs:
      "$terminal" = "${pkgs.kitty}/bin/kitty";
      "$menu" = "${pkgs.wofi}/bin/wofi --show drun";
      "$bar" = "${pkgs.waybar}/bin/waybar";
      "$notification" = "${pkgs.dunst}/bin/dunst";
      "$screenshot" = "${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp -d)\" - | ${pkgs.wl-clipboard}/bin/wl-copy";
      exec-once = [
        "${pkgs.networkmanagerapplet}/bin/nm-applet &"
        "$notification"
        "$bar &"
      ];
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = "yes";
        };
      };
      general = {
        gaps_in = 10;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "master";
        allow_tearing = false;
      };
      decoration = {
        rounding = 0;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };
      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };
      master = {
        new_status = "master";
      };
      gestures = {
        workspace_swipe = "off";
      };
      misc = {
        force_default_wallpaper = -1;
      };
      binds = {
        allow_workspace_cycles = "yes";
      };
      "$mod" = "SUPER";
      windowrulev2 = [
        "noanim, class:^(flameshot)$"
        "float, class:^(flameshot)$"
        "move 0 0, class:^(flameshot)$"
        "pin, class:^(flameshot)$"
        "monitor 0, class:^(flameshot)$"
      ];
      bind = [
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "$mod, RETURN, exec, $terminal"
        "$mod, P, exec, $menu"
        "$mod SHIFT, Q, exit"
        "$mod, Q, killactive"
        "$mod, F, fullscreen, 0"

        # Scroll through existing workspaces with mainMod + scroll
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindowpixel"

        # Move focus with mainMod + arrow keys
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"


        # Move Windows Around
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, L, movewindow, r"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, J, movewindow, d"

        # resize windows
        "$mod CONTROL, H, resizeactive, -30 0"
        "$mod CONTROL, L, resizeactive, 30 0 "

        # Go to previous workspace
        "$mod, ESCAPE, workspace, previous"

        "$mod SHIFT, S, exec, $screenshot"
        "$mod ALT, L, exec, ${pkgs.hyprlock}/bin/hyprlock"
      ];
    };
  };
  programs.hyprlock = {
    enable = true;
  };
}
