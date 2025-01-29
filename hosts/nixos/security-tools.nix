{ config, username, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
      keepassxc
      openvpn
      softether
      wireguard-tools
      wireguard-ui
      tor
      tor-browser
      veracrypt
      onionshare-gui
      onioncircuits
      zeronet-conservancy
      freenet
      metadata
      exiftool
      pdftag
    ];
}
