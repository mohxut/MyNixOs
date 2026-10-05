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
  ];

  xdg.configFile."niri/config.kdl" = {
  source = ./config/niri/config.kdl; # هذا يشير إلى ملفك الذي نقلناه للتو
  force = true;               # ضروري جداً لتجنب خطأ clobbered
};
qt = {
  enable = true;
  platformTheme.name = "adwaita";
  style.name = "adwaita-dark";
};

}
