{
  flake.modules.homeManager.terminal = {
    # kitty needs OpenGL; under TrueNAS it runs on llvmpipe (software). Swap for `foot` if it's sluggish.
    programs.kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 11;
      };
      settings = {
        enable_audio_bell = false;
        confirm_os_window_close = 0;
      };
    };
  };
}
