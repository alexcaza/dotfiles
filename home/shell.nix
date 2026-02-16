{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "darwin-rebuild switch --flake ~/.config/nix-darwin";
      lg = "lazygit";
      lj = "lazyjj";
      gcub = "git fetch --prune && git branch -vv | awk '/: gone]/ {print $1}' | xargs git branch -D";
      love = "/Applications/love.app/Contents/MacOS/love";
      zd = "zeditor";
    };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "z"
        "direnv"
      ];
    };

    # Required to get homebrew to work
    # Also have to add zed here since home manager
    # configs don't have support for setting defaultEditor yet.
    initContent = lib.mkBefore ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
      compctl -g '~/.weztermocil/*(:t:r)' weztermocil

      VISUAL="zeditor --wait"
      EDITOR="zeditor --wait"
    '';
  };

  programs.direnv = {
    enable = true;
    # Avoid cluttering project directories which often conflicts with tooling,
    # as per: https://github.com/direnv/direnv/wiki/Customizing-cache-location
    # Pulled from : https://github.com/samhh/dotfiles/blob/42b7fb81702710bfe4f8200ee05bb536c0a2c3ef/home/shell.nix#L81-L93
    stdlib = ''
      : ''${XDG_CACHE_HOME:=$HOME/.cache}
      declare -A direnv_layout_dirs
      direnv_layout_dir() {
      	echo "''${direnv_layout_dirs[$PWD]:=$(
      		echo -n "$XDG_CACHE_HOME"/direnv/layouts/
      		echo -n "$PWD" | ${pkgs.coreutils}/bin/sha1sum | cut -d ' ' -f 1
      	)}"
      }
    '';
  };

  programs.starship = {
    enable = true;
  };
}
