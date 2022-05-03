{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # Steam
      steam
      steam-run

      # Lutris
      lutris

      # Emulators
      dolphinEmu

      # Streaming
      obs-studio
      v4l-utils

      # Games
      knetwalk
      knights
    ];
  };
}
