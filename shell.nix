{ nixpkgs ? import <nixpkgs> {}
}:
let 
  lib = nixpkgs.pkgs.lib;
  pinnedPkgs = import ./pkgs-from-json.nix { json = ./nixos-18-09.json; };
  haskellPackages = (import ./release.nix { withHoogle = true; } );

  # hie = import (fetchTarball {
  #   url = https://github.com/domenkozar/hie-nix/tarball/master;
  # }) {};
  # ghcPackages = /nix/store/z0b9awfkdrzvfahjwfn69cg71ii09swz-ghc-8.4.3-with-packages;

  # cabal-helper = pinnedPkgs.haskell.lib.doJailbreak (
  #   pinnedPkgs.haskellPackages.callHackage "cabal-helper" "0.7.3.0" {}
  # ); 

  # ghc-mod = pinnedPkgs.haskell.lib.doJailbreak (
  #   pinnedPkgs.haskellPackages.callHackage "ghc-mod" "5.8.0.0" { cabal-helper = cabal-helper; }
  # ); 
  ghcWithPackages = pinnedPkgs.haskellPackages.ghcWithPackages (p: with p; []);

  projectDrvEnv = haskellPackages.project1.env.overrideAttrs (oldAttrs: rec {
    buildInputs = oldAttrs.buildInputs ++ [ 
      pinnedPkgs.haskellPackages.hlint
      # pinnedPkgs.haskellPackages.cabal-install
      haskellPackages.hie
      ghcWithPackages
      # cabal-helper
      # ghc-mod
      # pinnedPkgs.haskellPackages.aeson
      # pinnedPkgs.haskellPackages.lens
      # pinnedPkgs.postgresql
      # hie.hie84
      ];
    # shellHook = ''
    #   export NIX_GHC="${ghcPackages}/bin/ghc"
    #   export NIX_GHCPKG="${ghcPackages}/bin/ghc-pkg"
    #   export NIX_GHC_DOCDIR="${ghcPackages}/share/doc/ghc/html"
    #   export NIX_GHC_LIBDIR="${ghcPackages}/lib/ghc-8.4.3"
    # '';
  });
in 
  projectDrvEnv