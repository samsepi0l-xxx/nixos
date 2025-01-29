{ config, username, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = ${username};
    extraGroups = [ "networkmanager" "input" "uinput" "libvirtd" "docker" "vboxusers" "wheel" "video" "audio" "tss" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      spotify
      discord
      tdesktop
      librewolf
      jetbrains.rider
      jetbrains.idea-community-bin
      lutris
      vscode
      neovide
    ];
  };

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
