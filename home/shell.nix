{config, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "darwin-rebuild switch --flake ~/.config/nix-darwin";
      lg = "lazygit";
      gui = "gitui";
      gcub = "git fetch --prune && git branch -vv | awk '/: gone]/ {print $1}' | xargs git branch -D";
      love = "/Applications/love.app/Contents/MacOS/love";
    };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = ["git" "z" "direnv"];
    };

    # Required to get homebrew to work
    initExtraFirst = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
      compctl -g '~/.weztermocil/*(:t:r)' weztermocil
    '';
  };

  programs.starship = {
    enable = true;
  };
}
