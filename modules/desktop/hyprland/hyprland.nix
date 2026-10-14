{
  # System side: compositor session, portals, login manager.
  flake.modules.nixos.hyprland =
    { pkgs, ... }:
    {
      programs.hyprland.enable = true; # also sets up xdg-desktop-portal-hyprland

      services.greetd = {
        enable = true;
        settings.default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
          user = "greeter";
        };
      };

      security.polkit.enable = true;
      environment.sessionVariables.NIXOS_OZONE_WL = "1"; # Electron/Chromium on Wayland
    };

  # User side: Hyprland config (Lua, Hyprland 0.55+) + the usual Wayland toolkit.
  flake.modules.homeManager.hyprland =
    { pkgs, ... }:
    {
      wayland.windowManager.hyprland = {
        enable = true;
        # Use the binaries installed by the NixOS module to avoid version mismatches.
        package = null;
        portalPackage = null;

        # Explicit, rather than relying on the home.stateVersion >= 26.05 default.
        configType = "lua";

        # Structured settings -> `hl.<name>(...)` calls in ~/.config/hypr/hyprland.lua.
        # Kept in Nix so other modules (e.g. truenas-guest) can merge overrides in.
        settings = {
          monitor = {
            output = "";
            mode = "preferred";
            position = "auto";
            scale = 1;
          };

          config = {
            input = {
              kb_layout = "gb";
              follow_mouse = 1;
            };
            general = {
              gaps_in = 4;
              gaps_out = 8;
              border_size = 2;
              layout = "dwindle";
            };
            decoration.rounding = 6;
            misc = {
              disable_hyprland_logo = true;
              force_default_wallpaper = 0;
            };
          };
        };

        # Real Lua files, auto-required from hyprland.lua. Drop your Arch .lua files in here.
        extraLuaFiles = {
          bindings = ./bindings.lua;
        };
      };

      # Started by hyprland-session.target instead of exec-once.
      programs.waybar = {
        enable = true;
        systemd.enable = true;
      };
      services.mako.enable = true; # D-Bus activated
      programs.fuzzel.enable = true;

      home.packages = with pkgs; [
        wl-clipboard
        grim
        slurp
      ];
    };
}
