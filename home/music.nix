{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      beets
      ncmpcpp
      cantata

      sox
    ];
  };

  services = {
    mpd = {
      enable = true;
      musicDirectory = ~/Music;
      playlistDirectory = ~/.config/mpd/playlists;
      dataDir = ~/.config/mpd/data;
    };
    mpdris2 = {
      enable = true;
      multimediaKeys = true;
      notifications = true;
    };
  };
}
