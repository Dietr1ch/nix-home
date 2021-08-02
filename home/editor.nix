{ config, pkgs, ... }:

{
  programs = {
    emacs.enable = true;
  };

  home = {
    packages = with pkgs; [
      # emacs
      # -----
      # org-roam
      sqlite
      graphviz

      neovim
      vscodium

      meld
    ];

    sessionVariables = {
      EDITOR = "emacsclient --create-frame --alternate-editor emacs";
    };
  };

  services = {
    emacs = {
      enable = true;
    };
  };
}
