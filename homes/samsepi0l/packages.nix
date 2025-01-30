{ pkgs, ... }:

{

  home = {
    packages = with pkgs; with nodePackages_latest; [
      proxychains-ng
      termite
    ];
  };
}
