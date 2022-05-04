{ config, pkgs, ... }:

{
  programs = {
    emacs = {
      enable = true;

      package = pkgs.emacsPgtkNativeComp;
      # package = pkgs.emacsUnstable;
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
      EDITOR = "emacsclient --create-frame --alternate-editor 'false'";
      LSP_USE_PLISTS = "true";
    };
  };

  services = {
    emacs = {
      enable = true;
      defaultEditor = true;

      client = {
        enable = true;
        arguments = [
          "--create-frame"
          "--alternate-editor"
          "false"
        ];
      };
    };
  };

  nixpkgs.overlays = [
    # Emacs
    # https://gist.github.com/mjlbach/179cf58e1b6f5afcb9a99d4aaf54f549
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
      sha256 = "0phc2qwqgfa8rp9bcn36d479l3hl77x0kg2398vdjj730h43wcql";
    }))
  ];
}
