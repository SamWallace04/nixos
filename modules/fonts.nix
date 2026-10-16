{
  flake.modules.nixos.fonts = { pkgs, ... }: {
    fonts = {
      packages = with pkgs; [
        nerd-fonts.jetbrains-mono
      ];
      fontconfig.defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];
    };
  };
}
