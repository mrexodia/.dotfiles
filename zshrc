# Add to the top of ~/.zshrc: source ~/.dotfiles/zshrc

# Enable colors
autoload -U colors && colors

# Initialize completion system
autoload -Uz compinit
compinit

# === COMPLETION CONFIGURATION ===

# Paste & Input Handling
zstyle :bracketed-paste-magic active-widgets 'self-*'  # Enable bracketed paste mode - quotes pasted text automatically

# Completion Caching & Performance
zstyle ':completion:*' cache-path ~/.cache/zsh          # Cache completion results for better performance
zstyle ':completion:*' use-cache yes                    # Enable completion caching

# Process & User Filtering
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w -w'  # Custom ps command for process completion
zstyle ':completion:*:*:*:users' ignored-patterns adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm ldap lp mail mailman mailnull man messagebus mldonkey mysql nagios named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp usbmux uucp vcsa wwwrun xfs '_*'  # Hide system users from completion

# Visual Styling
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'  # Color process listings (blue PIDs)
zstyle ':completion:*' list-colors 'di=1;36' 'ln=35' 'so=32' 'pi=33' 'ex=31' 'bd=34;46' 'cd=34;43' 'su=30;41' 'sg=30;46' 'tw=30;42' 'ow=30;43'  # File type colors in completion
zstyle ':completion:*:*:*:*:*' menu select              # Enable visual menu selection (arrow keys to navigate)

# Matching & Completion Behavior
# Case-insensitive completion with partial matching
zstyle ':completion:*' matcher-list \
    'm:{[:lower:]}={[:upper:]}' \
    '+r:|[._-]=* r:|=*' \
    '+l:|=*'
zstyle '*' single-ignored show                          # Show single ignored matches anyway
zstyle ':completion:*' special-dirs true                # Include '.' and '..' in directory completion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories  # cd completion priority order



# URL Handling (Advanced)
zstyle -e :url-quote-magic url-globbers $'zmodload -i zsh/parameter;\n\t reply=( noglob\n\t\t ${(k)galiases[(R)(* |)(noglob|urlglobber|globurl) *]:-}\n\t\t ${(k)aliases[(R)(* |)(noglob|urlglobber|globurl) *]:-} )'  # Handle URL globbing patterns
zstyle :urlglobber url-local-schema ftp file            # Local URL schemas for globbing
zstyle ':url-quote-magic:*' url-metas '*?[]^(|)~#{}='   # Characters to quote in URLs
zstyle :urlglobber url-other-schema http https ftp      # Remote URL schemas for globbing
zstyle -e ':url-quote-magic:*' url-seps 'reply=(";&<>${histchars[1]}")'  # URL separator characters

# === COMPLETION & NAVIGATION ===
setopt alwaystoend        # When completing, move cursor to end of word even if completion was in the middle
setopt autocd             # Type just a directory name to cd into it (no need to type 'cd')
setopt autopushd          # Automatically push directories onto the directory stack when changing dirs
setopt completeinword     # Allow completion in the middle of a word, not just at the end
setopt pushdignoredups    # Don't push duplicate directories onto the directory stack
setopt pushdminus         # Make 'cd -n' go to the nth directory in the stack (instead of 'cd +n')

# === HISTORY MANAGEMENT ===
HISTSIZE=5000               # Number of commands to keep in memory during the session
HISTFILE=~/.zsh_history     # Where to save the history file
SAVEHIST=5000               # Number of commands to save to the history file
HISTDUP=erase               # Remove older duplicate commands when adding new ones
setopt appendhistory        # Append to history file instead of overwriting it
setopt extendedhistory      # Save timestamp and duration with each command in history
setopt histexpiredupsfirst  # When trimming history, remove duplicates first before unique entries
setopt histignoredups       # Don't save duplicate commands consecutively in history
setopt histignorespace      # Don't save commands that start with a space
setopt histverify           # Show the command from history expansion before executing (useful for '!!' etc.)
setopt incappendhistory     # Add commands to history immediately (not just at shell exit)
setopt hist_ignore_all_dups # Don't save any duplicate commands in history
setopt hist_save_no_dups    # Don't save duplicates to the history file
setopt hist_find_no_dups    # Don't show duplicates when searching history

# === INTERFACE & DISPLAY ===
#setopt nobeep              # Disable audible bell completely
setopt noflowcontrol       # Disable Ctrl+S/Ctrl+Q flow control (so Ctrl+S can be used for other things)
setopt interactivecomments # Allow '#' comments in interactive shell
setopt longlistjobs        # Show more details in job listings ('jobs -l' format by default)

# === PROMPT ===
setopt promptsubst        # Allow parameter expansion, command substitution, and arithmetic expansion in prompts

# Prompt configuration
# Shows red path if root, green if regular user, followed by %
PROMPT='%(!.%{$fg[red]%}.%{$fg[green]%})%~%{$reset_color%} %% '
