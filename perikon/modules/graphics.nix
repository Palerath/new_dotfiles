{ pkgs, ... }:
{
   environment.systemPackages = with pkgs; [
      glxinfo
      vulkan-loader
      vulkan-tools
      vulkan-validation-layers 
      libGL
      libgcrypt
      glib
      glib-networking
      gsettings-desktop-schemas
      openssl
   ];

   # Enable graphics support
   hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
         vaapiVdpau
         libvdpau-va-gl
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [ 
         libva 
         vaapiVdpau
         libvdpau-va-gl
      ];

   };

   hardware.nvidia = {
      open = true;
      videoAcceleration = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      modesetting.enable = true; 
      nvidiaSettings = true;
   };

   services.xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
    };


}
