{ config, pkgs, ... }:

{
  home = {
    keyboard = {
      layout = "us";
      variant = "dvp";
      options = [
        "compose:ralt"
        "caps:ctrl_modifier"
        "grp_led:caps"
      ];
    };
  };

  services = {
    xcape = {
      enable = false;
      mapExpression = {
        Shift_L = "Escape";
        Shift_R = "Escape";
      };
    };
  };
}
