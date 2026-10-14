{
  description = "Dendritic NixOS config";

  inputs = {
    # Swap to "github:NixOS/nixpkgs/nixos-26.05" (and home-manager "release-26.05") for stable.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    import-tree.url = "github:vic/import-tree";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  # Every .nix file under ./modules is a flake-parts module and is imported automatically.
  # Files or directories starting with "_" are skipped (used for hardware-configuration).
  outputs =
    inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
