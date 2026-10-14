{ config, ... }:
let
  inherit (config.my) fullName email;
in
{
  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;
      settings = {
        user.name = fullName;
        user.email = email;
        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };
  };
}
