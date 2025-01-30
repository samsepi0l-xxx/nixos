{ config, username, pkgs, ... }:

{
  # USB Automounting
  services.gvfs.enable = false;
  # services.udisks2.enable = true;
  # services.devmon.enable = true;

  # Enable USB Guard
  services.usbguard = {
    enable = false;
    dbus.enable = true;
    implicitPolicyTarget = "block";
    # FIXME: set yours pref USB devices (change {id} to your trusted USB device), use `lsusb` command (from usbutils package) to get list of all connected USB devices including integrated devices like camera, bluetooth, wifi, etc. with their IDs or just disable `usbguard`
    rules = ''
      allow id 1ea7:0002 # SHARKOON Keyboard & Mouse
      allow id 18f8:0f97 # Maxxter Gaming Mouse
      allow id 22b8:2e81 # Motorola Moto G (Optional)
    '';
  };

  # Enable USB-specific packages
  environment.systemPackages = with pkgs; [
    usbutils
  ];
}
