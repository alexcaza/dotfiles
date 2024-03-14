{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "github_light_high_contrast";
      editor = {
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "block";
        };
        rulers = [80];
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };
      keys = let
        movement = {
          "{" = "goto_prev_paragraph";
          "}" = "goto_next_paragraph";
        };
      in {
        normal =
          movement
          // {
            space = {
              z = ":fmt";
            };
          };
        select = movement;
      };
    };

    languages = {
      language-server = {
        typescript-language-server = {
          command = "typescript-language-server";
          args = ["--stdio"];
          config.hostInfo = "helix";
        };
        gopls = {
          command = "gopls";
          config = {
            "gofumpt" = true;
            "local" = "goimports";
            "staticcheck" = true;
          };
        };
        nil = {
          command = "nil";
        };
        alejandra = {
          command = "alejandra";
          args = ["-qq" "-"];
        };
        rust-analyzer = {
          command = "rust-analyzer";
          config.checkOnSave.command = ["clippy" "check"];
          checkOnSave.enabled = true;
        };
      };

      language = [
        {
          name = "typescript";
          language-servers = ["typescript-language-server"];
        }
        {
          name = "go";
          language-servers = ["gopls"];
          auto-format = true;
        }
        {
          name = "nix";
          language-servers = ["nil" "alejandra"];
          auto-format = true;
        }
        {
          name = "rust";
          language-servers = ["rust-analyzer"];
          auto-format = true;
        }
      ];
    };
  };
}
