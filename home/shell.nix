{config, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "darwin-rebuild switch --flake ~/.config/nix-darwin";
      lg = "lazygit";
      gui = "gitui";
    };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = ["git" "z" "direnv"];
    };
  };

  programs.starship = {
    enable = true;
  };
}
