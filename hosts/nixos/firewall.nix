{ ... }:

{
  # Firewall 
  networking = {
    firewall.enable = true;
    firewall.allowedTCPPorts = [ 22 80 443 ];
    firewall.allowedUDPPorts = [ 53 ];
  };

}
