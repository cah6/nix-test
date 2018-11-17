{ nixpkgs ? import <nixpkgs> {}
}:
let 
  pinnedPkgs = import ./pkgs-from-json.nix { json = ./nixos-18-09.json; };
  haskellPackages = (import ./simple-release.nix { withHoogle = true; } );
  hie = (import (nixpkgs.fetchFromGitHub {
                   owner="domenkozar";
                   repo="hie-nix";
                   rev="a270d8db4551f988437ac5db779a3cf614c4af68";
                   sha256="0hilxgmh5aaxg37cbdwixwnnripvjqxbvi8cjzqrk7rpfafv352q";
                 }) {}).hie84;

  projectDrvEnv = haskellPackages.project1.env.overrideAttrs (oldAttrs: rec {
    buildInputs = oldAttrs.buildInputs ++ [ 
      pinnedPkgs.haskellPackages.cabal-install
      pinnedPkgs.haskellPackages.hlint
      hie
      ];
  });
in 
  projectDrvEnv