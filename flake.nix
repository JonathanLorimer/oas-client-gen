{
  description = "oas-client-gen";

  inputs = {
    # Nix Inputs
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    forAllSystems = function:
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ] (system:
        function rec {
          inherit system;
          pkgs = nixpkgs.legacyPackages.${system};
          hsPkgs = pkgs.haskellPackages.override {
            overrides = hfinal: hprev: {
              oas-client-gen = hfinal.callCabal2nix "oas-client-gen" ./. {};
              deriving-aeson = hfinal.callHackage "deriving-aeson" "0.2.10" {};
            };
          };
        });
  in {
    # nix fmt
    formatter = forAllSystems ({pkgs, ...}: pkgs.alejandra);

    # nix develop
    devShell = forAllSystems ({
      hsPkgs,
      pkgs,
      ...
    }:
      hsPkgs.shellFor {
        # withHoogle = true;
        packages = p: [
          p.oas-client-gen
        ];
        buildInputs = with pkgs; [
          hsPkgs.haskell-language-server
          haskellPackages.cabal-install
          cabal2nix
          haskellPackages.ghcid
          haskellPackages.fourmolu
          haskellPackages.cabal-fmt
        ];
      });

    # nix build
    packages = forAllSystems ({hsPkgs, ...}: {
      oas-client-gen = hsPkgs.oas-client-gen;
      default = hsPkgs.oas-client-gen;
    });

    # You can't build the oas-client-gen package as a check because of IFD in cabal2nix
    checks = {};

    # nix run
    apps = forAllSystems ({system, ...}: {
      oas-client-gen = {
        type = "app";
        program = "${self.packages.${system}.oas-client-gen}/bin/oas-client-gen";
      };
      default = self.apps.${system}.oas-client-gen;
    });
  };
}
