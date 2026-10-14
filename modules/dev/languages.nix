{
  # Global toolchains for quick hacking. For real projects prefer a per-repo
  # flake devShell + direnv so versions are pinned per project.
  flake.modules.homeManager.go =
    { pkgs, ... }:
    {
      programs.go.enable = true;
      home.packages = with pkgs; [
        gopls
        delve
        golangci-lint
      ];
    };

  flake.modules.homeManager.rust =
    { pkgs, ... }:
    {
      # rustup keeps the Arch-style workflow (toolchains, components, targets).
      home.packages = with pkgs; [
        rustup
        gcc # linker
      ];
    };

  flake.modules.homeManager.dotnet =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.dotnet-sdk ];
      home.sessionVariables.DOTNET_CLI_TELEMETRY_OPTOUT = "1";
    };
}
