{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      github = {
        host = "github.com";
        identityFile = "~/.ssh/github_ssh";
        addKeysToAgent = "yes";
      };
      gitlab = {
        host = "gitlab.com";
        identityFile = "~/.ssh/gitlab_ssh";
        addKeysToAgent = "yes";
      };
      huggingface = {
        host = "huggingface.co";
        identityFile = "~/.ssh/huggingface";
        addKeysToAgent = "yes";
      };
      hf = {
        host = "hf.co";
        identityFile = "~/.ssh/huggingface";
        addKeysToAgent = "yes";
      };
    };
  };
}
