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
      vscode
      neovide

      # langs
      jdk17
      nodejs
      gjs
      bun
      cargo
      go
      gcc
      typescript
      eslint
      tree-sitter
    ];
  };
}
