{ config, username, pkgs, ... }:

{
  # Systemd services setup
  systemd.packages = with pkgs; [
    auto-cpufreq
  ];
  
  # Enable Services
  programs.fish.enable = true;
  services.auto-cpufreq.enable = true;

  environment.systemPackages = with pkgs; [
    xdg-utils
  ];
}
