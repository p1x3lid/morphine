{inputs, ...}: let
  sharedVars = import ../../../vars.nix;
  hostVars   = import ./vars.nix;
  myvars     = sharedVars // hostVars;
in
  inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs {
      system = myvars.platform;
      config.allowUnfree = true;
    };
    extraSpecialArgs = {inherit inputs myvars;};
    modules = [
      ./home.nix
    ];
  }
