{ config, pkgs, ... }:

with import <nixpkgs> {};

{
  programs = {
    alacritty = {
      enable = true;
      # settings = {
      # };
    };
    fish = {
      enable = true;
      # functions = {
      # };
      shellAbbrs = {
        cat = "bat -p";
        f = "fd";
        l = "ls --group-directories-first";
        la = "l -a";
        ll = "ls -l --group-directories-first";
        lla = "ll -a";

        rs = "rsync";

        o = "xdg-open";

        m = "ncmpcpp";

        "λ" = "ghci";
        py = "python";
        ipy = "ipython";

        # Editors
        # -------
        e = "emacsclient -c -nw";
        ec = "emacsclient";
        ee = "emacsclient -c";
        em = "emacs";
        v = "vim";
        n = "nvim";

        # Git
        # ---
        g = "git";

        gs = "git status";
        gss = "git status .";
        gst = "git stash";

        gh = "git h";
        gls = "git ls";
        gll = "git ll";
        glla = "git lla";

        ge = "git exec .";

        gd = "git diff";
        gdw = "git diff --ignore-all-space";
        gdc = "git diff --cached";
        gds = "git diff --stat";
        gdcs = "git diff --cached --stat";

        gbl = "git blame";

        gcl = "git clone --recursive";
        gCL = "git clone";

        ga = "git add";
        grm = "git rm --cached";
        gc = "git commit";
        gam = "git commit --amend";

        gco = "git checkout";

        gr = "git rebase --interactive";
        grc = "git rebase --continue";
        gra = "git rebase --abort";

        gb = "git branch";

        grv = "git remote -v";

        gf = "git fetch";
        gfa = "git fetch --all";
        gp = "git pull";

        gpp = "git push";
        gppu = "git push --set-upstream";
        gPP = "git push --force-with-lease";

        gcp = "git cherry-pick";

        gm = "git merge";

        # systemd
        # -------
        sc = "systemctl";
        scu = "systemctl  --user";
        sj = "journalctl";
      };
      functions = {
        gitignore = "curl -sL https://www.gitignore.io/api/$argv";
        fish_greeting = {
          body = ''
            set_color $fish_color_autosuggestion
            uname -nmsr
            command -q -s uptime && command uptime
            set_color normal
          '';
        };
      };
      plugins = [
        # You can get the fingerprint with
        #  nix-prefetch-url --unpack https://github.com/$owner/$repo/archive/$rev.tar.gz

        # https://github.com/oh-my-fish/plugin-config
        # (Dependency for many plugins)
        {
          name = "plugin-config";
          src = pkgs.fetchFromGitHub {
            owner = "oh-my-fish";
            repo = "plugin-config";
            rev = "13c424efb73b153d9b8ad92916cf51159d44099d";  # master on 2021-02-09. Updated on 2016-03-18
            sha256 = "0x1rs89pmj5i8md2ihaw7dq62rz0qgkfky9vply5nx3immd66y6v";
          };
        }

        # https://github.com/Dietr1ch/tmux-zen
        {
          name = "tmux-zen";
          src = pkgs.fetchFromGitHub {
            # owner = "sagebind";
            owner = "Dietr1ch";
            repo = "tmux-zen";
            rev = "b520072db3d0e56c6da7163b1455629e7d16d57a";  # master on 2021-02-09. Updated on 2018-10-08
            sha256 = "075i3sa8zr2akb8x79srgrr3q057ca8x9irp5g5wwq40yrqf7nk6";
          };
        }

        # https://github.com/gazorby/fish-abbreviation-tips
        {
          name = "fish-abbreviation-tips";
          src = pkgs.fetchFromGitHub {
            owner = "gazorby";
            repo = "fish-abbreviation-tips";
            rev = "0be97640909fb20de51ff9ed9bcbda0bd2b28b36";  # master on 2021-02-09. Updated on 2020-11-11
            sha256 = "1bsn0rjnxnqygkg1q8pnqmbsqiscbyvx4xkpds8pnyi55jhrs5s2";
          };
        }

        # https://github.com/franciscolourenco/done
        #
        # Requires:
        #   * https://github.com/fishpkg/fish-humanize-duration
        #     * It's a single file & function
        #     * The plugin magic won't install it correctly.
        {
          name = "done";
          src = pkgs.fetchFromGitHub {
            owner = "franciscolourenco";
            repo = "done";
            rev = "f7886fdc26cd849ddf21fb05d516548914dd060a";  # master on 2021-02-09. Updated on 2021-01-24
            sha256 = "1i7k59kjik41b7mww6d1qbi66vswplmvjdscinyf60irbrsbc5bv";
          };
        }

        # https://github.com/laughedelic/pisces
        {
          name = "pisces";
          src = pkgs.fetchFromGitHub {
            owner = "laughedelic";
            repo = "pisces";
            rev = "e45e0869855d089ba1e628b6248434b2dfa709c4";  # master on 2021-02-09. Updated on 2020-11-30
            sha256 = "0lhfqyq1gbcwidcpdybbsbhq6nqv081mcvhl6ilsi8sld7303ibq";
          };
        }

        # https://github.com/gyakovlev/fish-fzy
        # {
        #   name = "fish-fzy";
        #   src = pkgs.fetchFromGitHub {
        #     owner = "gyakovlev";
        #     repo = "fish-fzy";
        #     rev = "1d5f9221b5a5a096e9282da1a3f1aac5bef01824";
        #     sha256 = "0xx1np6f975v6ird9znplsnj4n0dnfw4ykha2848a6mglh4w40dm";
        #   };
        # }

        # https://github.com/b4b4r07/enhancd
        # NOTE: enhancd needs non-fish files from  lib/ and src/ too
        # {
        #   name = "enhancd";
        #   src = pkgs.fetchFromGitHub {
        #     owner = "b4b4r07";
        #     repo = "enhancd";
        #     rev = "f0f894029d12eecdc36c212fa3ad14f55468d1b7";
        #     sha256 = "1qk2fa33jn4j3xxaljmm11d6rbng6d5gglrhwavb72jib4vmkwyb";
        #   };
        # }
      ];
    };
    tmux = {
      enable = true;
      keyMode = "vi";
      escapeTime = 0;
      clock24 = true;
      extraConfig = ''
        source-file ~/.config/tmux/base
      '';
      # plugins = [
      #   {
      #     plugin = "";
      #   }
      # ];
    };
    starship = {
      enable = true;
      settings = {
        add_newline = true;
        character.symbol = "❯\n";

        crystal.disabled = false;
        dotnet.disabled = false;
        elixir.disabled = false;
        elm.disabled = false;
        erlang.disabled = false;
        java.disabled = false;
        julia.disabled = false;
        nodejs.disabled = false;
        php.disabled = false;

        aws.disabled = false;
        conda.disabled = false;

        directory = {
          fish_style_pwd_dir_length = 1;
          truncation_length = 4;
        };
        git_branch = {
          format = "[$symbol $branch]($style) ";
          symbol = "";
        };

        cmd_duration = {
          format = " ⏳[$duration]($style)";
          show_milliseconds = true;

          min_time = 500;  # 500ms
          # Notifications
          show_notifications = true;
          min_time_to_notify = 5000;  # 5s
        };
        time = {
          disabled = false;
          format = "[$time]($style)";
          time_format = "%F %a 🕙 %T ";
        };


        # 2020-11-03 Tue 🕙 22:21:33  ⏳23s99ms
        # /a/b/c/one/two/three/four  master [✘!] ❯
        # echo "aoeu"
        format = builtins.concatStringsSep "" [
          "$jobs"
          "$battery"
          "$time"
          "$cmd_duration"

          "$line_break"

          "$username"
          "$hostname"

          "$directory"

          # "kubernetes"
          "$git_branch"
          "$git_commit"
          "$git_state"
          "$git_status"
          "$hg_branch"
          # "$docker_context"
          "$package"

          "$golang"
          "$haskell"
          "$python"
          "$ruby"
          "$rust"

          "$terraform"
          "$nix_shell"
          "$memory_usage"
          # "$env_var"

          "$character"
          "\n\n"
        ];
      };
    };

    bat.enable = true;
    broot.enable = true;
    skim.enable = true;
  };

  home = {
    packages = with pkgs; [
      # Terminal
      alacritty
      konsole
      yakuake
      # Fonts
      powerline-fonts

      # Shells
      # fish  # (Using programs.fish)
      nushell

      # Fancy stuff
      libnotify
      neofetch
      fortune

      # Navigation
      exa
      ripgrep
      fd
      tokei

      # Documentation
      manix

      # Tools
      dust
      hyperfine
      bottom
      tealdeer
      bandwhich
    ];

    file = {

      ".config/tmux/tpm".source = fetchFromGitHub {
         owner = "tmux-plugins";
         repo = "tpm";
         rev = "59f78857f656afd462d7bc99b31cc8cc36c1872c";
         sha256 = "04v5zmwdxldj7mc5x36a32a7addz40is9kdilvshdf5slighyj2z";
      };

      # ".config/fish/conf.d/fzy-key_bindings.fish" = {
      #   # https://github.com/gyakovlev/fish-fzy/blob/master/key_bindings.fish
      #   text = ''
      #     # Default bindings:
      #     #   bind \cr 'fzy_select_history (commandline -b)'
      #     #   bind \cf 'fzy_select_directory'
      #   '';
      # };
    };
  };
}
