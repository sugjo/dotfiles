{ channel, choiceFile, colors, ... }:
{
  wezterm.hooks = ''
    local dotfiles = {
      channel = "${channel}",
      choiceFile = "${choiceFile}",
      stateDir = wezterm.home_dir .. "/.local/state/wezterm",
    };
    dotfiles.stateFile = dotfiles.stateDir .. "/sessions.tsv";

    config.window_background_gradient = {
      colors = { "${colors.base00}", "${colors.base00}" },
    };

    config.colors = {
      tab_bar = {
        background = "none",
        inactive_tab_edge = "none",
        active_tab = { bg_color = "none", fg_color = "${colors.base0A}" },
        inactive_tab = { bg_color = "none", fg_color = "${colors.base05}" },
        inactive_tab_hover = { bg_color = "none", fg_color = "${colors.base05}" },
        new_tab = { bg_color = "none", fg_color = "${colors.base05}" },
        new_tab_hover = { bg_color = "none", fg_color = "${colors.base05}" },
      },
    };

    local function read_state()
      local rows = {}
      local f = io.open(dotfiles.stateFile, 'r')
      if not f then return rows end
      for line in f:lines() do
        local name, path, epoch, current = line:match("^([^\t]+)\t([^\t]+)\t([^\t]+)\t([^\t]*)$")
        if name then
          rows[#rows + 1] = { name = name, path = path, epoch = tonumber(epoch) or 0, current = current }
        end
      end
      f:close()
      return rows
    end

    local function write_state(rows)
      os.execute("mkdir -p '" .. dotfiles.stateDir .. "'")
      local f = io.open(dotfiles.stateFile, 'w')
      if not f then return end
      for _, row in ipairs(rows) do
        if row.name and #row.name > 0 and not row.name:match("^%s") and not row.name:find("/", 1, true) then
          f:write(string.format("%s\t%s\t%d\t%s\n", row.name, row.path, row.epoch or 0, row.current or ""))
        end
      end
      f:close()
    end

    local function cwd_of(pane)
      local url = pane:get_current_working_dir()
      return url and url.file_path or wezterm.home_dir
    end

    local function tab_args(cwd, command)
      local f = io.open(cwd .. "/devenv.nix", 'r')
      if f then f:close() end
      local prefix = f and "devenv shell " or ""
      return { "fish", "-l", "-c", "clear; and exec " .. prefix .. command }
    end

    local function switch_project(window, pane, name, path)
      local exists = false
      for _, ws in ipairs(wezterm.mux.get_workspace_names()) do
        if ws == name then exists = true end
      end

      if not exists then
        local rows = read_state()
        local found = false
        for _, row in ipairs(rows) do
          if row.name == name then
            found = true
            row.path = path
          end
        end
        if not found then
          rows[#rows + 1] = { name = name, path = path, epoch = os.time(), current = "" }
        end
        write_state(rows)

        local tab_shell, _, mux_window = wezterm.mux.spawn_window({
          workspace = name,
          cwd = path,
          args = tab_args(path, "fish -l"),
        })
        tab_shell:set_title("Shell")
        local tab_nvim = mux_window:spawn_tab({ cwd = path, args = tab_args(path, "nvim .") })
        tab_nvim:set_title("Nvim")
        local tab_serve = mux_window:spawn_tab({ cwd = path, args = tab_args(path, "fish -l") })
        tab_serve:set_title("Serve")
        tab_nvim:activate()
      end

      window:perform_action(act.SwitchToWorkspace({ name = name }), pane)
    end

    wezterm.on('format-tab-title', function(tab)
      local title = tab.tab_title
      if not title or #title == 0 then
        title = tab.active_pane.title
      end

      if tab.is_active then
        return {
          { Foreground = { AnsiColor = "Yellow" } },
          { Text = string.format(" %d:%s ", tab.tab_index + 1, title) },
        }
      end

      return {
        { Text = string.format(" %d:%s ", tab.tab_index + 1, title) },
      }
    end)

    local active_workspace = nil

    local function sync_state(window, pane)
      local name = window:active_workspace()
      if name == active_workspace then return end
      active_workspace = name

      local rows = read_state()
      local found = false
      for _, row in ipairs(rows) do
        row.current = ""
        if row.name == name then
          found = true
          row.current = "current"
          row.epoch = os.time()
        end
      end
      if not found then
        rows[#rows + 1] = { name = name, path = cwd_of(pane), epoch = os.time(), current = "current" }
      end
      write_state(rows)
    end

    wezterm.on('update-status', function(window, pane)
      local f = io.open(dotfiles.choiceFile, 'r')
      if f then
        local choice = f:read('*all')
        f:close()
        os.remove(dotfiles.choiceFile)
        if choice and #choice > 0 then
          local name, path = choice:match("^([^|]+)|(.+)$")
          if name then switch_project(window, pane, name, path) end
        end
      end

      sync_state(window, pane)

      local workspace = window:active_workspace()
      local accent = window:leader_is_active() and 'Red' or 'Blue'
      window:set_left_status(wezterm.format({
        { Foreground = { AnsiColor = accent } },
        { Attribute = { Intensity = 'Bold' } },
        { Text = string.format("  %s: ", workspace) },
      }))
      window:set_right_status("")
    end)

    local function toggle_tool(window, pane, command, args, cwd)
      local mux_window = window:mux_window()
      for _, tab in ipairs(mux_window:tabs()) do
        for _, candidate in ipairs(tab:panes()) do
          local name = candidate:get_foreground_process_name() or ""
          if name:find(command, 1, true) then
            tab:activate()
            window:perform_action(act.CloseCurrentTab({ confirm = false }), candidate)
            return
          end
        end
      end

      local tab = mux_window:spawn_tab({ cwd = cwd, args = args })
      tab:activate()
    end

    local function open_tv(window, pane)
      os.remove(dotfiles.choiceFile)
      toggle_tool(window, pane, "tv", { "tv", dotfiles.channel }, nil)
    end

    local function open_lazygit(window, pane)
      toggle_tool(window, pane, "lazygit", { "lazygit" }, cwd_of(pane))
    end

    local function open_opencode(window, pane)
      toggle_tool(window, pane, "opencode", { "opencode" }, cwd_of(pane))
    end

    local function last_workspace(window, pane)
      local rows = read_state()
      local current = window:active_workspace()
      local best = nil
      for _, row in ipairs(rows) do
        if row.name ~= current and row.current ~= "current" then
          if not best or row.epoch > best.epoch then best = row end
        end
      end
      if best then switch_project(window, pane, best.name, best.path) end
    end

    local copy_mode = wezterm.gui.default_key_tables().copy_mode
    table.insert(copy_mode, {
      key = 'y',
      mods = 'NONE',
      action = act.Multiple({
        { CopyTo = 'ClipboardAndPrimarySelection' },
        { CopyMode = 'Close' },
      }),
    })
    config.key_tables = { copy_mode = copy_mode }
  '';
}
