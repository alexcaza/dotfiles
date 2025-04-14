{...}: {
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh = {
    # All other config in home/shell.nix
    enable = true; # default shell on catalina
  };

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  home-manager.backupFileExtension = "bak";
}
