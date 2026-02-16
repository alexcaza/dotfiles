{
  programs.git = {
    enable = true;

    lfs.enable = true;

    aliases = {
      gone = "!git fetch -p && \
              git for-each-ref --format '%(refname:short) %(upstream:track)' | \
              awk '$2 == \"[gone]\" {print $1}' | \
              xargs -r git branch -D";
    };

    extraConfig = {
      user = {
        name = "Alex Caza";
        email = "alex@alexcaza.com";
        signingkey = "9CEED67B704952E8";
      };

      init.defaultbranch = "main";

      github.user = "alexcaza";
      hf.user = "alex@alexcaza.com";

      push = {
        autosetupremote = true;
        default = "current";
      };
      pull = {
        rebase = true;
      };
      commit = {
        gpgsign = true;
      };
      fetch = {
        prune = true;
      };
      core = {
        pager = "delta";
      };
    };

    ignores = [
      ".zed"
      ".jj"
      ".helix/"
      ".trash/"
      ".obsidian/"
      ".DS_Store"
      ".envrc"
      ".direnv"
    ];
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Alex Caza";
        email = "alex@alexcaza.com";
      };

      ui = {
        editor = "zeditor --wait";
      };

      signing = {
        sign-all = true;
        backend = "gpg";
        key = "9CEED67B704952E8";
      };
    };
  };

  programs.lazygit = {
    enable = true;

    settings = {
      git.overrideGpg = true;
      git.pagers = [
        {
          colorArg = "always";
          pager = "delta --dark --paging=never --side-by-side";
        }
      ];
    };
  };
}
