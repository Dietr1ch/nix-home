{ config, pkgs, ... }:

{
  programs = {
    firefox = {
      enable = true;
    };
    # qutebrowser.enable = true;
    chromium.enable = true;
  };
}
