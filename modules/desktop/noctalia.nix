{ config, ... }:
let
  dots = config.my.dotfilesPath;
in
{
  flake.modules.nixos.noctalia = {
    services.upower.enable = true;
  };

  flake.modules.homeManager.noctalia =
    { config, pkgs, ... }:
    {
      home.packages = [ pkgs.noctalia ];
      # UI settings live in the dotfiles repo; Noctalia writes through the symlink.
      home.file.".local/state/noctalia/settings.toml".source =
        config.lib.file.mkOutOfStoreSymlink "${dots}/noctalia.toml";
    };
}
