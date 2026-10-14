{ lib, ... }:
{
  # Flake-level values shared by every feature file.
  # Read them from the OUTER scope of a file: `{ config, ... }: let user = config.my.username; in { ... }`
  options.my = {
    username = lib.mkOption {
      type = lib.types.str;
      default = "youruser"; # <- change to the user you created during install
    };
    fullName = lib.mkOption {
      type = lib.types.str;
      default = "Your Name";
    };
    email = lib.mkOption {
      type = lib.types.str;
      default = "you@example.com";
    };
    # Where this repo lives on disk; used by `nh`.
    flakePath = lib.mkOption {
      type = lib.types.str;
      default = "/home/youruser/nixos-config";
    };
  };
}
