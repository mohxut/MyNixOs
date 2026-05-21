{ config, pkgs, inputs,	 ... }:

{

    imports = [
      inputs.niri.homeModules.niri
      inputs.noctalia.homeModules.default
    ];

    home.username = "mohx";
    home.homeDirectory = "/home/mohx";
    home.stateVersion = "25.05";
    
    programs.noctalia-shell.enable = true;
    programs.git.enable = true;

    programs.niri.settings = {
      spawn-at-startup = [
        { command = [ "${pkgs.xwayland-satellite}/bin/xwayland-satellite" ":0" ]; }
      ];
    };

#
    # programs.bash = {
    #     enable = true;
    #     shellAliases = {
    #                 };
    # };

   programs.zoxide.enable = true;


    home.file.".config/nvim".source = ./config/mohxNvim;
    home.file.".config/niri".source = ./config/niri;

    home.sessionVariables = {
        
      _JAVA_AWT_WM_NONREPARENTING = "1";
      _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=on -Dsun.java2d.renderer=sun.java2d.marlin.MarlinRenderer";
    };

    home.packages = with pkgs; [ 
      neovim
      ripgrep
      dust 
      nil
      gcc
      duf
      zoxide
      fuzzel
      awww
    ];
}
