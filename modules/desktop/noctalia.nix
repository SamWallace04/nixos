{
  # Noctalia v5 (native shell: bar, launcher, lock screen, notifications).
  # Started by `noctalia` in hypr/autolaunch.lua, same as on Arch.
  flake.modules.nixos.noctalia = {
    services.upower.enable = true; # battery/power widgets
  };

  flake.modules.homeManager.noctalia =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.noctalia ];
      # Settings changed in Noctalia's UI live in ~/.local/state/noctalia/settings.toml
      # (not in the dotfiles repo). Hand-written config would go in ~/.config/noctalia/*.toml;
      # if you add a `noctalia` folder to your dotfiles, link it here like the other apps:
      #   xdg.configFile."noctalia".source = config.lib.file.mkOutOfStoreSymlink "${dots}/noctalia";
      # Colour templates (hypr/noctalia.lua, ghostty/themes/noctalia) write into the
      # linked dotfiles folders, which works because those links are writable.
    };
}
