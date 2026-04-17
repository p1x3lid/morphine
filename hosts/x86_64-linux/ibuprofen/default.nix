{inputs, ...}: let
  sharedVars = import ../../../vars.nix;
  hostVars = import ./vars.nix;
  myvars = sharedVars // hostVars; # host values override shared ones
in
  inputs.nixpkgs.lib.nixosSystem {
    system = myvars.platform;

    specialArgs = {inherit inputs myvars;};

    modules = [
      inputs.determinate.nixosModules.default

      ./boot
      ./networking

      ./hardware.nix
      ./filesystems.nix
      ./virtualisation.nix
      ../../../modules/nixos/default.nix

      inputs.home-manager.nixosModules.default
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {inherit inputs myvars;};
          users.${myvars.username} = ./home.nix;
          backupFileExtension = "hmbackup";
        };
      }
      inputs.niri-flake.nixosModules.niri

      # allow unfree per-host (moves it out of flake.nix)
      {nixpkgs.config.allowUnfree = true;}
    ];
  }
