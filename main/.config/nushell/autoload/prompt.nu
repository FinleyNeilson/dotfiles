# Right-prompt placement for starship's right_format (the clock). This lives in
# the user autoload dir because nushell sources it after the vendor autoload
# dir, so it runs after starship.nu, which would otherwise override both.

# starship.nu turns this on, which puts the clock beside the ❯ line; p10k-pure
# keeps it on the first line, next to the path.
$env.config.render_right_prompt_on_last_line = false

# reedline erases the right prompt once a command is accepted. Redrawing it as
# a transient prompt keeps the clock in the scrollback, as zsh does. It is
# re-run on Enter, so it shows when the command was run rather than when the
# prompt was drawn.
$env.TRANSIENT_PROMPT_COMMAND_RIGHT = $env.PROMPT_COMMAND_RIGHT
