{
  description = "Morphine NixOS Flake";

  # inputs: external flakes this flake depends on
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";

    determinate.url = "github:DeterminateSystems/determinate";

    affinity-nix.url = "github:mrshmllow/affinity-nix";
  };

  # Flake ooutputs
  outputs = {
    self,
    nixpkgs,
    determinate,
    home-manager,
    ...
  } @ inputs: let
    myvars = import ./vars.nix;
  in {
    nixosConfigurations.${myvars.hostname} = inputs.nixpkgs.lib.nixosSystem {
      system = myvars.system;

      modules = [
        # Load determinate module, which provides Determinate Nix
        inputs.determinate.nixosModules.default

        ./modules/nixos/default.nix # main system config

        home-manager.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            extraSpecialArgs = {
              inherit
                myvars
                inputs
                ;
            };

            users.${myvars.username} = ./home/home.nix;

            backupFileExtension = "hmbackup";
            backupCommand = ''
              # $from = original file, $to = destination path home-manager intends to create
              backup_dir="$HOME/.hm-backup"
              mkdir -p "$backup_dir"

              # If destination already exists, move it to backup_dir with timestamp
              if [ -e "$to" ]; then
                ts=$(date +%Y%m%d-%H%M%S)
                base=$(basename "$to")
                mv -v "$to" "$backup_dir/$base.old.$ts"
              fi

              # Ensure parent for $to exists, then move $from to $to
              mkdir -p "$(dirname "$to")"
              mv -v "$from" "$to"

              # Also copy the created backup into backup_dir for long-term storage
              base=$(basename "$to")
              cp -a "$to" "$backup_dir/$base.$ts"
            '';
          };
        }
      ];

      specialArgs = {
        inherit
          myvars
          inputs
          ;
      };

      pkgs = import inputs.nixpkgs {
        system = myvars.system;
        config = {
          allowUnfree = true;
        };
      };
    };
  };
}
