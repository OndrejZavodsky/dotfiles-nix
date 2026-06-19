{pkgs}:
pkgs.mkShell {
  packages = with pkgs; [
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
    pkg-config
    gcc
    openssl
  ];

  shellHook = ''
    echo "Rust development environment"
  '';
}
