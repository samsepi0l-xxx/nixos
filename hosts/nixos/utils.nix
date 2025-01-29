{ config, username, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
  ];
}
