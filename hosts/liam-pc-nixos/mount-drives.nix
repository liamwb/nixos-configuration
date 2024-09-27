{
  boot.supportedFilesystems = [ "ntfs" ];

  fileSystems."/var/lib/nvme" = {
    device = "/dev/nvme0n1p2";
    fsType = "ntfs";
    options = [ "rw" "users" "exec" "umask=000 0 0" ];
  };

  # To use proton with games stored on an NTFS filesystem, follow the instructions https://github.com/ValveSoftware/Proton/wiki/Using-a-NTFS-disk-with-Linux-and-Windows

  # in particular, you need to symlink the compatdata directory on the ntfs drive, because ntfs is crap:
  #   $ mkdir -p ~/.steam/steam/steamapps/compatdata
  #   $ ln -s ~/.steam/steam/steamapps/compatdata /path/to/gamedisk/Steam/steamapps/
}
