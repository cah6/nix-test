{ mkDerivation, base, bytestring, containers, deepseq, stdenv
, transformers
}:
mkDerivation {
  pname = "haddock-library";
  version = "1.6.0";
  sha256 = "609f096e7b7d2690fc2302d6a77f6a0e0fefb64ae64e90d90e754dc37f10e740";
  libraryHaskellDepends = [
    base bytestring containers deepseq transformers
  ];
  doHaddock = false;
  doCheck = false;
  homepage = "http://www.haskell.org/haddock/";
  description = "Library exposing some functionality of Haddock";
  license = stdenv.lib.licenses.bsd3;
}