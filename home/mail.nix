{ config, pkgs, ... }:

{
  accounts = {
  #   email = {
  #     accounts = [
  #       "Dietrich.Daroch@gmail.com"
  #       "ddaroch@uc.com"
  #       "ddaroch@google.com"
  #     ];
  #   };
  };

  home = {
    packages = with pkgs; [
      gmailctl
      jsonnet
    ];
  };
}
