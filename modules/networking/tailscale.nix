{ config, ... }:
let
  user = config.my.username;
in
{
  flake.modules.nixos.tailscale = {
    services.tailscale = {
      enable = true;
    };

    # Optional: trust all traffic arriving over the tailnet (any port, from your own devices).
    # networking.firewall.trustedInterfaces = [ "tailscale0" ];
  };

  # Optional tray icon for the Noctalia bar.
  flake.modules.homeManager.tailscale =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.trayscale ];
    };
}
