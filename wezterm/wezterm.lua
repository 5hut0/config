local wezterm = require("wezterm")

local config = {
    check_for_updates = true,
    use_ime = true,
    audible_bell="Disabled",
    default_prog = { '/opt/homebrew/bin/fish', '-l' },

    enable_tab_bar=false,
    hide_tab_bar_if_only_one_tab=true,

    bold_brightens_ansi_colors = false,
    window_background_opacity = 0.98,

    colors = {
        background = "#002b36",
        foreground = "#839496",

        cursor_bg = "#268bd2",
        cursor_fg = "#002b36",
        cursor_border = "#268bd2",

        selection_bg = "#268bd2",
        selection_fg = "#002b36",

        ansi = {"#073642","#dc322f","#859900","#b58900","#268bd2","#d33682","#2aa198","#eee8d5"},
        brights = {"#002b36","#cb4b16","#586e75","#657b83","#839496","#6c71c4","#93a1a1","#fdf6e3"},

        scrollbar_thumb = "#222222",
        split = "#073642",
    },

    inactive_pane_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 0.6,
    },
    foreground_text_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 1.5,
    },

    font = wezterm.font("Cica"),
    font_size = 16.0,
    font_antialias = "Greyscale",
    font_hinting = "None",
    dpi=96.0,

    window_close_confirmation="NeverPrompt",
    window_decorations="RESIZE",
    window_padding = {
        left = 40,
        right = 40,
        top = 20,
        bottom = 20,
    },

    -- launch_menu = {},
    leader = { key="g", mods="CTRL" },
    keys = {
        -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
        { key = "s", mods = "LEADER", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        { key = "v", mods = "LEADER", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        { key = "z", mods = "LEADER", action="TogglePaneZoomState" },
        { key = "h", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Left"}},
        { key = "j", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Down"}},
        { key = "k", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Up"}},
        { key = "l", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Right"}},
        { key = "h", mods = "OPT", action=wezterm.action{ActivatePaneDirection="Left"}},
        { key = "j", mods = "OPT", action=wezterm.action{ActivatePaneDirection="Down"}},
        { key = "k", mods = "OPT", action=wezterm.action{ActivatePaneDirection="Up"}},
        { key = "l", mods = "OPT", action=wezterm.action{ActivatePaneDirection="Right"}},
        { key = "f", mods = "SHIFT|CTRL", action="ToggleFullScreen"},
    },
}

return config
