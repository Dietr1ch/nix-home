{ config, pkgs, ... }:

{
  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
    };

    man.enable = true;
    command-not-found.enable = true;

    git = {
      enable = true;

      userName = "Dietrich Daroch";
      userEmail = "Dietrich.Daroch@gmail.com";

      aliases = {
        "exec" = "!exec ";

        "h" = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
        "ll" = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%<(12)%ar)%C(reset)  %s%C(dim white) - %an  %C(auto)%d%C(reset)'";
        "lla" = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%<(12)%ar)%C(reset)  %s%C(dim white) - %an  %C(auto)%d%C(reset)' --all";

        "publish" = "!sh -c 'git push -u origin $(git branch-name)'";
        "unpublish" = "!sh -c 'git push -u origin :$(git branch-name)'";

        "branch-name" = "rev-parse --abbrev-ref HEAD";
        "ls" = "!sh -c 'git ls-tree --name-only -r $(git branch-name)'";
      };

      extraConfig = {
        init = {
          defaultBranch = "master";
        };
      };
    };

    ssh = {
      enable = true;
      compression = true;
      controlMaster = "auto";
      controlPath = "/run/user/%i/ssh-socket-%l-%r@%h:%p";
      serverAliveInterval = 10;  # 10s
      # serverAliveCountMax = 3;   # Disconnect at the 3rd lost keep-alive.
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
      lnav

      # Programming
      # -----------
      # File watching
      inotify-tools
      # Source control
      git
      gitflow
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
      # LSP
      rnix-lsp

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
  home.stateVersion = "22.05";
}
