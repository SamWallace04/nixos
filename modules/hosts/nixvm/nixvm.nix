{ inputs, config, ... }:
let
  inherit (config.flake.modules) nixos homeManager;
  username = config.my.username;
in
{
  flake.nixosConfigurations.nixvm = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      ./_hardware.nix
      inputs.home-manager.nixosModules.home-manager

      nixos.nix-settings
      nixos.base
      nixos.user
      nixos.zsh
      nixos.hyprland
      nixos.neovim
      nixos.noctalia
      nixos.audio
      nixos.fonts
      nixos.truenas-guest

      {
        networking.hostName = "nixvm";
        # Match the value in the /etc/nixos/configuration.nix the installer generated.
        system.stateVersion = "26.05";

        home-manager.users.${username} = {
          imports = with homeManager; [
            user
            zsh
            terminal
            hyprland
            noctalia
            launchers
            neovim
            git
            go
            rust
            dotnet
          ];
          home.stateVersion = "26.05";
        };
      }
    ];
  };
}
