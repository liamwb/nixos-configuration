{
  boot.supportedFilesystems = [ "ntfs" ];

  fileSystems."/var/lib/nvme" = {
    device = "/dev/nvme0n1p2";
    fsType = "ntfs-3g";
    options = [ "rw" ];
  };
}
