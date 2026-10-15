{ config, ... }:
let
  dots = config.my.dotfilesPath;
in
{
  # rofi launcher (SUPER+D) and waybar (not autostarted; noctalia is the bar).
  flake.modules.homeManager.launchers =
    { config, pkgs, ... }:
    let
      link = p: config.lib.file.mkOutOfStoreSymlink "${dots}/${p}";
    in
    {
      home.packages = with pkgs; [
        rofi
        waybar
      ];
      xdg.configFile."rofi".source = link "rofi";
      xdg.configFile."waybar".source = link "waybar";
    };
}
