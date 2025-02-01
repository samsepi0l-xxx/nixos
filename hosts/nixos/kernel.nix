{ config, lib, pkgs, modulesPath, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  boot.kernelModules = [ "kvm-amd" ];A
  boot.kernelParams = [ 
    "splash"
    "quiet"
    "fbcon=nodefer"
    "vt.global_cursor_default=0"
    "lsm=landlock,lockdown,yama,integrity,apparmor,bpf,tomoyo,apparmor"
    "usbcore.autosuspend=-1"
    "video4linux"
    "acpi_rev_override=5"
    "video=DP-1:1336x736@60"
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];

  boot.extraModulePackages = with config.boot.kernelPackages; [ wireguard ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/362557db-f656-4d04-9bc7-20b614d87b46";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-9e33d010-c401-4fa9-9d9f-7084ffb7cc27".device = "/dev/disk/by-uuid/9e33d010-c401-4fa9-9d9f-7084ffb7cc27";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/5CF7-66BE";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp3s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  environment.systemPackages = with pkgs; [
    policycoreutils
  ];
}
