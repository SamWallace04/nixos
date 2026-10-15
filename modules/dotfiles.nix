{ config, lib, ... }:
{
  # Your existing dotfiles repo, cloned on each machine. Feature files link their
  # app's folder from here with mkOutOfStoreSymlink, so edits apply instantly
  # (no rebuild) and the same repo keeps working on Arch.
  options.my.dotfilesPath = lib.mkOption {
    type = lib.types.str; # a string, NOT a path: a path would be copied into the read-only store
    default = "/home/${config.my.username}/dotfiles";
  };
}
