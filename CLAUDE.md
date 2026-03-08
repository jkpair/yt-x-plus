# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

yt-x is a terminal-based YouTube browser and downloader written in pure Bash (~2,500 lines). It provides an interactive TUI for browsing YouTube, searching, streaming videos, downloading content, and managing playlists using fzf/rofi, yt-dlp, and mpv/vlc.

## Build & Run Commands

```bash
# Run directly
./yt-x

# Nix development shell (includes all dependencies)
nix develop

# Nix build
nix build

# Install via Nix
nix profile install github:jkpair/yt-x-plus

# Debug mode
YT_X_DEBUG=1 ./yt-x
```

## Common CLI Options

```bash
./yt-x --search "query"           # Direct search
./yt-x -x <extension>             # Load extension (name or full path)
./yt-x --player mpv|vlc           # Set video player
./yt-x --selector fzf|rofi        # Set UI selector
./yt-x --preview / --no-preview   # Toggle video preview
./yt-x --theme <name>             # Set color theme
./yt-x --list-themes              # List available themes
./yt-x -e                         # Edit config file
./yt-x completions --fish|bash|zsh # Generate shell completions
```

## Architecture

**Single-file Bash script** (`yt-x`) containing all functionality:

1. **Initialization (lines 1-39):** Platform detection, directory setup
2. **Configuration (lines 40-287):** `load_config()`, `build_ytdlp_opts()`
3. **Utilities (lines 288-930):** UI functions (`launcher()`, `launcher_with_preview()`), preview generation, notifications, yt-dlp wrapper
4. **Core Logic (lines 931-1460):** `playlist_explorer()`, `channels_explorer()`, `playlists_explorer()`
5. **Main Menu & CLI (lines 1539+):** `main()` loop, argument parsing

**Extension System:** Extensions in `~/.config/yt-x/extensions/` are sourced into the script and can override `main()`. Examples in `extensions/` directory.

## Key Functions

- `main()` - Main menu loop with all features
- `launcher()` / `launcher_with_preview()` - fzf/rofi menu selection
- `run_yt_dlp()` - Execute yt-dlp with configured options
- `playlist_explorer()` - Browse and play videos from playlists/search results
- `channels_explorer()` - Browse channel content
- `load_config()` - Load configuration from `~/.config/yt-x/yt-x.conf`

## Key Variables

```bash
CLI_CONFIG_DIR="${XDG_CONFIG_HOME:-"$HOME"/.config}/$CLI_NAME"
CLI_EXTENSION_DIR="$CLI_CONFIG_DIR/extensions"
CLI_THEMES_DIR="$CLI_CONFIG_DIR/themes"
CLI_BUILTIN_THEMES_DIR="$CLI_DIR/themes"
CLI_CACHE_DIR="${XDG_CACHE_HOME:-"$HOME"/.cache}/$CLI_NAME"
```

## Theme System

yt-x supports a comprehensive theming system. Themes define terminal colors, fzf styling, and icons.

**Built-in themes:** `everforest-dark-hard` (default), `tokyo-night`, `catppuccin-mocha`, `gruvbox-dark`, `dracula`

**Theme locations:**
- User themes: `~/.config/yt-x/themes/`
- Built-in themes: `<yt-x-dir>/themes/`

**Key functions:**
- `load_theme()` - Load a theme file and set colors
- `list_themes()` - List all available themes
- `init_pretty_print()` - Initialize colors (uses theme system)

**Configuration:** Set `THEME: <name>` in `~/.config/yt-x/yt-x.conf`

See `themes/README.md` for creating custom themes.

## Dependencies

**Required:** yt-dlp, jq, fzf, mpv, ffmpeg, bash, nerdfont
**Optional:** gum, rofi, chafa/icat/imgcat (image preview)

## Search Filters

Append to search queries: `:hour`, `:today`, `:week`, `:month`, `:year` (time), `:video`, `:movie`, `:live`, `:short`, `:long` (type), `:4k`, `:hd` (quality), `:views`, `:rating`, `:newest` (sort)

## Commit Convention

Uses conventional commits: `feat:`, `fix:`, `chore:`, `docs:`, `refactor:`
Changelog generated via git-cliff (`cliff.toml`)
