{ config, pkgs, ... }:

{
  imports = [
    ./home/core.nix
    ./home/desktop.nix
    ./home/keyboard.nix
    ./home/paper.nix

    ./home/browsers.nix
    ./home/comms.nix
    ./home/editor.nix
    ./home/games.nix
    ./home/guitar.nix
    ./home/music.nix
    ./home/shell.nix
    ./home/fonts.nix

    ./home/mail.nix
  ];

  home = {
    username = "dietr1ch";
    homeDirectory = "/home/dietr1ch";

    packages = with pkgs; [
      ispell

      # Misc
      # ----
      monero
    ];
  };

  # Hacks
  manual.manpages.enable = false;
}

