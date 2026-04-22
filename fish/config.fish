# 1. Basics & Environment
echo HI
clear

set -g fish_greeting "" # Set to empty string
set -g fish_color_valid_path # Needs a color value if you want it set

# 2. Colors (-U is universal, -g is global)
set -U fish_color_error red
set -U fish_color_command blue
set -U fish_color_normal white

# Set LS_COLORS (Global Export)
set -gx LS_COLORS "di=01;31:fi=00;34"

alias -s ls='eza'

# 3. Prompt Function
function fish_prompt
    set_color -o 3daee9
    echo -n (prompt_pwd)
    set_color -o yellow --bold
    echo -n " > "
    set_color normal
end

# 4. Abbreviations (Format: abbr -a nickname command)
abbr -a waybar.conf "nvim ~/.config/waybar/"
abbr -a rofi.conf "nvim ~/.config/rofi/"
abbr -a fish.conf "nvim ~/.config/fish/config.fish" # Pointed to the file, not folder
abbr -a kitty.conf "nvim ~/.config/kitty/"
abbr -a sway.conf "nvim ~/.config/sway/"
abbr -a my.ip "python ~/.config/fish/bash/ip.py"
abbr -a my.info "python ~/.config/fish/bash/my.py"
abbr -a cls clear
abbr -a find fzf

if status is-login
    if test (tty) = /dev/tty1
        exec sway
    end
end
