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

  programs.gitui = {
    enable = true;
    theme = "
    (
      selected_tab: Some(Reset),
      command_fg: Some(Rgb(76, 79, 105)),
      selection_bg: Some(Rgb(172, 176, 190)),
      selection_fg: Some(Rgb(76, 79, 105)),
      cmdbar_bg: Some(Rgb(230, 233, 239)),
      cmdbar_extra_lines_bg: Some(Rgb(230, 233, 239)),
      disabled_fg: Some(Rgb(140, 143, 161)),
      diff_line_add: Some(Rgb(64, 160, 43)),
      diff_line_delete: Some(Rgb(210, 15, 57)),
      diff_file_added: Some(Rgb(223, 142, 29)),
      diff_file_removed: Some(Rgb(230, 69, 83)),
      diff_file_moved: Some(Rgb(136, 57, 239)),
      diff_file_modified: Some(Rgb(254, 100, 11)),
      commit_hash: Some(Rgb(114, 135, 253)),
      commit_time: Some(Rgb(92, 95, 119)),
      commit_author: Some(Rgb(32, 159, 181)),
      danger_fg: Some(Rgb(210, 15, 57)),
      push_gauge_bg: Some(Rgb(30, 102, 245)),
      push_gauge_fg: Some(Rgb(239, 241, 245)),
      tag_fg: Some(Rgb(220, 138, 120)),
      branch_fg: Some(Rgb(23, 146, 153))
    )
    ";
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
      git.paging = {
        colorArg = "always";
        pager = "delta --dark --paging=never --side-by-side";
      };
    };
  };
}
