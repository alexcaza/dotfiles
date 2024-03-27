{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
  } @ inputs: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Countess-Sparkles
    darwinConfigurations."Countess-Sparkles" = nix-darwin.lib.darwinSystem {
      modules = [
        home-manager.darwinModules.home-manager
        {
          nixpkgs.overlays = [
            (self: super: let
              src = super.fetchFromGitHub {
                owner = "alexcaza";
                repo = "weztermocil";
                rev = "v0.1.2";
                hash = "sha256-tHftuC/cDkYXo0poTu7/sK4mRuPrzeqB4QCV6fJMVHI=";
              };
            in {
              weztermocil = super.callPackage src {};
            })
          ];
          users.users.alexcaza.home = "/Users/alexcaza";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.alexcaza = {
            imports = [
              ./home.nix
            ];
          };
        }
        ./darwin.nix
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Countess-Sparkles".pkgs;
  };
}
