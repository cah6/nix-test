{
  bootstrap ? import <nixpkgs> {}
, pinnedJsonFile
}:
let 
  nixpkgs = builtins.fromJSON (builtins.readFile pinnedJsonFile);
  src = bootstrap.fetchFromGitHub {
    owner = "NixOS";
    repo  = "nixpkgs-channels";
    inherit (nixpkgs) rev sha256;
  };
in 
  import src {} 