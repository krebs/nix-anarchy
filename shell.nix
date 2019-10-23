{ pkgs ? import <nixpkgs> {} }:
let
  misdemeanor-font = pkgs.fetchzip {
    url = "https://www.fontspace.com/download/16218/9a577775d1e340fd8c36cdd090340f77/kc-fonts_misdemeanor.zip";
    sha256 = "1908wxqgi1jiwdc7kvq8xnb1z31337gca1qpdz353xgv5ndsi7py";
    stripRoot = false;
  };
in
pkgs.mkShell {
  buildInputs = [ pkgs.inkscape ];
  FONTCONFIG_FILE = pkgs.makeFontsConf { fontDirectories = [ misdemeanor-font ]; };
}
