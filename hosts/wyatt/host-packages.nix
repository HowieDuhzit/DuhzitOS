{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity
    discord
    nodejs
    obs-studio
    code-cursor
    flameshot
    potrace
    byobu
    virtualbox
  ];
}
