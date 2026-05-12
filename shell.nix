{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    soupault
    just
    watchexec
    gawk
    lua
  ];

  shellHook = ''
    echo "Available commands:"
    echo "  just dev    - Watch and serve simultaneously"
    echo "  just clean  - Clear the cache"
    echo "  just deploy - Deploy to production"
  '';
}
