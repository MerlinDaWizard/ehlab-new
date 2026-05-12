{
  lib,
  stdenv,
  just,
  soupault,
  gawk,
  lua,
  bash,
  ...
}:
stdenv.mkDerivation {
  name = "gic.aria.rip";
  src = lib.sources.sourceByRegex ./. [
    "site/?.*"
    "templates/?.*"
    "soupault.toml"
    "justfile"
  ];

  phases = [
    "buildPhase"
    "installPhase"
  ];

  nativeBuildInputs = [
    just
    soupault
  ];

  buildPhase = ''
    cp $src/* . -r
    just build --no-caching
  '';

  installPhase = ''
    cp -a build/ $out/
  '';
}
