{ config, pkgs, ... }:

let
  containeriseConfig = ''
    !*.google.com , Google
    !*.youtube.com , Google
    gmail.com , Google

    !*.uc.cl , UC

    !*.wikipedia.org , Wikipedia

    smile.amazon.com, Amazon
    www.amazon.com, Amazon
    !*.bestbuy.com, BestBuy

    !*.pcpartpicker.com, PCPartPicker
    !*.wizards.com, MTG
    !*.spelltable.com, MTG
    !*.tcgplayer.com, MTG
    !*.moxfield.com, MTG
    !*.cardkingdom.com, MTG
    !*.edhrec.com, MTG
    !*.chess.com, Chess
    !*.lichess.org, Chess

    !*.aa.com, AA
    !*.united.com, United
    !*.airbnb.com , AirBnB

    !*.github.com , Github
    !*.dropbox.com , Dropbox

    !*.reddit.com , Reddit
    !*.ycombinator.com , HackerNews
    !*.facebook.com , Facebook
    !*.instagram.com , Facebook
    !*.whatsapp.com , Facebook
    !*.twitter.com , Twitter
    !*.linkedin.com , LinkedIn

    !*.stackoverflow.com , StackOverflow
    !*.stackexchange.com , StackOverflow
    !*.mathstack.com , StackOverflow
    !*.serverfault.com , StackOverflow

    !*.schwab.com , Schwab
    !*.morganstanley.com , MorganStanley
    !*.vanguard.com , Vanguard
    !*.bankofamerica.com , BoA
    !*.bankofthewest.com , BotW
    !*.chase.com , Chase
    !*.sfcu.org , SFCU
    !*.wellsfargo.com , WF
    !*.santander.cl , Santander
    !*.bancochile.cl , BChile
    !*.bancoestado.cl , BEstado
    !*.bci.cl , BCI
    !*.kraken.com , ExKraken

    !*.steampowered.com , Steam
    !*.gog.com , GOG

    !*.thepiratebay.org , Torrents
    !*.torrentday.com , Torrents

    !*.musicbrainz.org , MusicBrainz

    !*.nixos.org , NixOS
    !*.nixos.wiki , NixOS

    !*.firefox.com , Firefox

    !*.tailscale.com , Tailscale
    !*.zerotier.com , ZeroTier

    !*.manning.com , Manning

    !*.roll20.net , DND
  '';

  niceUserStyles = ''
    https://userstyles.org/styles/22794/a-dark-hacker-news
  '';
in
{
  programs = {
    firefox = {
      enable = true;
      package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
        forceWayland = true;
        extraPolicies = {
          ExtensionSettings = {};
        };
      };
    };

    # qutebrowser.enable = true;
    chromium.enable = true;
  };
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
  };
}
