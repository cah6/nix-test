{ nixpkgs ? import <nixpkgs> {}
}:
let 
  pinnedPkgs = import ./pkgs-from-json.nix { json = ./nixos-18-09.json; };
  haskellPackages = (import ./simple-release.nix { withHoogle = true; } );

  projectDrvEnv = haskellPackages.project1.env.overrideAttrs (oldAttrs: rec {
    buildInputs = oldAttrs.buildInputs ++ [ 
      # pinnedPkgs.haskellPackages.hlint
      ];
  });
in 
  projectDrvEnv