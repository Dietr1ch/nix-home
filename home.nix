{ config, pkgs, ... }:

{
  imports = [
    ./home/core.nix
    ./home/desktop.nix
    ./home/keyboard.nix

    ./home/browsers.nix
    ./home/comms.nix
    ./home/editor.nix
    ./home/games.nix
    ./home/guitar.nix
    ./home/music.nix
    ./home/shell.nix

    ./home/mail.nix
  ];

  home = {
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

