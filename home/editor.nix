{ config, pkgs, ... }:

{
  programs = {
    emacs = {
      enable = true;
      package = pkgs.emacsPgtkGcc;
      extraPackages = epkgs: with epkgs; [
        # exwm
        emacsql-sqlite
        vterm
        # pdf-tools
      ];
    };
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

  nixpkgs.overlays = [
    # Emacs
    # https://gist.github.com/mjlbach/179cf58e1b6f5afcb9a99d4aaf54f549
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
  ];
}
