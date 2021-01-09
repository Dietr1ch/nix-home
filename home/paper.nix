{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      skanlite
    ];
  };
}
