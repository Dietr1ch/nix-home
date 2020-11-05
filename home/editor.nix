{ config, pkgs, ... }:

{
  programs = {
    emacs.enable = true;
    vscode.enable = true;
  };

  home = {
    packages = with pkgs; [
      # emacs  # (Using programs.emacs)
      neovim

      meld
    ];

    sessionVariables = {
      EDITOR = "emacseditor -c";
    };
  };

  services = {
    emacs.enable = true;
  };
}
