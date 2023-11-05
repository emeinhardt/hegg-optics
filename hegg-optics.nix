{ mkDerivation, base, containers, hegg, lib, optics-core }:
mkDerivation {
  pname = "hegg-optics";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [ base containers hegg optics-core ];
  homepage = "https://github.com/emeinhardt/hegg-optics";
  description = "Analogues of the lenses provided by hegg for users of the optics library";
  license = lib.licenses.mit;
}
