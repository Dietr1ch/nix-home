{ config, pkgs, ... }:

{
  programs = {
    emacs = {
      enable = true;

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
}
