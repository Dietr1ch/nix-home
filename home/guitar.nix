{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # Guitar tabs
      tuxguitar
      fluidsynth
      qsynth

      # Jack
      jack2
      qjackctl

      # DAWs
      ardour
      lmms
      qtractor
      #reaper
      #bitwig
    ];
  };
}
