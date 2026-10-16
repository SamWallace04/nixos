{
  flake.modules.nixos.gaming = {
    programs.steam.enable = true;   # also turns on 32-bit graphics
  };

  flake.modules.homeManager.gaming =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        lutris
      ];
    };
}
