# yt-x Themes

yt-x supports a comprehensive theming system that allows you to customize colors, icons, and UI elements.

## Quick Start

1. **Set your theme** in `~/.config/yt-x/yt-x.conf`:
   ```
   THEME: everforest-dark-hard
   ```

2. **Available themes:**
   - `everforest-dark-hard` (default)
   - `tokyo-night`
   - `catppuccin-mocha`
   - `gruvbox-dark`
   - `dracula`

3. **Restart yt-x** to apply the theme.

## Theme Locations

Themes are loaded from these locations (in order of priority):

1. **User themes:** `~/.config/yt-x/themes/`
2. **Built-in themes:** `<yt-x-install-dir>/themes/`

User themes with the same name will override built-in themes.

## Creating Custom Themes

### 1. Copy a Template

```bash
cp ~/.config/yt-x/themes/everforest-dark-hard.theme ~/.config/yt-x/themes/my-theme.theme
```

### 2. Edit Your Theme

Theme files use simple shell variable syntax:

```bash
# Theme metadata (optional)
THEME_NAME="My Custom Theme"
THEME_AUTHOR="Your Name"
THEME_VERSION="1.0"

# Terminal colors using ANSI 256-color codes
COLOR_RED='\033[38;5;167m'
COLOR_GREEN='\033[38;5;142m'
# ... etc

# FZF colors
FZF_COLORS='
  --color=fg:#d3c6aa,bg:#272e33
  # ... etc
'
```

### 3. Apply Your Theme

```
THEME: my-theme
```

## Theme Variables Reference

### Terminal Colors

| Variable | Purpose | Default (Everforest) |
|----------|---------|---------------------|
| `COLOR_RED` | Errors, exit buttons | `#e67e80` |
| `COLOR_GREEN` | Success, confirmations | `#a7c080` |
| `COLOR_YELLOW` | Highlights, warnings | `#dbbc7f` |
| `COLOR_BLUE` | Info, links, library | `#7fbbb3` |
| `COLOR_MAGENTA` | Special highlights | `#d699b6` |
| `COLOR_CYAN` | Primary actions | `#83c092` |
| `COLOR_ORANGE` | Custom items | `#e69875` |
| `COLOR_GRAY` | Separators, dim text | `#7a8478` |
| `COLOR_WHITE` | Primary foreground | `#d3c6aa` |
| `COLOR_DIM` | Dimmed text | `#859289` |

### Text Styles

| Variable | Purpose |
|----------|---------|
| `STYLE_BOLD` | Bold text |
| `STYLE_DIM` | Dimmed text |
| `STYLE_ITALIC` | Italic text |
| `STYLE_RESET` | Reset all styles |

### FZF Theme

The `FZF_COLORS` and `FZF_STYLE` variables control the fzf selector appearance:

```bash
FZF_COLORS='
  --color=fg:#d3c6aa,fg+:#d3c6aa,bg:#272e33,bg+:#3c4841
  --color=hl:#a7c080,hl+:#a7c080,info:#83c092,marker:#a7c080
  --color=prompt:#e67e80,spinner:#d699b6,pointer:#d699b6,header:#7fbbb3
  --color=border:#4f5b58,label:#d3c6aa,query:#d3c6aa
  --color=gutter:#272e33,scrollbar:#4f5b58
'

FZF_STYLE='
  --border="rounded" --preview-window="border-rounded"
  --prompt="  " --marker=" " --pointer="▌"
  --separator="─" --scrollbar="▐" --info="inline-right"
'
```

See [fzf color docs](https://github.com/junegunn/fzf/wiki/Color-schemes) for more options.

### Icons (Nerd Font Required)

| Variable | Default | Used For |
|----------|---------|----------|
| `ICON_HOME` | `󰋜` | Your Feed |
| `ICON_SEARCH` | `` | Search |
| `ICON_PLAYLIST` | `󰐑` | Playlists |
| `ICON_WATCH_LATER` | `` | Watch Later |
| `ICON_LIKED` | `` | Liked Videos |
| `ICON_SAVED` | `` | Saved Videos |
| `ICON_HISTORY` | `` | Watch History |
| `ICON_RECENT` | `` | Recent |
| `ICON_SUBSCRIPTION` | `󰵀` | Subscription Feed |
| `ICON_CHANNEL` | `󰑈` | Channels |
| `ICON_CUSTOM` | `` | Custom Playlists |
| `ICON_CLIPS` | `` | Clips |
| `ICON_SETTINGS` | `` | Settings |
| `ICON_CONFIG` | `` | Edit Config |
| `ICON_EXIT` | `󰈆` | Exit |
| `ICON_PLAY` | `` | Play |
| `ICON_DOWNLOAD` | `` | Download |
| `ICON_AUDIO` | `` | Audio |

### Box Drawing Characters

| Variable | Default | Purpose |
|----------|---------|---------|
| `BOX_TOP_LEFT` | `╭` | Box corner |
| `BOX_TOP_RIGHT` | `╮` | Box corner |
| `BOX_BOTTOM_LEFT` | `╰` | Box corner |
| `BOX_BOTTOM_RIGHT` | `╯` | Box corner |
| `BOX_HORIZONTAL` | `─` | Horizontal lines |
| `BOX_VERTICAL` | `│` | Vertical lines |
| `BOX_SEPARATOR` | `┈` | Section separators |

## Converting Hex Colors to 256-Color

Use this formula to find the nearest 256-color code:

```bash
# For a hex color like #e67e80:
# R=230, G=126, B=128

# Online converters:
# https://www.ditig.com/256-colors-cheat-sheet

# Common mappings:
# 167 = soft red     (#d75f5f)
# 142 = soft green   (#afaf00)
# 179 = warm yellow  (#d7af5f)
# 109 = teal blue    (#87afaf)
# 175 = soft purple  (#d787af)
# 108 = cyan/aqua    (#87af87)
# 173 = orange       (#d7875f)
```

## Tips

1. **Test incrementally:** Change one color at a time to see its effect.

2. **Match your terminal:** Use the same colors as your terminal emulator theme for consistency.

3. **Contrast matters:** Ensure sufficient contrast between foreground and background colors.

4. **Nerd Fonts:** Icons require a [Nerd Font](https://www.nerdfonts.com/) installed.

## Sharing Themes

Found a cool combination? Consider submitting your theme to the yt-x repository!

1. Fork the repo
2. Add your `.theme` file to the `themes/` directory
3. Submit a pull request

Include a screenshot of your theme in action for the PR description.
