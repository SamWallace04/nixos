{ config, ... }:
let
  inherit (config.my) username fullName;
in
{
  # System side: the account itself + Home Manager wiring.
  flake.modules.nixos.user =
    { pkgs, ... }:
    {
      users.users.${username} = {
        isNormalUser = true;
        description = fullName;
        extraGroups = [
          "wheel"
          "networkmanager"
          "video"
          "audio"
        ];
        shell = pkgs.zsh;
        openssh.authorizedKeys.keys = [
          # "ssh-ed25519 AAAA... you@arch"
        ];
      };

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "hm-bak"; # don't fail on pre-existing dotfiles
      };
    };

  # User side: anything every host's user environment should have.
  flake.modules.homeManager.user = {
    programs.home-manager.enable = true;
    xdg.enable = true;
  };
}
