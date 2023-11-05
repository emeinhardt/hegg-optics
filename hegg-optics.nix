{ mkDerivation, base, containers, hegg, lib, optics-core }:
mkDerivation {
  pname = "hegg-optics";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [ base containers hegg optics-core ];
  description = "Optical analogues of the lenses provided by [hegg](https://hackage.haskell.org/package/hegg)";
  license = lib.licenses.mit;
}
