{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "github.com" = {
        IdentityFile = "~/.ssh/github_ssh";
        AddKeysToAgent = "yes";
      };
      "gitlab.com" = {
        IdentityFile = "~/.ssh/gitlab_ssh";
        AddKeysToAgent = "yes";
      };
      "huggingface.co" = {
        IdentityFile = "~/.ssh/huggingface";
        AddKeysToAgent = "yes";
      };
      "hf.co" = {
        IdentityFile = "~/.ssh/huggingface";
        AddKeysToAgent = "yes";
      };
    };
  };
}
