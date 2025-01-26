{ config, username, pkgs, ... }:

{

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
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = true;
      enableCryptodisk = true;
    };
    
    initrd = {
      secrets = { 
        "/boot/crypto_keyfile.bin" = null;
      };

      luks.devices."luks-b86fc136-e927-4d0a-9dee-d3d3947d1c3b".keyFile = "/boot/crypto_keyfile.bin";
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
    envfs.enable = true;   
    gvfs.enable = true;
    openssh.enable = true;
    xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      desktopManager.xfce.enable = true;
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

  # hardware.pulseaudio.enable = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.bash;
    users.${username} = {
      isNormalUser = true;
      description = "samsepi0l";
      extraGroups = [ "networkmanager" "wheel" "video" "input" "uinput" "libvirtd" ];
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
