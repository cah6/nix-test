{ withHoogle ? false
}:
let
  pinnedPkgs = import ./pkgs-from-json.nix { json = ./nixos-18-09.json; };

  hie84pkgs = import /Users/christian.henry/coding/cloned/hie-nix/ghc-8.4.nix { pkgs = pinnedPkgs; };

  customHaskellPackages = pinnedPkgs.haskell.packages.ghc861.override (old: {
    overrides = pinnedPkgs.lib.composeExtensions (old.overrides or (_: _: {})) (self: super: {
      project1 = self.callPackage ./default.nix { };
      # haskell-ide-engine = pinnedPkgs.haskell.lib.doJailbreak hie84pkgs.haskell-ide-engine;
      # ghc-mod-core = pinnedPkgs.haskell.lib.doJailbreak hie84pkgs.ghc-mod-core;
      # hie-plugin-api = pinnedPkgs.haskell.lib.doJailbreak hie84pkgs.hie-plugin-api;
      # constrained-dynamic = pinnedPkgs.haskell.lib.doJailbreak hie84pkgs.constrained-dynamic;
      # haddock-api = pinnedPkgs.haskell.lib.doJailbreak hie84pkgs.haddock-api;
      # haddock-library = pinnedPkgs.haskell.lib.doJailbreak hie84pkgs.haddock-library;
      # cabal-helper = pinnedPkgs.haskell.lib.doJailbreak hie84pkgs.cabal-helper;
      # ghc-syb-utils = null;
      # mtl = null;
      # parsec = null;
      # stm = null;
      # text = null;
      # Cabal = null;
      # additional overrides go here
    });
  });

  hoogleAugmentedPackages = import ./toggle-hoogle.nix { withHoogle = withHoogle; input = customHaskellPackages; };

in
  { project1 = hoogleAugmentedPackages.project1;
    # hie = pinnedPkgs.haskell.lib.justStaticExecutables hoogleAugmentedPackages.haskell-ide-engine;
  }