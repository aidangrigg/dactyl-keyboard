{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/26.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell rec {
          packages = with pkgs; [
            openscad
            clojure
            leiningen
          ];
        };
      }
    );
}
