# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
	./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev"; 
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 10;
    };
  };

  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  

  # Enable networking
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.hostName = "mohx";  
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  # Set your time zone.
  time.timeZone = "Asia/Damascus";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ar_SY.UTF-8";
    LC_IDENTIFICATION = "ar_SY.UTF-8";
    LC_MEASUREMENT = "ar_SY.UTF-8";
    LC_MONETARY = "ar_SY.UTF-8";
    LC_NAME = "ar_SY.UTF-8";
    LC_NUMERIC = "ar_SY.UTF-8";
    LC_PAPER = "ar_SY.UTF-8";
    LC_TELEPHONE = "ar_SY.UTF-8";
    LC_TIME = "ar_SY.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };



  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mohx = {
    isNormalUser = true;
    description = "mohx";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   vim 
   wget
   neovim
   git
   curl
   kitty
   glib
   wayland-utils
   firefox
   vscode
   fastfetch
   nitch
   btop
   tealdeer
   xclip
   bat
   obsidian
   yazi
   telegram-desktop
   discord
   keyd
   tmux
   protonvpn-gui
   ];

  programs.git = {
  enable = true;
  config = {
    core.askPass = ""; # هذا سيعطل ظهور نافذة KDE المزعجة
  };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

  #UI*****************************************
  services.displayManager.sddm.enable = false;
   services.displayManager.ly = {
    enable = true;
    };

  services.xserver.enable = true ;

  services.desktopManager.plasma6.enable = true;

  programs.niri.enable = true ;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    };

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
      ids = [ "*" ];
      settings = {
        main = {
          capslock = "overload(fn, esc)";
        };

        fn = {
          w = "up";
          s = "down";
          a = "left";
          d = "right";
          
         
          "4" = "f15";
          "2" = "f13";
          "3" = "f14";

          "6" = "f17";
          "5" = "f16";
	  	  
  

            };
          };
        };
      };
    };

}


