{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # Backups
      # -------
      restique

      # Documents
      # ---------
      logseq
      libreoffice-fresh
      okular
      # Tools
      pandoc
      # texlive.combined.scheme-medium
      # texlive.combined.scheme-tetex  # "more" than the medium, but nowhere near the full scheme.
      texlive.combined.scheme-full
      python39Packages.pygments
      # Dictionaries
      hunspell
      hunspellDicts.en_US-large
      hunspellDicts.en_GB-large
      hunspellDicts.es_CL
      hunspellDicts.es_ES
      hunspellDicts.de_CH
      hunspellDicts.de_DE
      # Sync
      ipfs
      brig
      # Extract
      ark
      unzip
      # Encrypt
      plasma-vault
      # tablet
      rmview

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
      tray = {
        enable = true;
      };
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
