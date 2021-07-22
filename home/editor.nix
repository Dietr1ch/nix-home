{ config, pkgs, ... }:

{
  programs = {
    emacs.enable = true;
  };

  home = {
    packages = with pkgs; [
      # emacs  # (Using programs.emacs)
      neovim
      vscodium

      meld

      # Used by emacs
      sqlite
    ];

    sessionVariables = {
      EDITOR = "emacsclient --create-frame --alternate-editor emacs";
    };
  };

  services = {
    emacs.enable = true;
  };
}
