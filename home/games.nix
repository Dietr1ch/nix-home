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
      obs-v4l2sink
    ];
  };
}
