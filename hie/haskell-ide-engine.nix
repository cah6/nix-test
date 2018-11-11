{ mkDerivation, aeson, apply-refact, async, base, brittany
         , bytestring, Cabal, cabal-helper, containers, data-default, Diff
         , directory, ekg, fetchgit, filepath, ghc, ghc-exactprint, ghc-mod
         , ghc-mod-core, gitrev, haddock-api, haddock-library, HaRe
         , haskell-lsp, haskell-src-exts, hie-plugin-api, hlint, hoogle
         , hsimport, hslogger, lens, monad-control, monoid-subclasses, mtl
         , optparse-simple, parsec, process, sorted-list, stdenv, stm
         , tagsoup, text, transformers, unordered-containers, vector, yaml
         , yi-rope
}:
mkDerivation {
  pname = "haskell-ide-engine";
  version = "0.2.2.0";
  src = fetchgit {
    url = "https://github.com/haskell/haskell-ide-engine.git";
    sha256 = "0yyhvbln5wzgfwvmssqxm2f15wbrr66xr3ayhll9k2azpnck0wfq";
    rev = "06de34eb53667a6b90ead0907dd002156b1638ab";
    fetchSubmodules = true;
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson apply-refact async base brittany bytestring Cabal
    cabal-helper containers data-default Diff directory filepath ghc
    ghc-exactprint ghc-mod ghc-mod-core gitrev haddock-api
    haddock-library HaRe haskell-lsp haskell-src-exts hie-plugin-api
    hlint hoogle hsimport hslogger lens monad-control monoid-subclasses
    mtl optparse-simple parsec process sorted-list stm tagsoup text
    transformers unordered-containers vector yaml yi-rope
  ];
  executableHaskellDepends = [
    base directory ekg ghc-mod-core haskell-lsp hie-plugin-api hslogger
    optparse-simple process stm
  ];
  doHaddock = false;
  doCheck = false;
  homepage = "http://github.com/githubuser/haskell-ide-engine#readme";
  description = "Provide a common engine to power any Haskell IDE";
  license = stdenv.lib.licenses.bsd3;
}