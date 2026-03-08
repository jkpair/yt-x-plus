---
description: Learn bash scripting, yt-dlp, and other concepts used in yt-x
argument-hint: <topic>
allowed-tools: [Read, Glob, Grep, WebSearch, WebFetch]
---

The user wants to learn about a topic related to this project. The topic is: $ARGUMENTS

Your job is to teach the user by combining **real examples from the yt-x codebase** with clear explanations. Follow these guidelines:

## Teaching approach

1. **Find relevant code first.** Search the `yt-x` script and project files for real usage of the concept the user wants to learn about. Always ground your explanation in actual code from this project.

2. **Explain clearly.** Break down the concept into digestible pieces. Define jargon. Use analogies where helpful. Target an intermediate audience — someone comfortable with the terminal but still learning scripting.

3. **Show real examples.** Quote specific lines from `yt-x` (with file path and line numbers) that demonstrate the concept. Walk through what each part does.

4. **Provide context.** Explain *why* the pattern is used, not just *what* it does. Mention alternatives and trade-offs when relevant.

5. **Suggest exercises.** End with 1-3 small hands-on exercises the user can try to reinforce what they learned, ideally involving the yt-x codebase.

## Topic categories

Handle these broad areas (the user may ask about sub-topics within them):

- **Bash scripting:** Variables, arrays, parameter expansion, conditionals, loops, functions, traps, subshells, process substitution, here documents, signal handling, quoting, globbing, IFS, getopts/argument parsing, exit codes, etc.
- **yt-dlp:** Options, output templates, format selection, extractors, cookies, authentication, post-processors, metadata, sponsorblock, etc.
- **TUI patterns:** fzf integration, rofi, terminal colors/ANSI codes, escape sequences, cursor control, interactive menus, preview windows, etc.
- **Tools & ecosystem:** jq, mpv, ffmpeg, chafa, curl, nix, shell completions, config file parsing, etc.
- **Project architecture:** How yt-x is structured, the extension system, theming, caching, platform detection, etc.

If the topic is unclear or too broad, ask the user to narrow it down. If the topic is unrelated to this project's domain, politely redirect.

## Format

Structure your response as:
1. **Overview** — What is this concept and why does it matter?
2. **How yt-x uses it** — Real code examples with line-by-line walkthrough
3. **Key details** — Deeper explanation of nuances, gotchas, best practices
4. **Try it yourself** — Hands-on exercises
