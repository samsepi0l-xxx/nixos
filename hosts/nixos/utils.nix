{ config, username, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    conda
    mold
    gcc
    gjs
    cargo
    clang
    lld
    lldb
    musl
    jdk17
    dioxus-cli
    trunk
    python311Packages.pipx
  ];
}
