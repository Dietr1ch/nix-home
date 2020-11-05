{ config, pkgs, ... }:

{
  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    direnv.enable = true;

    man.enable = true;
    command-not-found.enable = true;

    git = {
      enable = true;
      # aliases = {
      # };
    };

    ssh = {
      enable = true;
      controlMaster = "auto";
      controlPath = "/run/user/%i/ssh-socket-%l-%r@%h:%p";
      serverAliveInterval = 10;  # 10s
      serverAliveCountMax = 3;   # Disconnect at the 3rd lost keep-alive.
      extraConfig = ''
        Include /home/dietr1ch/.config/ssh/config.d/*
      '';
    };

    jq.enable = true;
  };

  home = {
    packages = with pkgs; [
      # SSH
      openssh

      # Tools
      htop
      ncdu

      # Programming
      # -----------
      # Source control
      git
      gitAndTools.git-absorb
      gitAndTools.git-appraise
      gitAndTools.git-ignore
      gitAndTools.git-trim
      pijul
      # Programming languages
      ghc      # ghci
      python3  # ipython + many small things depend on it :(
      # Text tools
      gawk
      gitAndTools.delta
      broot
      ripgrep
      jq
      fzf
      fzy

      # Images
      # ------
      imagemagick

      # System
      # ------
      binutils
      partition-manager

      # Network
      # -------
      nmap
    ];
  };

  services = {
    lorri.enable = true;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";
}
