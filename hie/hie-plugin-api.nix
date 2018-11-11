{ mkDerivation, aeson, base, constrained-dynamic, containers, Diff
, directory, fetchgit, filepath, fingertree, free, ghc
, ghc-mod-core, haskell-lsp, hslogger, monad-control, mtl, stdenv
, stm, syb, text, transformers, unix, unordered-containers
}:
mkDerivation {
  pname = "hie-plugin-api";
  version = "0.2.2.0";
  src = fetchgit {
    url = "https://github.com/haskell/haskell-ide-engine.git";
    sha256 = "0yyhvbln5wzgfwvmssqxm2f15wbrr66xr3ayhll9k2azpnck0wfq";
    rev = "06de34eb53667a6b90ead0907dd002156b1638ab";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/hie-plugin-api; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    aeson base constrained-dynamic containers Diff directory filepath
    fingertree free ghc ghc-mod-core haskell-lsp hslogger monad-control
    mtl stm syb text transformers unix unordered-containers
  ];
  doHaddock = false;
  doCheck = false;
  description = "Haskell IDE API for plugin communication";
  license = stdenv.lib.licenses.bsd3;
}