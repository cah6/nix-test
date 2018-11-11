{ mkDerivation, base, binary, bytestring, cabal-helper, containers
, deepseq, directory, extra, fclabels, fetchgit, filepath, ghc
, ghc-boot, ghc-paths, haskell-src-exts, monad-control
, monad-journal, mtl, optparse-applicative, pipes, process, safe
, split, stdenv, syb, template-haskell, temporary, time
, transformers, transformers-base
}:
mkDerivation {
  pname = "ghc-mod-core";
  version = "5.9.0.0";
  src = fetchgit {
    url = "https://github.com/haskell/haskell-ide-engine.git";
    sha256 = "0yyhvbln5wzgfwvmssqxm2f15wbrr66xr3ayhll9k2azpnck0wfq";
    rev = "06de34eb53667a6b90ead0907dd002156b1638ab";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/./submodules/ghc-mod/core; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    base binary bytestring cabal-helper containers deepseq directory
    extra fclabels filepath ghc ghc-boot ghc-paths haskell-src-exts
    monad-control monad-journal mtl optparse-applicative pipes process
    safe split syb template-haskell temporary time transformers
    transformers-base
  ];
  doHaddock = false;
  doCheck = false;
  homepage = "https://github.com/DanielG/ghc-mod";
  description = "Happy Haskell Hacking";
  license = stdenv.lib.licenses.agpl3;
}