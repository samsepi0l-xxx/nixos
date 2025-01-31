{ config, lib, pkgs, ... }:

{
  hardware.graphics.extraPackages = [
    pkgs.amdvlk
  ];

  # To enable Vulkan support for 32-bit applications, also add:
  hardware.graphics.extraPackages32 = [
    pkgs.driversi686Linux.amdvlk
  ];

  # Force radv
  environment.variables.AMD_VULKAN_ICD = "RADV";
}
