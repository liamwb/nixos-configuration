let
  baduk = fetchFromGitHub {
    owner = "dustinlacewell";
    repo = "baduk.nix";
    rev = "9c5d79b752e7e9e56f514314eba5a18ce398658c";
    sha256 = "04yri911rj9j19qqqn6m82266fl05pz98inasni0vxr1cf1gdg00";
  };

in
{
  imports = [ baduk ];
}
