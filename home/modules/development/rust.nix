{ pkgs, ... }: {
  home.packages = with pkgs; [ 
    (pkgs.rust-bin.stable.latest.default.override {
      extensions = [ "rust-src" "cargo" "rustc" "clippy" ];
    })

    rust-analyzer
  ];

  home.sessionVariables = {
    RUST_SRC_PATH = "${pkgs.rust-bin.stable.latest.default.override {
      extensions = [ "rust-src" ];
    }}/lib/rustlib/src/rust/library";
  };
}