{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # Guitar tabs
      tuxguitar

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
