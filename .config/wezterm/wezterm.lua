local wezterm = require 'wezterm';
local act = wezterm.action

return {
  -- https://wezfurlong.org/wezterm/config/lua/config/index.html

  -- cf. https://github.com/wez/wezterm/issues/2756
  front_end = "WebGpu",

  -- font
  font = wezterm.font("Utatane", {weight="Bold"}),
  font_size = 15.0,
  use_ime = true,
  adjust_window_size_when_changing_font_size = false,
  tab_and_split_indices_are_zero_based = true,

  set_environment_variables = {
    -- This changes the default prompt for cmd.exe to report the
    -- current directory using OSC 7, show the current time and
    -- the current directory colored in the prompt.
    LANG = "ja_JP.UTF-8",
    LC_CTYPE = "ja_JP.UTF-8"
  },

  -- https://wezfurlong.org/wezterm/colorschemes/index.html
  color_scheme = "iceberg-dark",
  inactive_pane_hsb = {
    saturation = 0.4,
    brightness = 0.3,
  },
  tab_bar_at_bottom = true,

  wezterm.on('update-right-status', function(window, pane)
    window:set_right_status(wezterm.format {
        {Text = '[ ' .. window:active_workspace() .. ' ] '},
    })
  end),

  -- shortcut
  leader = { key="a", mods="CTRL", timeout_milliseconds=1000},
  keys = {
    {key = 'Tab', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment},
    {key = "r", mods = "LEADER|SHIFT", action = "ReloadConfiguration"},
    {key = "c", mods = "LEADER", action = act{SpawnTab = "CurrentPaneDomain"}},
    {key = "0", mods = "LEADER", action = act{ActivateTab = 0}},
    {key = "1", mods = "LEADER", action = act{ActivateTab = 1}},
    {key = "2", mods = "LEADER", action = act{ActivateTab = 2}},
    {key = "3", mods = "LEADER", action = act{ActivateTab = 3}},
    {key = "4", mods = "LEADER", action = act{ActivateTab = 4}},
    {key = "5", mods = "LEADER", action = act{ActivateTab = 5}},
    {key = "6", mods = "LEADER", action = act{ActivateTab = 6}},
    {key = "7", mods = "LEADER", action = act{ActivateTab = 7}},
    {key = "8", mods = "LEADER", action = act{ActivateTab = 8}},
    {key = "9", mods = "LEADER", action = act{ActivateTab = 9}},
    {key = "j", mods = "LEADER|SHIFT", action = act{ActivateTabRelative = 1}},
    {key = "k", mods = "LEADER|SHIFT", action = act{ActivateTabRelative = -1}},

    {key = "\"", mods = "LEADER", action = act{SplitVertical = {domain = "CurrentPaneDomain"}}},
    {key = "%", mods = "LEADER", action = act{SplitHorizontal = {domain = "CurrentPaneDomain"}}},
    {key = "z", mods = "LEADER", action = "TogglePaneZoomState"},
    {key = "h", mods = "LEADER", action = act{ActivatePaneDirection = "Left"}},
    {key = "l", mods = "LEADER", action = act{ActivatePaneDirection = "Right"}},
    {key = "j", mods = "LEADER", action = act{ActivatePaneDirection = "Down"}},
    {key = "k", mods = "LEADER", action = act{ActivatePaneDirection = "Up"}},

    {key = "[", mods = "LEADER", action = "ActivateCopyMode"},

    {key = "RightArrow", mods = "CTRL|SHIFT", action = act{AdjustPaneSize = {"Right", 5}}},
    {key = "LeftArrow", mods = "CTRL|SHIFT", action = act{AdjustPaneSize = {"Left", 5}}},
    {key = "DownArrow", mods = "CTRL|SHIFT", action = act{AdjustPaneSize = {"Down", 5}}},
    {key = "UpArrow", mods = "CTRL|SHIFT", action = act{AdjustPaneSize = {"Up", 5}}},

    {key = 'UpArrow', mods = 'SHIFT', action = act.ScrollToPrompt(-1)},
    {key = 'DownArrow', mods = 'SHIFT', action = act.ScrollToPrompt(1)},

    -- workspace
    {key = '!', mods = 'LEADER', action = act.SwitchToWorkspace {name = 'default'}},
    {key = '@', mods = 'LEADER', action = act.SwitchToWorkspace {name = 'private'}},
    {key = '#', mods = 'LEADER', action = act.SwitchToWorkspace {name = 'background'}},


    -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
    {key = "a", mods = "LEADER|CTRL", action = act{SendString="\x01"}},
  },

  key_tables = {
    copy_mode = {
      {key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close'},
      {key = 'q', mods = 'NONE', action = act.CopyMode 'Close'},

      {key = 'v', mods = 'NONE', action = act.CopyMode {SetSelectionMode = 'Cell'}},
      {key = 'v', mods = 'SHIFT', action = act.CopyMode {SetSelectionMode = 'Line'}},
      {key = 'Space', mods = 'NONE', action = act.CopyMode {SetSelectionMode = 'Cell'}},
      {key = 'Enter', mods = 'NONE', action = act.Multiple {{CopyTo = 'ClipboardAndPrimarySelection'}, {CopyMode = 'Close'}}},
      {key = 'y', mods = 'NONE', action = act.Multiple {{CopyTo = 'ClipboardAndPrimarySelection'}, {CopyMode = 'Close'}}},

      {key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft'},
      {key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown'},
      {key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp'},
      {key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight'},
      {key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine'},
      {key = '$', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent'},
      {key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord'},

      {key = 'u', mods = 'CTRL', action = act.CopyMode 'PageUp'},
      {key = 'd', mods = 'CTRL', action = act.CopyMode 'PageDown'},
    },
  },
}
