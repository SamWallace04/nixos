{
  # Needed system-side so zsh is a valid login shell.
  flake.modules.nixos.zsh = {
    programs.zsh.enable = true;
  };

  flake.modules.homeManager.zsh = {
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history.size = 50000;
      shellAliases = {
        ll = "ls -la";
        rebuild = "nh os switch";
        update = "nh os switch --update";
      };
    };

    programs.starship.enable = true;
    programs.fzf.enable = true;
    programs.zoxide.enable = true;

    # Per-project dev shells via `use flake` in .envrc
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
