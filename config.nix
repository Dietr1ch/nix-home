let
  unstableTarball = fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixpkgs-unstable.tar.gz";
in
{
  allowUnfree = true;

  permittedInsecurePackages = [
    "p7zip-16.02"  # Required for Lutris
  ];

  firefox = {
    enablePlasmaBrowserIntegration = true;
  };

  packageOverrides = pkgs: rec {
    unstable = import unstableTarball { };
    obs = pkgs.buildEnv {
      name = "obs settings unstable";
      paths = [ unstable.obs-studio ];
    };
  };
}
