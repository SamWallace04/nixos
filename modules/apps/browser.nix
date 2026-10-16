{ inputs, ... }:
{
  flake.modules.homeManager.browser =
    { pkgs, ... }:
    {
      home.packages = [
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}
