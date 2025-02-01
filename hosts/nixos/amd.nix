{ pkgs, ... }:

{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        amdvlk
      ];
      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
    };
  };

  # Force radv
  environment.variables.AMD_VULKAN_ICD = "RADV";
}
