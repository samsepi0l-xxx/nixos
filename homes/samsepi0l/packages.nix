{ pkgs, ... }@inputs:
let
in
{

  home = {
    packages = with pkgs; with nodePackages_latest; [

      # gui
      (mpv.override { scripts = [ mpvScripts.mpris ]; })
      dolphin
      github-desktop
      vlc

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
      

      # langs
      nodejs
      gjs
      bun
      cargo
      go
      gcc
      typescript
      eslint
    ];
  };
}
