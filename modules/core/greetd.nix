{
  pkgs,
  username,
  ...
}: {
  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      default_session = {
        user = username;
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
            --time \
            --asterisks \
            --user-menu \
            --remember \
            --remember-session \
            --cmd Hyprland \
            --width 40 \
            --greeting "Welcome to DuhzitOS" \
            --text-color "#FFFFFF" \
            --text-highlight-color "#FDCA40" \
            --prompt-color "#66C3FF" \
            --prompt-highlight-color "#F64740" \
            --border-color "#550C18"
        '';
      };
    };
  };
}
