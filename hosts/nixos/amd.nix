{ config, lib, ... }:

{
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["amd"];

}
