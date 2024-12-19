{config, pkgs, lib, ...} :
{
  
###### Nvidia Nonsense ######

  # enable opengpl and gpu drivers
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia.modesetting.enable = true;

    hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };

    # integrated
    intelBusId = "PCI:0:2:0";

    # dedicated
    nvidiaBusId = "PCI:1:0:0";
  };

  specialisation = {
    dGPU.configuration = {

      hardware.nvidia = {
        prime.sync.enable = lib.mkForce true;
        prime.offload = {
          enable = lib.mkForce false;
          enableOffloadCmd = lib.mkForce false;
        };
      };
    };
  };

  # Taken from NixOS wiki: 
  # If you encounter the problem of booting to text mode you 
  # might try adding the Nvidia kernel module manually with: 
  # boot.initrd.kernelModules = [ "nvidia" ];
  # boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];

###### End  Nvidia Nonsense ######

}
