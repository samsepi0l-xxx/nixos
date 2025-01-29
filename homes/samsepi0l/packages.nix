{ pkgs, ... }@inputs:

{

  home = {
    packages = with pkgs; with nodePackages_latest; [

      # gui
      (mpv.override { scripts = [ mpvScripts.mpris ]; })
      dolphin
      github-desktop
      vlc
      lutris
      jetbrains.rider
      jetbrains.idea-community-bin
      vscode
      neovide
      plank

      # tools
      bat
      eza
      fd
      ripgrep
      fzf
      socat
      jq
      gojq
      acpi
      ffmpeg
      libnotify
      killall
      zip
      unzip
      glib
      foot
      showmethekey
      wine
      winetricks
      dxvk
      openssl
      asdf-vm

      # security
      keepassxc
      openvpn
      softether
      wireguard-tools
      wireguard-ui
      mullvad-vpn
      tor
      tor-browser
      librewolf
      proxychains-ng
      veracrypt
      onionshare-gui
      onioncircuits
      telegram-desktop
      zeronet-conservancy
      freenet
      metadata
      exiftool
      pdftag

      # langs
      jdk17
      nodejs
      gjs
      bun
      cargo
      go
      gcc
      typescript
      python39
      eslint

    ];
  };
}
