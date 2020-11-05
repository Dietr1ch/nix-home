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

        e = "emacsclient -c -nw";
        ec = "emacsclient";
        ee = "emacsclient -c";
        em = "emacs";
        v = "vim";
        n = "nvim";

        g = "git";
        gCL = "git clone";
        gPP = "git push --force-with-lease";
        gR = "git remote";
        ga = "git add";
        gb = "git branch";
        gbl = "git blame";
        gc = "git commit";
        gcl = "git clone --recursive";
        gco = "git checkout";
        gcp = "git cherry-pick";
        gd = "git diff";
        gdc = "git diff --cached";
        gds = "git diff --stat";
        gdw = "git diff --ignore-all-space";
        gf = "git fetch";
        gfa = "git fetch --all";
        gl = "git l";
        gla = "git la";
        gll = "git ll";
        glla = "git lla";
        gm = "git merge";
        gp = "git pull";
        gpp = "git push";
        gr = "git rebase -i";
        gra = "git rebase --abort";
        grc = "git rebase --continue";
        grm = "git rm --cached";
        gs = "git status";
        gss = "git status .";
        gst = "git stash";

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
            rev = "13c424efb73b153d9b8ad92916cf51159d44099d";
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
            rev = "b520072db3d0e56c6da7163b1455629e7d16d57a";
            sha256 = "075i3sa8zr2akb8x79srgrr3q057ca8x9irp5g5wwq40yrqf7nk6";
          };
        }

        # https://github.com/gazorby/fish-abbreviation-tips
        {
          name = "fish-abbreviation-tips";
          src = pkgs.fetchFromGitHub {
            owner = "gazorby";
            repo = "fish-abbreviation-tips";
            rev = "b3d0c01f4cab9b91eeaeead147a3593793d22fe5";
            sha256 = "1r4ywmrs5sjm5rzv3fq3vi9k7nx6rin5hw3jqylbfmgsimsd1j8r";
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
            rev = "4503af92f5425b4169d3915f7c9297437f42bfe1";
            sha256 = "0blw12azcq8f5fd26lyfd6bshg60b1ra9ldcpmb8jk7c7ban7ynp";
          };
        }

        # https://github.com/laughedelic/pisces
        {
          name = "pisces";
          src = pkgs.fetchFromGitHub {
            owner = "laughedelic";
            repo = "pisces";
            rev = "1b299fe6839361fdaa7c0ed6a42ae14fefc50ff6";
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
