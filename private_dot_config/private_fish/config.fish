if status is-interactive

# Variables
set -gx EDITOR micro

# Abbreviations
abbr -a grep rg
abbr -a aria aria2c
abbr -a ai aichat -e
abbr -a cd z
abbr -a ls eza -a --icons --group-directories-first --no-quotes
abbr -a e eza -a --icons --group-directories-first --no-quotes
abbr -a c wl-copy
abbr -a p wl-paste

# Sources
zoxide init fish | source
fish_add_path /home/linuxbrew/.linuxbrew/bin; true

end


