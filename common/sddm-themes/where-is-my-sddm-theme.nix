{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  name = "where-is-my-sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "stepanzubkov";
    repo = "where-is-my-sddm-theme";
    rev = "53f83d00854cce7f4a5e0417a0da637ce37ae18c";
    sha256 = "1smqrk22626wa3jki5v93yv1gsv7zy9fj1md4z1lsb6zk7cjrzc6";
  };
  buildInputs = [
    pkgs.qt5.qtbase
    pkgs.qt5.qtdeclarative
    pkgs.qt5.qtquickcontrols2
    pkgs.qt5.qtgraphicaleffects
    pkgs.sddm
  ];
  dontWrapQtApps = true;
  installPhase = ''
    mkdir -p $out
    cp -R where_is_my_sddm_theme/* $out
  '';
}

