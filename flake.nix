{
  description = "Full-stack dev environment (replaces Mason toolchain)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # ── lua ──────────────────────────────
            stylua
            selene
            luaPackages.luacheck
            lua-language-server

            # ── language agnostic ────────────────
            typos
            just
          ];

          shellHook = ''
            corepack enable
            echo "⚡ Dev environment ready"
            echo "Lua: $(lua -v)"
          '';
        };

        formatter = pkgs.nixfmt-tree;
      }
    );
}
