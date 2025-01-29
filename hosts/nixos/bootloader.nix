{ config, username, pkgs, ... }:

{
  # Bootloader.
  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems = [ "btrfs" "ext4" "fat32" "ntfs" ];
    loader = {
      timeout = 2;
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/EFI";
      };
    };

    plymouth = {
      enable = true;
      font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
      themePackages = [ pkgs.catppuccin-plymouth ];
      theme = "catppuccin-macchiato";
    };
  };
}
