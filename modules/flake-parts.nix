{ inputs, ... }:
{
  # Provides the `flake.modules.<class>.<name>` option used by every feature file.
  imports = [ inputs.flake-parts.flakeModules.modules ];

  systems = [ "x86_64-linux" ];

  # `nix fmt` formats the whole repo.
  perSystem = { pkgs, ... }: {
    formatter = pkgs.nixfmt;
  };
}
