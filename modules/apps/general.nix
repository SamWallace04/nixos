{
  flake.modules.homeManager.general =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        tailscale
        thunar
        peazip
      ];
    };
}
