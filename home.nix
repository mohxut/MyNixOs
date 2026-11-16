{ config, pkgs, ... }:

{
  home.username = "mohx";
  home.homeDirectory = "/home/mohx";
  home.stateVersion = "25.05";
  programs.git.enable = true;

  programs.zoxide.enable = true;

  home.enableNixpkgsReleaseCheck = false;

  #home.file.".config/nvim".source = ./config/mohxNvimC;

  home.sessionVariables = {
    QT_STYLE_OVERRIDE = "adwaita-dark";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=on -Dsun.java2d.renderer=sun.java2d.marlin.MarlinRenderer";
  };

  home.packages = with pkgs; [
    awww
    adwaita-qt6
    mpvpaper
    swww
    logisim
    flutter
    gradle
  ];

  xdg.configFile."niri/config.kdl" = {
  source = ./config/niri/config.kdl; 
  force = true;
};
qt = {
  enable = true;
  platformTheme.name = "adwaita";
  style.name = "adwaita-dark";
};

}
