{ config, username, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tgpt
    eza
    file
    upx
    git
    lazygit
    delta
    license-generator
    git-ignore
    gitleaks
    git-secrets
    pass-git-helper
    just
    xh
    process-compose
    # mcfly # terminal history
    zellij
    progress
    noti
    topgrade
    ripgrep
    rewrk
    wrk2
    procs
    tealdeer
    acpi
    ffmpeg
    libnotify
    killall
    # skim #fzf better alternative in rust
    monolith
    aria
    # macchina #neofetch alternative in rust
    sd
    ouch
    duf
    du-dust
    fd
    jq
    gojq
    gh
    trash-cli
    zoxide
    tokei
    fzf
    socat
    bat
    hexyl
    mdcat
    pandoc
    lsd
    lsof
    gping
    viu
    tre-command
    yazi
    chafa

    cmatrix
    pipes-rs
    rsclock
    cava
    figlet

    zip
    unzip
    glib
   
    wine
    winetricks
    dxvk
    openssl 
  ];
}
