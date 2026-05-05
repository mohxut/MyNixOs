{ config, pkgs, ... }:

{
    home.username = "mohx";
    home.homeDirectory = "/home/mohx";
    programs.git.enable = true;
    home.stateVersion = "25.05";
    
    programs.bash = {
        enable = true;
        shellAliases = {
            btw = "hoho";
        };
    };

    #home.packages = {
    #dust
   # };
}
