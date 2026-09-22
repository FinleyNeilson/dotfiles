# Interactive nushell settings. The prompt (starship), cd (zoxide),
# completions (carapace) and runtimes (mise) are autoloaded from
# ($nu.data-dir)/vendor/autoload; regenerate them with `refresh-integrations`.

$env.config.show_banner = false
$env.config.edit_mode = "vi"
$env.config.buffer_editor = "nvim"

# Cursor shapes are named explicitly. "inherit" means "emit no escape sequence",
# so an inherited insert mode never undoes the underscore normal mode just set
# and the cursor stays an underscore forever. block is kitty's own default.
$env.config.cursor_shape.emacs = "block"
$env.config.cursor_shape.vi_insert = "block"
$env.config.cursor_shape.vi_normal = "underscore"

# The prompt character, p10k-pure's magenta arrow, flipped by keymap: down for
# insert, up for normal. It opens with the newline that makes the prompt two
# lines: starship.toml omits both $character and the trailing $line_break and
# leaves them to reedline, because starship's nu integration never passes the keymap
# through, so its own vimcmd_symbol can never fire. These are closures rather
# than plain strings so the red-on-failure colouring of [character].error_symbol
# survives the move; reedline evaluates them once per prompt, then swaps between
# the two on each mode change without re-running them.
def prompt-char [symbol: string] {
    let colour = if $env.LAST_EXIT_CODE == 0 { (ansi magenta) } else { (ansi red) }
    $"\n($colour)($symbol)(ansi reset) "
}
$env.PROMPT_INDICATOR_VI_INSERT = {|| prompt-char "❯" }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| prompt-char "❮" }

$env.config.history.file_format = "sqlite"
$env.config.history.max_size = 100_000
$env.config.history.isolation = false

# Case-insensitive fuzzy matching, like the zsh matcher-list + fzf-tab pairing
$env.config.completions.algorithm = "fuzzy"
$env.config.completions.case_sensitive = false

# ^p / ^n walk history, as in .zshrc. ^o opens the line in $EDITOR (zsh had ^Xe).
# Kept on the insert keymap so they survive the switch to vi editing.
$env.config.keybindings = [
    {
        name: history_previous
        modifier: control
        keycode: char_p
        mode: [emacs, vi_insert]
        event: { send: PreviousHistory }
    }
    {
        name: history_next
        modifier: control
        keycode: char_n
        mode: [emacs, vi_insert]
        event: { send: NextHistory }
    }
    # reedline gives vi_insert 44 default bindings against emacs's 64, and ^u
    # (cut to line start) is one it drops, so switching edit_mode to vi loses it.
    # Rebound here; emacs already has it and is left alone.
    {
        name: cut_line_from_start
        modifier: control
        keycode: char_u
        mode: [vi_insert]
        event: { edit: CutFromStart }
    }
    # ^f accepts the greyed-out history hint, as with zsh-autosuggestions.
    # Falls through to a plain cursor move when there is no hint.
    {
        name: accept_history_hint
        modifier: control
        keycode: char_f
        mode: [emacs, vi_insert]
        event: {
            until: [
                { send: HistoryHintComplete }
                { edit: MoveRight }
            ]
        }
    }
]

alias vim = nvim
alias ta = tmux a
alias ts = tmux new-session -s main

# Hunk review with a live session, so Claude's notes can be replied to with R.
# The prefix+g popup is the read-only view. No --watch: a reload throws away a
# half-written note if its file's diff changed, so reload by hand with r
# between notes instead of whenever Claude saves a file.
alias hr = hunk diff

# nushell's own ls is a table; these keep the muscle memory
alias a = ls --all
alias l = ls
alias la = ls --all --long
alias lt = eza --tree --level=2 --long --icons --git

def --env mkcd [dir: string] {
    mkdir $dir
    cd $dir
}

# nnn, cd-ing to wherever it was left on quit
def --env n [...args: string] {
    if (($env.NNNLVL? | default "0" | into int) > 0) {
        print "nnn is already running"
        return
    }

    let config_home = ($env.XDG_CONFIG_HOME? | default ($nu.home-dir | path join ".config"))
    let tmpfile = ($config_home | path join "nnn" ".lastd")

    with-env { NNN_TMPFILE: $tmpfile } { ^nnn -e ...$args }

    if ($tmpfile | path exists) {
        # nnn writes a line like: cd '/some/path'
        let target = (open --raw $tmpfile | str trim | str replace --regex "^cd\\s+" "" | str trim --char "'")
        rm --force $tmpfile
        if ($target | is-not-empty) { cd $target }
    }
}
