{ config, pkgs, ... }:

{


  home.username = "mohx";
  home.homeDirectory = "/home/mohx";
  home.stateVersion = "25.05";
  programs.git.enable = true;

  # programs.niri.settings = {
  #   spawn-at-startup = [
  #     { command = [ "${pkgs.xwayland-satellite}/bin/xwayland-satellite" ":0" ]; }
  #   ];
  # };

  #
  # programs.bash = {
  #     enable = true;
  #     shellAliases = {
  #                 };
  # };

  programs.zoxide.enable = true;


  home.file.".config/nvim".source = ./config/mohxNvim;

  home.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
    _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=on -Dsun.java2d.renderer=sun.java2d.marlin.MarlinRenderer";
  };

  home.packages = with pkgs; [
    awww
  ];

  xdg.configFile."niri/config.kdl" = {
  source = ./config/niri/config.kdl; # هذا يشير إلى ملفك الذي نقلناه للتو
  force = true;               # ضروري جداً لتجنب خطأ clobbered
};
}
