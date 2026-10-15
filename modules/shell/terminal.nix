{ config, ... }:
let
  dots = config.my.dotfilesPath;
in
{
  # Ghostty + zellij, configs linked from the dotfiles repo.
  # Ghostty needs OpenGL 4.3; the TrueNAS VM provides that via llvmpipe (software), so it works but isn't fast.
  flake.modules.homeManager.terminal =
    { config, pkgs, ... }:
    let
      link = p: config.lib.file.mkOutOfStoreSymlink "${dots}/${p}";
    in
    {
      home.packages = with pkgs; [
        ghostty
        zellij
      ];
      xdg.configFile."ghostty".source = link "ghostty";
      xdg.configFile."zellij".source = link "zellij";
    };
}
