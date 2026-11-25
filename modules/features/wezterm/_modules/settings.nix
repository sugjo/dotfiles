{ lib, ... }:
let
  raw = (import ./dsp.nix { inherit lib; }).raw;
in
{
  wezterm.settings = {
    default_prog = [ "fish" "-l" ];

    font = raw ''
      wezterm.font_with_fallback {
        {
          family = "GeistMono Nerd Font",
          weight = 500,
          stretch = "Normal",
          style = "Normal",
          harfbuzz_features = { "calt", "liga", "zero", "ss01", "ss02", "ss03" },
        },
        "Noto Color Emoji",
      }
    '';

    freetype_load_target = "HorizontalLcd";

    font_size = 16.5;
    line_height = 0.85;
    cell_width = 1;

    window_close_confirmation = "NeverPrompt";
    window_padding = {
      left = 0;
      right = 0;
      top = 0;
      bottom = 0;
    };
    window_content_alignment = {
      horizontal = "Center";
      vertical = "Top";
    };
    max_fps = 120;

    unix_domains = [ { name = "unix"; } ];
    default_gui_startup_args = [ "connect" "unix" ];

    use_fancy_tab_bar = false;
    tab_bar_at_bottom = false;
    show_new_tab_button_in_tab_bar = false;
    tab_max_width = 32;

    leader = {
      key = "Space";
      mods = "ALT";
      timeout_milliseconds = 1000;
    };
  };
}
