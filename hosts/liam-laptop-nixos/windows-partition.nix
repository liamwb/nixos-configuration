{config, pkgs, ...} :
{
  
# Automatically mount the windows partition
  boot.supportedFilesystems = [ "ntfs" ];
  fileSystems."/run/media/liamwb/windows-part" = {
    device = 
      "/dev/disk/by-uuid/E8261E23261DF2F4";
    fsType = "auto";
    options = [ "rw" "noatime" "users" "defaults" ];
  };

}
