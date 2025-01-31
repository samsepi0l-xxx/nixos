{ config, lib, pkgs, ... }:

{

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  boot.kernelParams = [ 
    "quiet" "splash"
    "mitigations=auto,nosmt"   # Segurança contra vulnerabilidades de CPU
    "amd_pstate=active"        # Melhor escalonamento de frequência para CPUs AMD
    "lsm=landlock,lockdown,yama,integrity,bpf,apparmor"  # Apenas SELinux ativado
  ];

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

}
