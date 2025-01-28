{ config, username, pkgs, ... }:

{
  # Nix.
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  # Bootloader.
  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems = [ "btrfs" "ext4" "fat32" "ntfs" ];

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
      };
    };
  };

  # Network

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ 22 80 443 ];
    firewall.allowedUDPPorts = [ 53 ];
    firewall.enable = true;
  };

  # Services
  services = {
    printing.enable = true;
    envfs.enable = true;   
    gvfs.enable = true;
    openssh.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  # Security
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.swaylock = { };
    # pam.services.swaylock-effects = {
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.bash;
    users.${username} = {
      isNormalUser = true;
      description = "samsepi0l";
      extraGroups = [ "networkmanager" "wheel" "video" "input" "uinput" "libvirtd" ];
      packages = with pkgs; [
        kdePackages.kwin
        kdePackages.kate
        kdePackages.xwaylandvideobridge
        kdePackages.xdg-desktop-portal-kde
        kdePackages.spectacle
      ];
    };
  };

  # Package systems:
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    xdotool
    glibcLocales
    vulkan-tools
  ];

  # Programs 
  programs = {
    # mtr.enable = true;
    zsh.enable = false;
    # dconf.enable = true;
    firefox = {
      enable = true;
    };

    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
  };

  # Don't FUCKING change this!!!!!
  system.stateVersion = "24.11"; # Did you read the comment?

}
