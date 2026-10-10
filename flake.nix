{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} {
    systems = inputs.nixpkgs.lib.platforms.all;
    perSystem = {pkgs, ...}: {
      devShells.default = pkgs.mkShellNoCC {
        nativeBuildInputs = with pkgs; [
          nodejs
        ];
      };
    };
  };
}
