{
  description = "Morphine NixOS Flake";

  # inputs: external flakes this flake depends on
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";

    determinate.url = "github:DeterminateSystems/determinate";

    affinity-nix.url = "github:mrshmllow/affinity-nix";

    alejandra.url = "github:kamadorueda/alejandra";
  };

  # Flake ooutputs
  outputs = {
    self,
    nixpkgs,
    determinate,
    home-manager,
    alejandra,
    ...
  } @ inputs: let
    username = "pixel";
    system = "x86_64-linux";
    hostname = "morphine";
  in {
    nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      # NixOS modules
      modules = [
        # Load determinate module, which provides Determinate Nix
        inputs.determinate.nixosModules.default

        ./modules/cache.nix # cache files
        ./modules/nixos/default.nix # main system config

        home-manager.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            extraSpecialArgs = {
              inherit
                system
                username
                hostname
                inputs
                ;
            };

            users.${username} = ./modules/home-manager/default.nix;

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
          system
          hostname
          username
          inputs
          ;
      };

      pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    };

    formatter.${system} = alejandra.defaultPackage.${system};
  };
}
