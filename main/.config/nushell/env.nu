# Environment for every nushell session. Runs before config.nu.

use std/util "path add"

$env.EDITOR = "nvim"
$env.TERMINAL = "kitty"

path add ($nu.home-dir | path join ".hunk" "bin")
path add ($nu.home-dir | path join ".opencode" "bin")
path add ($nu.home-dir | path join ".local" "bin")
path add ($nu.home-dir | path join "go" "bin")
path add --append "/snap/bin"

# Prompt, jumping, completions and runtimes ship their own nushell snippets.
# They are generated into the vendor autoload dir, which nushell sources after
# config.nu, and are not tracked in dotfiles because they hard-code paths and
# change between releases. Rerun this after upgrading any of these tools.
def refresh-integrations [] {
    let dir = ($nu.data-dir | path join "vendor" "autoload")
    mkdir $dir
    if (which starship | is-not-empty) {
        starship init nu | save --force ($dir | path join "starship.nu")
    }
    if (which zoxide | is-not-empty) {
        zoxide init nushell --cmd cd | save --force ($dir | path join "zoxide.nu")
    }
    if (which carapace | is-not-empty) {
        carapace _carapace nushell | save --force ($dir | path join "carapace.nu")
    }
    # --shims, not plain `mise activate nu`: the nu activation script bakes the
    # PATH of the session that generated it into a string literal and reassigns
    # $env.PATH from it on every launch, so whatever zsh happened to export
    # would be pinned into every nu session forever. The shims line prepends to
    # the live PATH instead. Trade-off: no per-directory [env] from mise.toml.
    if (which mise | is-not-empty) {
        mise activate nu --shims | save --force ($dir | path join "mise.nu")
    }
}

# zoxide's hook sets $env.__zoxide_hooked = true, which child processes inherit
# as the string "true". A nested nu (nvim :terminal, tmux) then fails its
# `not` check with "can't convert string to boolean". Hooks live in
# $env.config, which is not inherited, so each nu must install its own anyway.
hide-env --ignore-errors __zoxide_hooked

if not ($nu.data-dir | path join "vendor" "autoload" "starship.nu" | path exists) {
    refresh-integrations
}
