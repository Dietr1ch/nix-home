{ pkgs, ... }:

# https://nixos.wiki/wiki/Fonts
{
  fonts.fontconfig.enable = true;

  home = {
    packages = with pkgs; [
      powerline-fonts

      # https://www.nerdfonts.com/
      # https://discourse.nixos.org/t/home-manager-nerdfonts/11226/2
      (pkgs.nerdfonts.override {
        fonts = [
          "DroidSansMono"
          "FiraCode"
          "Hack"
          "RobotoMono"
          "Noto"
          "SourceCodePro"
        ];
      })

      emacs-all-the-icons-fonts
    ];
  };
}
