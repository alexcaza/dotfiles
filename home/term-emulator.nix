{
  pkgs,
  lib,
  ...
}: {
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = "
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Latte'
config.font_size = 16
config.font = wezterm.font 'CommitMono'
config.keys = {
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane {confirm = true}
    },
    {
        key = 'W',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentTab {confirm = true}
    },
    {
        key = 'd',
        mods = 'CMD',
        action = wezterm.action.SplitHorizontal
    },
    {
        key = 'D',
        mods = 'CMD',
        action = wezterm.action.SplitVertical 
    },
}
config.inactive_pane_hsb = {
    brightness = 0.9,
    saturation = 0.8
}

-- Hack needed to get latest Wezterm working
config.front_end = 'WebGpu'

-- and finally, return the configuration to wezterm
return config
";
  };

  # Ghostty is installed outside of nix. It's currently unsupported via nix on macOS
  # It's installed via nix-darwin
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    package = pkgs.emptyDirectory;

    settings = {
      cursor-style-blink = false;
      cursor-style = "block";
      font-family = "CommitMono";
      font-size = 16;
      font-feature = "+liga";
      window-padding-x = 8;
      window-padding-y = 8;

      # catppuccin currently only supports one universal theme:
      #   https://github.com/catppuccin/nix/issues/420
      theme = lib.mkForce "light:catppuccin-latte,dark:catppuccin-mocha";
    };
  };
}
