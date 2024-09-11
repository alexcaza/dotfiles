{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";

    matchBlocks = {
      github = {
        host = "github.com";
        identityFile = "~/.ssh/github_ssh";
      };
      gitlab = {
        host = "gitlab.com";
        identityFile = "~/.ssh/gitlab_ssh";
      };
      huggingface = {
        host = "huggingface.co";
        identityFile = "~/.ssh/huggingface";
      };
      hf = {
        host = "hf.co";
        identityFile = "~/.ssh/huggingface";
      };
    };
  };
}
