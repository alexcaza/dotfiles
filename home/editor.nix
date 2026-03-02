{
  inputs,
  pkgs,
  ...
}:
{
  programs.zed-editor = {
    enable = true;
    installRemoteServer = true;
    package = inputs.zed.packages.${pkgs.system}.default.overrideAttrs (oldAttrs: {
      doCheck = false;
    });

    extensions = [
      "biome"
      "html"
      "dockerfile"
      "docker-compose"
      "nix"
      "sql"
      "emmet"
      "lua"
      "ruby"
      "astro"
      "nginx"
      "templ"
      "caddyfile"
      "justfile"
      "catppuccin"
      "zig"
      "css"
      "css-modules-kit"
      "tsgo"
      "oxc"
      "mcp-server-context7"
      # For legacy projects
      "scss"
      "just"
    ];

    userSettings = {
      features = {
        "edit_prediction_provider" = "supermaven";
        "inline_prediction_provider" = "supermaven";
      };
      colorize_brackets = true;
      show_edit_predictions = true;
      assistant = {
        default_model = {
          provider = "google";
          model = "gemini-2.0-pro-exp";
        };
        version = "2";
      };

      base_keymap = "VSCode";

      vim_mode = true;

      theme = {
        mode = "system";
        light = "Catppuccin Latte";
        dark = "Catppuccin Frappé";
      };
    };

    userKeymaps = [
      {
        context = "Editor";
        bindings = {
          "alt-o" = "vim::SelectLargerSyntaxNode";
          "alt-i" = "vim::SelectSmallerSyntaxNode";
          "ctrl-x" = "editor::ShowCompletions";
        };
      }
      {
        context = "vim_mode == visual";
        bindings = {
          "shift-s" = "vim::PushAddSurrounds";
        };
      }
    ];
  };

  # Keeping for history sake and the occasional time I need to quickly open a file
  programs.helix = {
    enable = true;

    settings = {
      theme = "github_light_high_contrast";
      editor = {
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "block";
        };
        rulers = [ 80 ];
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };
      keys =
        let
          movement = {
            "{" = "goto_prev_paragraph";
            "}" = "goto_next_paragraph";
          };
        in
        {
          normal = movement // {
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
          args = [ "--stdio" ];
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
          args = [
            "-qq"
            "-"
          ];
        };
        rust-analyzer = {
          command = "rust-analyzer";
          config.checkOnSave.command = [
            "clippy"
            "check"
          ];
          checkOnSave.enabled = true;
        };
        clojure = {
          command = "clojure-lsp";
        };
      };

      language = [
        {
          name = "typescript";
          language-servers = [ "typescript-language-server" ];
        }
        {
          name = "go";
          language-servers = [ "gopls" ];
          auto-format = true;
        }
        {
          name = "nix";
          language-servers = [
            "nil"
            "alejandra"
          ];
          auto-format = true;
        }
        {
          name = "rust";
          language-servers = [ "rust-analyzer" ];
          auto-format = true;
        }
        {
          name = "clojure";
          language-servers = [ "clojure" ];
          auto-format = true;
        }
        {
          name = "css";
          language-servers = [ "vtsls" ];
        }
      ];
    };
  };
}
