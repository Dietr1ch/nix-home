{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # Documents
      # ---------
      okular
      # Tools
      pandoc
      texlive.combined.scheme-medium
      # Sync
      brig
      # Extract
      ark
      unzip
      # Encrypt
      plasma-vault

      # Video
      # -----
      vlc
      kdenlive

      # Images
      # ------
      gimp
      krita
      inkscape
      gwenview

      # Internet
      # --------
      transmission-qt
      filezilla

      # Misc
      # ----
      vokoscreen
      spectacle
      xclip
      xdotool
      xorg.xev
      xorg.xmodmap
    ];
  };

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };

    syncthing = {
      enable = true;
      tray = true;
    };

    keepassx = {
      enable = true;
    };

    gpg-agent = {
      enable = true;

      grabKeyboardAndMouse = true;
      enableSshSupport = true;

      maxCacheTtl = 5 * 60;  # 5m
    };

    unclutter = {
      enable = true;
      timeout = 5;  # 5s
    };
  };

  xsession = {
    windowManager = {
      xmonad = {
        enable = true;
        enableContribAndExtras = true;
        config = pkgs.writeText "~/.config/xmonad/xmonad.hs" ''
          import XMonad

          main = xmonad defaultConfig
            { terminal = "alacritty"
            , modMask  = mod4Mask
            , borderWidth  = 2
            }
        '';
      };
    };
  };
}
