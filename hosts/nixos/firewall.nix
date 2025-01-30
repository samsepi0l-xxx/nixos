{ config, username, pkgs, ... }:

{
  # Firewall 
  networking = {
    firewall.enable = false;
    firewall.allowedTCPPorts = [ 22 80 443 ];
    firewall.allowedUDPPorts = [ 53 ];
  };

}
