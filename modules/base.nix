{
  flake.modules.nixos.base =
    { pkgs, ... }:
    {
      boot.loader.systemd-boot.enable = true;
      boot.loader.systemd-boot.configurationLimit = 10;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.networkmanager.enable = true;

      time.timeZone = "Europe/London";
      i18n.defaultLocale = "en_GB.UTF-8";
      console.keyMap = "uk";

      services.openssh = {
        enable = true;
        settings = {
          PermitRootLogin = "no";
          # Flip to false once your key is in users/<you>.nix authorizedKeys.
          PasswordAuthentication = true;
        };
      };

      environment.systemPackages = with pkgs; [
        git
        vim
        curl
        wget
        htop
        ripgrep
        fd
        jq
        unzip
      ];
    };
}
