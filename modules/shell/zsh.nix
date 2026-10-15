{ config, ... }:
let
  dots = config.my.dotfilesPath;
in
{
  # Needed system-side so zsh is a valid login shell.
  flake.modules.nixos.zsh = {
    programs.zsh.enable = true;
  };

  # Your own .zshrc/.zprofile/.zshenv from the dotfiles repo. Home Manager's
  # programs.zsh is deliberately NOT enabled, since it would generate these files.
  flake.modules.homeManager.zsh =
    { config, pkgs, ... }:
    let
      link = p: config.lib.file.mkOutOfStoreSymlink "${dots}/${p}";
    in
    {
      home.file.".zshrc".source = link "home/.zshrc";
      home.file.".zprofile".source = link "home/.zprofile";
      home.file.".zshenv".source = link "home/.zshenv";

      # The paths your .zshrc expects, provided from Nix instead of git clones.
      home.file.".oh-my-zsh".source = "${pkgs.oh-my-zsh}/share/oh-my-zsh";
      home.file.".zsh/zsh-autosuggestions".source =
        "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";

      home.packages = with pkgs; [
        starship
        eza
        bat
        fzf
      ];
    };
}
