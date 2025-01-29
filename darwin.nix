{pkgs, ...}: {
  # This is required since setting home in ./home.nix doesn't work. Revisit.
  users.users.alexcaza.home = "/Users/alexcaza";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.vim
  ];

  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";
    onActivation.upgrade = true;
    onActivation.autoUpdate = true;

    taps = [];
    brews = [
    # RPI Zero builds
    # "arm-linux-gnueabihf-binutils" 

    # Work
    "vips" # For use with API
    ];
    casks = [
      "stats"
      # "raycast"
      # "brave-browser"
      # "proton-pass"
      # "proton-mail"
      # "obsidian"
      # "spotify"
      # "dbeaver-community"
    ];
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh = {
    # All other config in home/shell.nix
    enable = true; # default shell on catalina
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
