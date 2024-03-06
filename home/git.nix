{
  programs.git = {
    enable = true;

    extraConfig = {
      user = {
        name = "Alex Caza";
        email = "alex@alexcaza.com";
      };

      init.defaultbranch = "main";

      github.user = "alexcaza";

      push = {
        autosetupremote = true;
        default = "current";
      };
    };

    ignores = [
      ".helix/"
      ".trash/"
      ".obsidian/"
      ".DS_Store"
      ".envrc"
      ".direnv"
    ];
  };
}
