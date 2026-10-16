{
  flake.modules.homeManager.general =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        thunar
        peazip
        discord
        proton-vpn
        sublime4
        qalculate-qt
      ];
    };
}
