{
  flake.modules.nixos.fonts =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-color-emoji
        nerd-fonts.jetbrains-mono
      ];
      fonts.fontconfig.defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];
    };
}
