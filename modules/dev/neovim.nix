{ config, ... }:
let
  dots = config.my.dotfilesPath;
in
{
  # nix-ld lets prebuilt Linux binaries run on NixOS, so LazyVim's Mason can
  # install LSPs/formatters exactly like on Arch.
  flake.modules.nixos.neovim = {
    programs.nix-ld.enable = true;
  };

  flake.modules.homeManager.neovim =
    { config, pkgs, ... }:
    {
      programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        # Don't write ~/.config/nvim/init.lua — that folder is your LazyVim config.
        sideloadInitLua = true;
        # On Neovim's PATH only: what LazyVim, Treesitter and Mason need to work.
        extraPackages = with pkgs; [
          gcc
          gnumake
          git
          curl
          wget
          unzip
          gzip
          ripgrep
          fd
          lazygit
          tree-sitter
          nodejs
          python3
        ];
      };

      # LazyVim config (writable, so lazy-lock.json updates land back in the repo).
      xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${dots}/nvim";
    };
}
