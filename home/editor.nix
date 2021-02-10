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
    ];

    sessionVariables = {
      EDITOR = "emacseditor -c";
    };
  };

  services = {
    emacs.enable = true;
  };
}
