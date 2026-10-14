{ lib, ... }:
{
  # Flake-level values shared by every feature file.
  # Read them from the OUTER scope of a file: `{ config, ... }: let user = config.my.username; in { ... }`
  options.my = {
    username = lib.mkOption {
      type = lib.types.str;
      default = "sam"; # <- change to the user you created during install
    };
    fullName = lib.mkOption {
      type = lib.types.str;
      default = "Sam Wallace";
    };
    email = lib.mkOption {
      type = lib.types.str;
      default = "sam@wallace.gg";
    };
    # Where this repo lives on disk; used by `nh`.
    flakePath = lib.mkOption {
      type = lib.types.str;
      default = "/home/sam/nixos-config";
    };
  };
}
