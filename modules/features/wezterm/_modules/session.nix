{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "wezterm-session" ''
      set -eo pipefail

      state_dir="$HOME/.local/state/wezterm"
      if [ -n "$XDG_STATE_HOME" ]; then state_dir="$XDG_STATE_HOME/wezterm"; fi
      state="$state_dir/sessions.tsv"
      choice="/tmp/wezterm-tv-choice"
      if [ -n "$WEZTERM_CHOICE_FILE" ]; then choice="$WEZTERM_CHOICE_FILE"; fi

      mkdir -p "$state_dir"
      touch "$state"

      normalize() {
        local entry="$1" path name
        if [[ "$entry" == *"|"* ]]; then
          printf '%s\n' "$entry"
          return
        fi
        path="$(printf '%s' "$entry" | sed "s|^~|$HOME/|")"
        [[ "$path" == /* ]] || path="$HOME/$path"
        name="$(printf '%s' "$path" | sed "s|^$HOME|~|")"
        printf '%s|%s\n' "$name" "$path"
      }

      cmd="$1"
      mode="$2"
      if [ -z "$mode" ]; then mode=all; fi

      case "$cmd" in
        list)
          {
            case "$mode" in
              all|workspaces)
                sort -k3,3nr "$state" | awk -F '\t' 'NF >= 2 && $1 !~ /^[[:space:]]/ && $1 !~ /\// { print $1 "|" $2 }'
                ;;
            esac
            case "$mode" in
              configs)
                fd -H -d 1 -t d . "$HOME/.config" | while IFS= read -r path; do normalize "$path"; done
                ;;
            esac
            case "$mode" in
              all|zoxide)
                zoxide query -l | while IFS= read -r path; do normalize "$path"; done
                ;;
            esac
            case "$mode" in
              dirs)
                fd -H -d 2 -t d -E .Trash . "$HOME" | while IFS= read -r path; do normalize "$path"; done
                ;;
            esac
          } | awk '!seen[$0]++'
          ;;
        preview)
          entry="$(normalize "$2")"
          path="$(printf '%s' "$entry" | cut -d'|' -f2-)"
          if [ -d "$path" ]; then
            eza -1 -a --icons=always --color=always "$path" 2>/dev/null || ls -1A "$path"
          fi
          ;;
        connect)
          entry="$(normalize "$2")"
          name="$(printf '%s' "$entry" | cut -d'|' -f1)"
          path="$(printf '%s' "$entry" | cut -d'|' -f2-)"
          name="$(basename "$name")"
          target="$3"
          if [ -z "$target" ]; then target="$choice"; fi
          printf '%s|%s' "$name" "$path" > "$target"
          ;;
        kill)
          entry="$(normalize "$2")"
          name="$(printf '%s' "$entry" | cut -d'|' -f1)"
          name="$(basename "$name")"
          awk -F '\t' -v n="$name" '$1 != n' "$state" > "$state.tmp" && mv "$state.tmp" "$state"
          wezterm cli list 2>/dev/null | awk -v ws="$name" '$4 == ws { print $3 }' | xargs -r -I{} wezterm cli kill-pane --pane-id {}
          ;;
      esac
    '')
  ];
}
