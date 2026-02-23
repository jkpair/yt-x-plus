# yt-x-plus

A fork of [yt-x](https://github.com/Benexl/yt-x) with additional features and improvements.

Browse YouTube from your terminal.
Plus other sites yt-dlp supports.
[yt-x-plus-demo.webm](https://github.com/user-attachments/assets/d6082b07-604d-47f5-936f-85b8cf4ed930)

## What's New in yt-x-plus

### Copy Link
Quickly copy a video's URL to your clipboard for sharing. Available in the video action menu under "Other". Supports `wl-copy` (Wayland), `xclip`, `xsel` (X11), and `pbcopy` (macOS).

### ESC Key Back Navigation
Pressing ESC in the Settings submenu now returns you to the main menu instead of doing nothing.

### yt-dlp Version Check
- On startup, yt-x-plus checks if your yt-dlp is up to date and warns you if it's outdated.
- A "Check yt-dlp Version" option is available in the Settings menu to check on demand.
- Uses the PyPI API with a 3-second timeout so startup isn't blocked by network issues.

### Safer Feed Refresh
The "Refresh" action in Your Feed no longer overwrites your current feed if the fetch fails (e.g. due to cookie locking from an open browser). You'll see a notification and keep your existing feed instead of a blank screen.

### Faster Feed Refresh
Feed refresh now limits the fetch to one page of results instead of downloading the entire feed, making it significantly faster.

---

## Features

- **Interactive Menu**: Text-based UI using `fzf` or `rofi` for seamless navigation.
- **YouTube-Specific Menus**: Access your feed, trending videos, playlists, watch later, subscriptions feed, liked videos, clips.
- **Playback Support**: Play videos and audio via `mpv` or `vlc`.
- **Search Functionality**: Search for videos, channels and playlists directly.
- **Channel Exploration**: Explore channels, including their videos, streams, podcasts, shorts, and playlists.
- **Saved Channels**: Bookmark your favorite channels for quick access, with support for importing existing subscriptions.
- **Saved Videos**: Save videos to watch later.
- **Mixes**: Generate and explore YouTube song mixes.
- **Yt-x Shell:** Run custom yt-dlp and mpv commands for downloading and viewing videos and playlists
- **Custom Playlists**: Save playlists for easier access.
- **Download Management**: Download videos, audio, and playlists using `yt-dlp`.
- **History & Recents**: Track your recent videos and search history.
- **Configuration Management**: Customize and manage configurations for yt-x, mpv and yt-dlp with ease.
- **Extensions:** Extend yt-x with your own custom ui and preview logic allowing more precise coverage of other sites that yt-dlp supports
- **Custom Commands:** Basically a simple way to achieve the same thing with extensions. A custom command is just a yt-dlp command that loads a playlist or playlist like json.
- **Miscellaneous Features**:
  - Shell completions for `bash`, `zsh`, and `fish`.
  - Desktop entry generation for easy access.

## Installation

### From this fork

```bash
# Clone and run directly
git clone https://github.com/jkpair/yt-x-plus.git
cd yt-x-plus
./yt-x

# Or copy to your PATH
cp yt-x ~/.local/bin/yt-x
```

### From upstream (original yt-x)

See the [upstream repository](https://github.com/Benexl/yt-x) for NixOS, AUR, and other installation methods.

## Dependencies

### Required

- [jq](https://github.com/jqlang/jq) - JSON parsing.
- [curl](https://curl.se/) - Download preview images.
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) - Fetch YouTube data.
- [fzf](https://github.com/junegunn/fzf) - Main UI navigation.
- [mpv](https://mpv.io/) - Video and audio playback.
- [ffmpeg](https://www.ffmpeg.org/) - Proper HLS stream downloading.
- [bash](https://www.gnu.org/software/bash/) - Script interpreter.
- [nerdfont](https://www.nerdfonts.com/) - for the icons

### Optional

- [gum](https://github.com/charmbracelet/gum) - Enhanced UI (highly recommended).
- [rofi](https://github.com/davatorium/rofi) - Alternate UI.
- **clipboard tool** (for Copy Link):
  - [wl-clipboard](https://github.com/bugaevc/wl-clipboard) - Wayland (recommended for Wayland sessions)
  - [xclip](https://github.com/astrand/xclip) - X11
  - [xsel](https://github.com/kfish/xsel) - X11
- **terminal image viewer:**
  - [chafa](https://github.com/hpjansson/chafa) - Cross-terminal image rendering (recommended).
  - [icat](https://sw.kovidgoyal.net/kitty/kittens/icat/) - recommended for kitty terminal and ghostty
  - [imgcat](https://github.com/danielgatis/imgcat)
- **terminal with image rendering support:**
  - [kitty](https://sw.kovidgoyal.net/kitty/) - currently has the best image rendering capabilities (recommended)
  - [wezterm](https://wezfurlong.org/wezterm/index.html)
  - [ghostty](https://github.com/ghostty-org/ghostty)

---

## Usage

```bash
# Launch the UI
yt-x

# Edit configuration
yt-x -e

# load an extension
# extensions are located at ~/.config/yt-x/extensions
# the extension name is the name of a file in the extensions folder
yt-x -x <extension-name>

# Specify player at runtime
yt-x --player <mpv/vlc>

# Set selector at runtime
yt-x -s <fzf/rofi>

# Specify Rofi theme path
yt-x --rofi-theme <path>

# Enable/disable preview
yt-x --preview / yt-x --no-preview

# Print desktop entry
yt-x -E

# Print shell completions
yt-x completions --bash
yt-x completions --zsh
yt-x completions --fish

# Update the script
yt-x --update

# Display help
yt-x --help
```

---

## Tips

### Enabling Imports of Subscriptions & Private Playlists

Set your preferred browser in the configuration file:

```ini
PREFERRED_BROWSER: firefox
```

To enable `mpv` to access private playlists and videos, add something like this to `mpv.conf` (you can also use the ui to edit `mpv.conf`):

```ini
ytdl-raw-options=cookies-from-browser=firefox

# --- bonus mpv tips ---

# define the quality for mpv to use
ytdl-format="bestvideo[vcodec^=avc1][height=1080]+bestaudio/best[vcodec^=avc1][height=1080]/bestvideo[vcodec^=avc1][height=720]+bestaudio/best[vcodec^=avc1][height=720]/best"

# defines where screenshots will be saved
screenshot-directory=~/Pictures/mpv_screenshots/

# enable hardware accelaration
hwdec=auto
vo=gpu

# for subs something like this
slang=en,eng,enUS,en-US
sub-auto=fuzzy
ytdl-raw-options=ignore-config=,sub-lang="en,eng,enUS,en-US",write-sub=,write-auto-sub=
```

To customise download options with yt-dlp you can add something like this to `yt-dlp.conf` (you can also use the ui to edit `yt-dlp.conf`)

```bash
-f bestvideo[vcodec^=avc1][height=1080]+bestaudio/best[vcodec^=avc1][height=1080]/bestvideo[vcodec^=avc1][height=720]+bestaudio/best[vcodec^=avc1][height=720]/best
--embed-chapters
--sponsorblock-mark all
--embed-metadata
--embed-thumbnail
--add-metadata
--embed-subs
--sub-lang en
--merge-output-format mkv
```

> [!TIP]
> I also recommend setting up a po token. read more here https://github.com/yt-dlp/yt-dlp/wiki/PO-Token-Guide
>
> Recommended plugin to help you with that https://github.com/Brainicism/bgutil-ytdlp-pot-provider

For additional enhancements, consider:

- [uosc](https://github.com/tomasklaen/uosc) for a modern `mpv` UI.
- [thumbfast](https://github.com/po5/thumbfast) for thumbnail timeline previews.

### Fixing "cannot decrypt cookies" error synchronizing subscriptions

If you find this error while trying to synchronize your YouTube subscriptions ("Miscellaneous" > "Sync YouTube Subscriptions" option in yt-x):

```bash
Syncing subscriptions... WARNING: cannot decrypt v11 cookies: no key found WARNING: [youtube:tab] unable to extract yt initial data; please report this issue on https://github.com/yt-dlp/yt-dlp/issues?q= , filling out the appropriate issue template. Confirm you are on the latest version using yt-dlp -U WARNING: [youtube:tab] Incomplete yt initial data received. Retrying (1/3)...
```

You can fix it by setting the [yt-dlp](https://github.com/yt-dlp/yt-dlp?tab=readme-ov-file#general-options) `--cookies-from-browser` option in your `yt-x.conf` file ("Edit Config." option in yt-x) to match your browser and profile. For example, if you use Brave's default profile with GNOME Keyring, configure this `PREFERRED_BROWSER` value in your `yt-x.conf` file:

```bash
PREFERRED_BROWSER: brave+gnomekeyring:Default
```

To find the correct `PREFERRED_BROWSER` value for your browser and profile, use the yt-dlp `--cookies-from-browser` option in terminal. In the previous example, with Brave and GNOME Keyring, the following command should correctly extract your Brave browsers cookies:

```bash
yt-dlp \
  --cookies-from-browser "brave+gnomekeyring:Default" \
  --skip-download \
  --flat-playlist \
  "https://www.youtube.com/feed/channels" \
```

In your tests, replace `brave+gnomekeyring:Default` with your browser and profile. For more details, refer to the [yt-dlp documentation](https://github.com/yt-dlp/yt-dlp?tab=readme-ov-file#general-options).

> [!NOTE]
> This is not an issue with yt-x itself, but rather with yt-dlp's ability to access browser cookies.

## Custom Playlists

Define custom playlists by editing `~/.config/yt-x/custom_playlists.json` (or use the UI):

```json
[
  {
    "name": "<playlist name>",
    "playlistUrl": "https://www.youtube.com/playlist?list=<playlist-id>",
    "playlistWatchUrl": "https://www.youtube.com/watch?list=<playlist-id>"
  }
]
```
## Theming
To change the default colorscheme, set `YT_X_FZF_OPTS` env var and give it custom fzf opts.

eg. (.bashrc)

```
#yt-x
export YT_X_FZF_OPTS=$FZF_DEFAULT_OPTS'
--color=fg:#e0def4,fg+:#e0def4,bg:#232136,bg+:#44415a
--color=hl:#3e8fb0,hl+:#9ccfd8,info:#f6c177,marker:#3e8fb0
--color=prompt:#eb6f92,spinner:#c4a7e7,pointer:#c4a7e7,header:#3e8fb0
--color=border:#44415a,label:#ea9a97,query:#f6c177
--border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
--marker=">" --pointer="◆" --separator="─" --scrollbar="│"'
```

## Extended search
 While searching, you can prefix your query with a `:command` to filter your search request: `:<command> your_query`. Only one command can be used per query.

### List of commands

| Command        | Description                                |
|----------------|--------------------------------------------|
| `:live`        | Show only live streams                     |
| `:today`       | Videos uploaded today                      |
| `:week`        | Videos uploaded this week                  |
| `:month`       | Videos uploaded this month                 |
| `:year`        | Videos uploaded this year                  |
| `:short`       | Short videos (< 4 minutes)                 |
| `:long`        | Long videos (> 4 minutes)                  |
| `:playlist`    | Show playlists only                        |
| `:movie`       | Movies                                     |
| `:hd`          | HD videos                                  |
| `:4k`          | 4K videos                                  |
| `:hdr`         | HDR videos                                 |
| `:subtitles`   | Videos with subtitles/CC                   |
| `:360`         | 360 videos                                 |
| `:vr`          | VR180 videos                               |
| `:3d`          | 3D videos                                  |
| `:local`       | Videos filtered by location                |

### Sorting Options
| Command        | Description                                |
|----------------|--------------------------------------------|
| `:views`       | Sort results by view count                 |
| `:rating`      | Sort results by rating                     |
| `:newest`      | Sort results by upload date                |

## Credits

Based on [yt-x](https://github.com/Benexl/yt-x) by [Benexl](https://github.com/Benexl).

## Support

Need help with the upstream project? Join the community on Discord:

<p align="center">
<a href="https://discord.gg/HBEmAwvbHV">
<img src="https://invidget.switchblade.xyz/C4rhMA4mmK">
</a>
</p>
