{ pkgs ? import <nixpkgs> {} }:
let
  misdemeanor-font = pkgs.fetchzip {
    url = "https://www.fontspace.com/download/16218/9a577775d1e340fd8c36cdd090340f77/kc-fonts_misdemeanor.zip";
    sha256 = "1908wxqgi1jiwdc7kvq8xnb1z31337gca1qpdz353xgv5ndsi7py";
    stripRoot = false;
  };
  all-ages-font = pkgs.fetchzip {
    url = "https://www.fontspace.com/download/12184/37e4ed90d3744528bf13e606f1a5e125/kc-fonts_all-ages.zip";
    sha256 = "0pbs3s1n18qjhjcqwfxc9y95yqgm6n3mpyd5ss0ciil44klg256h";
    stripRoot = false;
  };
in
pkgs.mkShell {
  buildInputs = [ pkgs.inkscape ];
  FONTCONFIG_FILE = pkgs.makeFontsConf { fontDirectories = [ all-ages-font misdemeanor-font ]; };
}
